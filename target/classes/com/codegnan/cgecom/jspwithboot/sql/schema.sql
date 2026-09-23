-- Reference schema for manual setup / seeding.
-- Note: spring.jpa.hibernate.ddl-auto=update already creates/updates these tables
-- automatically from the JPA entities on startup. This script is kept for documentation,
-- for setting up a fresh RDS instance by hand, and for the seed data at the bottom.

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `order_items`;
DROP TABLE IF EXISTS `orders`;
DROP TABLE IF EXISTS `product_specifications`;
DROP TABLE IF EXISTS `product`;
DROP TABLE IF EXISTS `brand`;
DROP TABLE IF EXISTS `category`;
DROP TABLE IF EXISTS `users`;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE `users` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
);

INSERT INTO users (username, password, role, email, phone_number) VALUES
('admin', 'admin123', 'ADMIN', 'admin@nexora.com', '9999999999'),
('user', 'user123', 'USER', 'user@nexora.com', '8888888888');

CREATE TABLE `category` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
);

INSERT INTO category (name, description) VALUES
('Mobiles', 'Smartphones and feature phones'),
('Laptops', 'Laptops and notebooks'),
('Tablets', 'Tablets and iPads'),
('Televisions', 'Smart TVs and LED TVs'),
('Headphones', 'Wired and wireless headphones'),
('Smart Watches', 'Wearables and fitness trackers'),
('Cameras', 'DSLR, mirrorless and action cameras'),
('Gaming', 'Consoles and gaming accessories'),
('Accessories', 'Chargers, cables and other accessories');

CREATE TABLE `brand` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
);

INSERT INTO brand (name) VALUES ('Dell'), ('HP'), ('Lenovo'), ('Samsung'), ('Apple'), ('Sony'), ('OnePlus');

CREATE TABLE `product` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `price` double NOT NULL,
  `discount_percent` double DEFAULT 0,
  `stock_quantity` int DEFAULT 0,
  `rating` double DEFAULT 0,
  `active` BOOLEAN NOT NULL DEFAULT TRUE,
  `image_path` varchar(255) DEFAULT NULL,
  `category_id` BIGINT DEFAULT NULL,
  `brand_id` BIGINT DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`category_id`) REFERENCES category(`id`),
  FOREIGN KEY (`brand_id`) REFERENCES brand(`id`)
);

CREATE TABLE `product_specifications` (
  `product_id` BIGINT NOT NULL,
  `spec_key` varchar(100) NOT NULL,
  `spec_value` varchar(255) DEFAULT NULL,
  FOREIGN KEY (`product_id`) REFERENCES product(`id`)
);

CREATE TABLE `orders` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT,
  `total_price` DECIMAL(10, 2),
  `order_status` varchar(30) DEFAULT 'PLACED',
  `razorpay_payment_id` varchar(255) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT 'Razorpay',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES users(`id`)
);

CREATE TABLE `order_items` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `order_id` BIGINT,
  `product_id` BIGINT,
  `quantity` int,
  `price` DECIMAL(10, 2),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`order_id`) REFERENCES orders(`id`),
  FOREIGN KEY (`product_id`) REFERENCES product(`id`)
);