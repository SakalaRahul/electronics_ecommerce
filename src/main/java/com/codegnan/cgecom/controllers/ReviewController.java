package com.codegnan.cgecom.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codegnan.cgecom.model.Product;
import com.codegnan.cgecom.model.Review;
import com.codegnan.cgecom.model.User;
import com.codegnan.cgecom.service.iface.ProductService;
import com.codegnan.cgecom.service.iface.ReviewService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/review")
public class ReviewController {

    @Autowired
    private ReviewService reviewService;

    @Autowired
    private ProductService productService;

    @GetMapping("/add")
    public String showReviewForm(@RequestParam Long productId, Model model, HttpSession session) {
        try {
            System.out.println("Fetching product with ID: " + productId);
            Product product = productService.getProductById(productId.intValue());
            
            if (product == null) {
                System.out.println("Product not found for ID: " + productId);
                return "redirect:/products";
            }
            
            model.addAttribute("product", product);
            return "add-review"; // Make sure this matches your JSP filename in WEB-INF/views/
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/products";
        }
    }

    @GetMapping("/view")
    public String viewProductReviews(@RequestParam Long productId, Model model) {
        Product product = productService.getProductById(productId.intValue());
        if (product == null) {
            return "redirect:/products";
        }
        model.addAttribute("product", product);
        model.addAttribute("reviews", reviewService.getReviewsByProductId(productId));
        return "view-reviews"; 
    }

    @PostMapping("/save")
    public String saveReview(@RequestParam Long productId,
                             @RequestParam int rating,
                             @RequestParam String comment,
                             HttpSession session) {
        try {
            User user = (User) session.getAttribute("loggedInUser");
            String username = (user != null) ? user.getUsername() : "Anonymous";

            Review review = new Review();
            review.setProductId(productId);
            review.setUsername(username);
            review.setRating(rating);
            review.setComment(comment);

            reviewService.saveReview(review);

            session.removeAttribute("lastPurchasedProductId");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/products?reviewSuccess=true";
    }
}