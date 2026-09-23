package com.codegnan.cgecom.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codegnan.cgecom.model.Order;
import com.codegnan.cgecom.model.User;
import com.codegnan.cgecom.service.iface.OrderService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private OrderService orderService;

    @GetMapping("/dashboard")
    public String adminDashboard(HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null && "ADMIN".equals(loggedInUser.getRole())) {
            return "admin-dashboard"; // Render the admin dashboard page
        } else {
            return "redirect:/login"; // Redirect non-admins to the login page
        }
    }

    @GetMapping("/payments")
    public String viewPayments(HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null || !"ADMIN".equals(loggedInUser.getRole())) {
            return "redirect:/login";
        }

        // Fetch all placed/paid orders to reflect in the admin payment list
        List<Order> orders = orderService.getAllOrders();
        model.addAttribute("orders", orders);
        
        return "admin-payments"; // Renders your admin payments JSP view
    }
}