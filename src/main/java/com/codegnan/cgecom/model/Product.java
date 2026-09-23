package com.codegnan.cgecom.model;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.MapKeyColumn;
import jakarta.persistence.Table;

@Entity
@Table(name = "product")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;
    @Column(columnDefinition = "TEXT")
    private String description;
    private double price;

    private double discountPercent;    // e.g. 10 = 10% off
    private int stockQuantity;
    private double rating;             // average rating

    // Soft-delete flag: false means the product is "deleted" from the storefront/admin
    private boolean active = true;

    @Column(name = "image_path")
    private String imagePath;

    // String representation for text-based input
    private String category;
    private String brand;

    // Flexible key/value specs
    @ElementCollection
    @CollectionTable(name = "product_specifications", joinColumns = @JoinColumn(name = "product_id"))
    @MapKeyColumn(name = "spec_key")
    @Column(name = "spec_value")
    private Map<String, String> specifications = new LinkedHashMap<>();

    // Temporary parallel arrays for the add/edit product forms
    private transient List<String> specKeys;
    private transient List<String> specValues;

    public List<String> getSpecKeys() { return specKeys; }
    public void setSpecKeys(List<String> specKeys) { this.specKeys = specKeys; }

    public List<String> getSpecValues() { return specValues; }
    public void setSpecValues(List<String> specValues) { this.specValues = specValues; }

    // Rebuilds the specifications map from spec name/value arrays
    public void applySpecInputsToMap() {
        Map<String, String> rebuilt = new LinkedHashMap<>();
        if (specKeys != null && specValues != null) {
            int size = Math.min(specKeys.size(), specValues.size());
            for (int i = 0; i < size; i++) {
                String key = specKeys.get(i);
                String value = specValues.get(i);
                if (key != null && !key.isBlank()) {
                    rebuilt.put(key.trim(), value == null ? "" : value.trim());
                }
            }
        }
        this.specifications = rebuilt;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public double getDiscountPercent() { return discountPercent; }
    public void setDiscountPercent(double discountPercent) { this.discountPercent = discountPercent; }

    public double getFinalPrice() {
        return price - (price * discountPercent / 100.0);
    }

    public int getStockQuantity() { return stockQuantity; }
    public void setStockQuantity(int stockQuantity) { this.stockQuantity = stockQuantity; }

    public boolean isAvailable() { return stockQuantity > 0; }

    public double getRating() { return rating; }
    public void setRating(double rating) { this.rating = rating; }

    public boolean isActive() { return active; }
    public void setActive(boolean active) { this.active = active; }

    public String getImagePath() { return imagePath; }
    public void setImagePath(String imagePath) { this.imagePath = imagePath; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public String getBrand() { return brand; }
    public void setBrand(String brand) { this.brand = brand; }

    public Map<String, String> getSpecifications() { return specifications; }
    public void setSpecifications(Map<String, String> specifications) { this.specifications = specifications; }
}