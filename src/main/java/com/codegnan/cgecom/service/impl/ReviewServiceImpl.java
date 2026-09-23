package com.codegnan.cgecom.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codegnan.cgecom.model.Product;
import com.codegnan.cgecom.model.Review;
import com.codegnan.cgecom.repositories.ProductRepository;
import com.codegnan.cgecom.repositories.ReviewRepository;
import com.codegnan.cgecom.service.iface.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private ReviewRepository reviewRepository;

    @Autowired
    private ProductRepository productRepository;

    @Override
    public Review saveReview(Review review) {
        Review savedReview = reviewRepository.save(review);
        
        // Automatically update the product's average rating based on all its reviews
        if (savedReview.getProductId() != null) {
            updateProductAverageRating(savedReview.getProductId());
        }
        
        return savedReview;
    }

    @Override
    public List<Review> getReviewsByProductId(Long productId) {
        return reviewRepository.findByProductId(productId);
    }

    private void updateProductAverageRating(Long productId) {
        List<Review> reviews = reviewRepository.findByProductId(productId);
        Product product = productRepository.findById(productId.intValue()).orElse(null);

        if (product != null) {
            if (reviews.isEmpty()) {
                product.setRating(0.0);
            } else {
                double sum = 0;
                for (Review r : reviews) {
                    sum += r.getRating();
                }
                double average = sum / reviews.size();
                // Round off to 1 decimal place (e.g., 4.3)
                double roundedAverage = Math.round(average * 10.0) / 10.0;
                product.setRating(roundedAverage);
            }
            productRepository.save(product);
        }
    }
}