# Electronics E-Commerce and Product Comparison Platform

This project keeps the original Spring Boot + Maven + JSP structure and adds a polished Nexora storefront layer:

- Bootstrap 5 layout and Bootstrap Icons
- Shared glassmorphism navigation, footer, forms, tables, and responsive cards
- Product search and animated product cards
- Session-backed cart with checkout flow
- Three-product comparison workspace at `/compare`
- Admin product and user management screens
- Existing uploaded product images remain under `uploads/images`

## Run locally

1. Create the MySQL database used by the application.
2. Set `DB_URL`, `DB_USERNAME`, and `DB_PASSWORD` as environment variables.
3. Set `RAZORPAY_KEY_ID`, `RAZORPAY_KEY_SECRET`, `MAIL_USERNAME`, and `MAIL_PASSWORD` only if those services are enabled.
4. Run `./mvnw spring-boot:run`.

The default port is `8080`.