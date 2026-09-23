package com.codegnan.cgecom.service.iface;

import java.util.List;

import com.codegnan.cgecom.model.Review;

public interface ReviewService {
    Review saveReview(Review review);
    List<Review> getReviewsByProductId(Long productId);
}