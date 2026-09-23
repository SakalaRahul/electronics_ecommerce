package com.codegnan.cgecom.controllers;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codegnan.cgecom.model.Order;
import com.codegnan.cgecom.model.OrderItem;
import com.codegnan.cgecom.model.User;
import com.codegnan.cgecom.service.iface.OrderService;
import com.codegnan.cgecom.service.impl.RazorpayService;
import com.razorpay.Payment;
import com.razorpay.RazorpayClient;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/payment")
public class PaymentController {

    @Autowired
    private RazorpayService razorpayService;

    @Autowired
    private OrderService orderService;

    @Value("${razorpay.key.id}")
    private String razorpayKeyId;

    @Value("${razorpay.key.secret}")
    private String razorpayKeySecret;

    @PostMapping("/verify")
    public String verifyPayment(
            @RequestParam("razorpay_payment_id") String razorpayPaymentId,
            @RequestParam("razorpay_order_id") String razorpayOrderId,
            @RequestParam("razorpay_signature") String razorpaySignature,
            HttpSession session,
            Model model) {

        try {
            boolean valid = razorpayService.verifyPaymentSignature(
                    razorpayPaymentId,
                    razorpayOrderId,
                    razorpaySignature);

            if (!valid) {
                model.addAttribute("message", "Payment verification failed.");
                return "payment-success";
            }

            User loggedInUser = (User) session.getAttribute("loggedInUser");

            @SuppressWarnings("unchecked")
            List<OrderItem> cartItems = (List<OrderItem>) session.getAttribute("cartItems");

            if (loggedInUser == null || cartItems == null || cartItems.isEmpty()) {
                model.addAttribute("message", "Payment was received, but the cart session was unavailable.");
                return "payment-success";
            }

            // Fetch actual payment method (upi, card, netbanking, wallet) from Razorpay API
            String paymentMethodLabel = "Razorpay";
            try {
                RazorpayClient razorpay = new RazorpayClient(razorpayKeyId, razorpayKeySecret);
                Payment razorpayPayment = razorpay.payments.fetch(razorpayPaymentId);
                String rawMethod = razorpayPayment.get("method"); // e.g., "upi", "card", "netbanking"
                
                if (rawMethod != null) {
                    if (rawMethod.equalsIgnoreCase("upi")) {
                        paymentMethodLabel = "UPI";
                    } else if (rawMethod.equalsIgnoreCase("card")) {
                        paymentMethodLabel = "Card";
                    } else if (rawMethod.equalsIgnoreCase("netbanking")) {
                        paymentMethodLabel = "Netbanking";
                    } else if (rawMethod.equalsIgnoreCase("wallet")) {
                        paymentMethodLabel = "Wallet";
                    } else {
                        paymentMethodLabel = rawMethod.toUpperCase();
                    }
                }
            } catch (Exception ex) {
                System.out.println("Could not fetch payment method from Razorpay SDK: " + ex.getMessage());
            }

            Order order = new Order();
            order.setUser(loggedInUser);
            order.setOrderStatus("COMPLETED");

            order.setRazorpayPaymentId(razorpayPaymentId);
            order.setPaymentMethod(paymentMethodLabel);

            double totalPrice = 0;
            for (OrderItem item : cartItems) {
                item.setOrder(order);
                totalPrice += item.getPrice() * item.getQuantity();
            }

            order.setTotalPrice(BigDecimal.valueOf(totalPrice));
            order.setOrderItems(cartItems);

            // Save the order to the database
            orderService.saveOrder(order);

            if (!cartItems.isEmpty() && cartItems.get(0).getProduct() != null) {
                session.setAttribute("lastPurchasedProductId", cartItems.get(0).getProduct().getId());
            }

            session.removeAttribute("cartItems");

            model.addAttribute("paymentId", razorpayPaymentId);
            model.addAttribute("message", "Your payment was successful and your order has been placed.");

            return "payment-success";

        } catch (Exception e) {
            model.addAttribute("message", "Payment verification failed: " + e.getMessage());
            return "payment-success";
        }
    }
}