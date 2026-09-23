package com.codegnan.cgecom.repositories;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.codegnan.cgecom.model.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {

    List<Product> findByActiveTrue();

    // Best value: Active products with a discount of 10% or more
    List<Product> findByActiveTrueAndDiscountPercentGreaterThanEqual(double discountPercent);

    // Trending: Active products with a high rating (e.g., >= 4.0)
    List<Product> findByActiveTrueAndRatingGreaterThanEqual(double rating);
}