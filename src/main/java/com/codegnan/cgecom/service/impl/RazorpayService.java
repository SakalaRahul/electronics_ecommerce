package com.codegnan.cgecom.service.impl;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.Utils;

@Service
public class RazorpayService {

    @Value("${razorpay.key}")
    private String razorpayKey;

    @Value("${razorpay.secret}")
    private String razorpaySecret;

    public String getKeyId() {
        return razorpayKey;
    }

    public Order createOrder(
            double amount,
            String currency,
            String receipt) throws Exception {

        if (razorpayKey == null
                || razorpayKey.isBlank()
                || razorpaySecret == null
                || razorpaySecret.isBlank()) {

            throw new IllegalStateException(
                    "Razorpay credentials are missing. "
                    + "Set RAZORPAY_KEY_ID and RAZORPAY_KEY_SECRET.");
        }

        // 1. Convert amount to paise using long to prevent integer overflow for large carts
        long amountInPaise = Math.round(amount * 100);

        // 2. Optional safety cap matching Razorpay limits (e.g., ₹5,00,000 = 50000000 paise)
        // Adjust this limit based on your Razorpay account settings if needed
        long maxAllowedPaise = 50000000L; 
        if (amountInPaise > maxAllowedPaise) {
            throw new IllegalArgumentException("Transaction amount exceeds the maximum allowed limit of ₹5,00,000.");
        }

        RazorpayClient client =
                new RazorpayClient(
                        razorpayKey,
                        razorpaySecret);

        JSONObject options = new JSONObject();

        // Pass as long/Number instead of forced int cast
        options.put("amount", amountInPaise);
        options.put("currency", currency);
        options.put("receipt", receipt);

        return client.orders.create(options);
    }

    public boolean verifyPaymentSignature(
            String paymentId,
            String orderId,
            String signature) throws Exception {

        JSONObject attributes = new JSONObject();

        attributes.put(
                "razorpay_payment_id",
                paymentId);

        attributes.put(
                "razorpay_order_id",
                orderId);

        attributes.put(
                "razorpay_signature",
                signature);

        return Utils.verifyPaymentSignature(
                attributes,
                razorpaySecret);
    }
}