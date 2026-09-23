package com.codegnan.cgecom.controllers;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.codegnan.cgecom.model.Product;
import com.codegnan.cgecom.model.User;
import com.codegnan.cgecom.service.iface.ProductService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProductController {

    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/products")
    public String showProductList(
            @RequestParam(value = "filter", required = false) String filter,
            HttpSession session,
            Model model) {

        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/login";
        }

        List<Product> products = productService.getProductsByFilter(filter);
        model.addAttribute("products", products);
        model.addAttribute("activeFilter", filter);
        return "product-list";
    }

    @GetMapping("/compare")
    public String compareProducts(
            @RequestParam(required = false) String ids,
            HttpSession session,
            Model model) {

        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/login";
        }

        List<Product> comparisonProducts = new ArrayList<>();

        if (ids != null && !ids.isBlank()) {
            Arrays.stream(ids.split(","))
                    .map(String::trim)
                    .filter(value -> value.matches("\\d+"))
                    .limit(3)
                    .forEach(value -> {
                        try {
                            comparisonProducts.add(productService.getProductById(Integer.parseInt(value)));
                        } catch (RuntimeException ignored) {
                            // Ignore deleted or invalid products.
                        }
                    });
        }

        model.addAttribute("comparisonProducts", comparisonProducts);
        return "compare";
    }

    @GetMapping("/products/add")
    public String showAddProductPage(HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null || !"ADMIN".equals(loggedInUser.getRole())) {
            return "redirect:/login";
        }

        model.addAttribute("product", new Product());
        return "add-product";
    }

    @PostMapping("/products/add")
    public String addNewProduct(
            @ModelAttribute Product product,
            @RequestParam("imageFile") MultipartFile imageFile) {

        try {
            if (imageFile != null && !imageFile.isEmpty()) {
                String uploadDir = "uploads/";
                String originalFilename = imageFile.getOriginalFilename();
                String uniqueFilename = System.currentTimeMillis() + "_" + originalFilename;

                Path uploadPath = Paths.get(uploadDir);
                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }

                try (InputStream inputStream = imageFile.getInputStream()) {
                    Path filePath = uploadPath.resolve(uniqueFilename);
                    Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
                }

                product.setImagePath("/uploads/" + uniqueFilename);
            }
        } catch (IOException e) {
            e.printStackTrace();
            return "redirect:/products/add?error=FileUploadFailed";
        }

        product.applySpecInputsToMap();
        productService.saveProduct(product);
        return "redirect:/products";
    }

    @GetMapping("/products/{id}")
    public String showProductDetails(
            @PathVariable int id,
            HttpSession session,
            Model model) {

        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/login";
        }

        Product product = productService.getProductById(id);
        model.addAttribute("product", product);
        
        return "product-details"; // Renders product-details.jsp
    }

    @GetMapping("/products/edit/{id}")
    public String showEditProductPage(
            @PathVariable int id,
            HttpSession session,
            Model model) {

        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null || !"ADMIN".equals(loggedInUser.getRole())) {
            return "redirect:/login";
        }

        Product product = productService.getProductById(id);

        if (product.getSpecifications() != null) {
            product.setSpecKeys(new ArrayList<>(product.getSpecifications().keySet()));
            product.setSpecValues(new ArrayList<>(product.getSpecifications().values()));
        }

        model.addAttribute("product", product);
        return "edit-product";
    }

    @PostMapping("/products/edit/{id}")
    public String updateProduct(
            @PathVariable int id,
            @ModelAttribute Product product,
            @RequestParam(value = "imageFile", required = false) MultipartFile imageFile) {

        Product existingProduct = productService.getProductById(id);
        
        try {
            if (imageFile != null && !imageFile.isEmpty()) {
                String uploadDir = "uploads/";
                String originalFilename = imageFile.getOriginalFilename();
                String uniqueFilename = System.currentTimeMillis() + "_" + originalFilename;

                Path uploadPath = Paths.get(uploadDir);
                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }

                try (InputStream inputStream = imageFile.getInputStream()) {
                    Path filePath = uploadPath.resolve(uniqueFilename);
                    Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
                }

                product.setImagePath("/uploads/" + uniqueFilename);
            } else {
                // Retain previous image path if no new file is uploaded
                product.setImagePath(existingProduct.getImagePath());
            }
        } catch (IOException e) {
            e.printStackTrace();
            return "redirect:/products/edit/" + id + "?error=FileUploadFailed";
        }

        product.applySpecInputsToMap();
        product.setId(id);
        product.setRating(existingProduct.getRating());

        productService.saveProduct(product);
        return "redirect:/products";
    }

    @GetMapping("/products/delete/{id}")
    public String deleteProduct(@PathVariable int id) {
        try {
            productService.deleteProduct(id);
        } catch (IllegalStateException e) {
            return "redirect:/products?error=ProductUsedInOrder";
        } catch (IllegalArgumentException e) {
            return "redirect:/products?error=ProductNotFound";
        }

        return "redirect:/products";
    }
}