# Electronics E-Commerce and Product Comparison Platform

A Spring Boot (JSP) e-commerce web application for browsing, comparing, and purchasing electronics products, with an admin panel for product, user, and payment management.

## Features

- **Product catalog** — browse, search, add, edit, and delete products, organized by category and brand
- **Product comparison** — compare up to three products side by side at `/compare`
- **Shopping cart & checkout** — session-backed cart (`/cart`) with add/update/checkout flow
- **Payments** — Razorpay integration for order payment and signature verification
- **Reviews & ratings** — customers can add and view product reviews
- **User accounts** — registration, login/logout, and profile management
- **Admin dashboard** — manage products, users, and view payments at `/admin/dashboard` and `/admin/payments`
- **Email notifications** — order/mail service via Spring Mail (SMTP)
- **Nexora storefront UI** — Bootstrap 5 + Bootstrap Icons, glassmorphism navigation/footer, responsive product cards, animated search

## Tech Stack

- **Backend:** Java 17, Spring Boot 3.3.6, Spring MVC, Spring Data JPA
- **View layer:** JSP (JSTL) served from `/WEB-INF/views`
- **Database:** MySQL (via `mysql-connector-j`, Hibernate/JPA)
- **Payments:** Razorpay Java SDK
- **Build:** Maven (packaged as WAR)
- **Frontend assets:** Bootstrap 5, Bootstrap Icons, custom CSS/JS (`src/main/resources/static`, `src/main/webapp`)

## Project Structure

src/main/java/com/codegnan/cgecom/
├── configurtion/ # Web configuration
├── controllers/ # AdminController, CartController, LoginController,
│ # PaymentController, ProductController,
│ # ReviewController, UserController
├── model/ # Brand, Category, Order, OrderItem, Payment,
│ # Product, Review, User
├── repositories/ # Spring Data JPA repositories
├── service/iface/ # Service interfaces
├── service/impl/ # Service implementations (incl. RazorpayService, EmailService)
└── jspwithboot/sql/ # schema.sql

src/main/resources/ # application.properties, static assets
src/main/webapp/WEB-INF/views/ # JSP pages (product list, cart, checkout, admin, etc.)


## Getting Started

### Prerequisites
- Java 17
- Maven (or use the included `./mvnw` wrapper)
- MySQL database

### Setup

1. Create a MySQL database (e.g. `electronics`).
2. Configure the following in `src/main/resources/application.properties` or as environment variables:
   - `spring.datasource.url`, `spring.datasource.username`, `spring.datasource.password`
   - `razorpay.key.id` / `razorpay.key.secret` (if payments are enabled)
   - `spring.mail.username` / `spring.mail.password` (if email is enabled)
3. Run the application:
```bash
   ./mvnw spring-boot:run
```
4. The app runs on **port 4949** by default (`server.port=4949`), configurable in `application.properties`.

Uploaded product images are stored under `uploads/images/` (configurable via `file.upload-dir`).

## Key Endpoints

| Path | Description |
|---|---|
| `/` , `/login` | Login page |
| `/products` | Product listing |
| `/compare?ids=...` | Compare selected products |
| `/products/add`, `/products/edit/{id}` | Add/edit product (admin) |
| `/cart` | View cart |
| `/cart/add`, `/cart/update`, `/cart/checkout` | Cart operations |
| `/payment/verify` | Razorpay payment verification |
| `/review/add`, `/review/view` | Add/view product reviews |
| `/users`, `/users/create`, `/users/edit/{id}` | User management |
| `/admin/dashboard`, `/admin/payments` | Admin views |

## Notes

- ⚠️ The bundled `application.properties` contains sample database and third-party API credentials for local development — replace these with your own before deploying, and never commit real secrets to version control.
