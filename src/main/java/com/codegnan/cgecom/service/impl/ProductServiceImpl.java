package com.codegnan.cgecom.service.impl;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.codegnan.cgecom.model.Product;
import com.codegnan.cgecom.repositories.OrderItemRepository;
import com.codegnan.cgecom.repositories.ProductRepository;
import com.codegnan.cgecom.service.iface.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

    @Value("${file.upload-dir}")
    private String uploadDir;

    private final ProductRepository productRepository;
    private final OrderItemRepository orderItemRepository;

    public ProductServiceImpl(
            ProductRepository productRepository,
            OrderItemRepository orderItemRepository) {

        this.productRepository = productRepository;
        this.orderItemRepository = orderItemRepository;
    }

    @Override
    public List<Product> getAllProducts() {
        return productRepository.findByActiveTrue();
    }

    @Override
    public Product getProductById(int id) {
        Optional<Product> product =
                productRepository.findById(id);

        if (product.isPresent()) {
            return product.get();
        }

        throw new RuntimeException(
                "Product not found with ID: " + id);
    }

    @Override
    public void saveProduct(Product product) {
        // Automatically assign default rating and discount if not provided
        // so new products immediately show up in "Trending" and "Best value" filters.
        if (product.getRating() <= 0) {
            product.setRating(4.5); // Qualifies for "Trending" (>= 4.0)
        }
        
        if (product.getDiscountPercent() <= 0) {
            product.setDiscountPercent(15.0); // Qualifies for "Best value" (>= 10.0)
        }

        productRepository.save(product);
    }

    @Override
    public void deleteProduct(int id) {

        if (!productRepository.existsById(id)) {
            throw new IllegalArgumentException(
                    "Product not found with ID: " + id);
        }

        if (orderItemRepository.existsByProduct_Id(id)) {
            // Product has order history — soft delete so orders stay intact.
            Product product = productRepository.findById(id).get();
            product.setActive(false);
            productRepository.save(product);
            return;
        }

        productRepository.deleteById(id);
    }

    @Override
    public String saveProductImage(
            MultipartFile imageFile) throws IOException {

        Path path = Paths.get(
                uploadDir,
                imageFile.getOriginalFilename());

        Files.createDirectories(path.getParent());

        imageFile.transferTo(path);

        return path.toString();
    }

    @Override
    public List<Product> getProductsByFilter(String filter) {
        if ("best-value".equalsIgnoreCase(filter)) {
            return productRepository.findByActiveTrueAndDiscountPercentGreaterThanEqual(10.0);
        } else if ("trending".equalsIgnoreCase(filter)) {
            return productRepository.findByActiveTrueAndRatingGreaterThanEqual(4.0);
        } else {
            return productRepository.findByActiveTrue();
        }
    }
}