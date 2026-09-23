<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="currentUri" value="${pageContext.request.requestURI}" />
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voltrix | Electronics Intelligence</title>

    <!-- BOOTSTRAP CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- BOOTSTRAP ICONS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&family=JetBrains+Mono:wght@400;500;600&display=swap" rel="stylesheet">

    <!-- VOLTRIX GLOBAL STYLES (single stylesheet — no more inline duplicates) -->
    <link rel="stylesheet" href="${ctx}/css/styles.css">
</head>
<body>

    <!-- =========================================================
         HEADER / NAVBAR
         ========================================================= -->
    <div class="container-fluid px-3 px-lg-4 pt-3">
        <nav class="navbar navbar-expand-lg app-navbar px-4 py-3 rounded-4 auth-glass-card">
            <div class="container-fluid px-0 position-relative">

                <!-- BRAND -->
                <a class="brand-lockup me-4" href="${ctx}/products">
                    <span class="brand-mark">
                        <i class="bi bi-lightning-charge-fill"></i>
                    </span>
                    <span class="brand-text">
                        Voltrix
                        <small>ELECTRONICS INTELLIGENCE</small>
                    </span>
                </a>

                <!-- MOBILE MENU TOGGLER -->
                <button class="navbar-toggler border-0 shadow-none text-white ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav" aria-controls="mainNav" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="bi bi-list fs-3"></i>
                </button>

                <!-- COLLAPSIBLE SECTION -->
                <div class="collapse navbar-collapse justify-content-between" id="mainNav">

                    <!-- CENTERED NAVIGATION LINKS -->
                    <ul class="navbar-nav mx-auto align-items-lg-center gap-lg-1 mt-3 mt-lg-0">
                        <li class="nav-item">
                            <a href="${ctx}/products" class="nav-link ${currentUri.endsWith('/products') ? 'active' : ''}">
                                <i class="bi bi-grid-3x3-gap me-1"></i> Explore
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${ctx}/compare" class="nav-link ${currentUri.endsWith('/compare') ? 'active' : ''}">
                                <i class="bi bi-bar-chart-line me-1"></i> Compare
                            </a>
                        </li>
                        <c:if test="${loggedInUser != null && loggedInUser.role == 'ADMIN'}">
                            <li class="nav-item">
                                <a href="${ctx}/admin/dashboard" class="nav-link ${currentUri.endsWith('/admin/dashboard') ? 'active' : ''}">
                                    <i class="bi bi-speedometer2 me-1"></i> Control Room
                                </a>
                            </li>
                        </c:if>
                    </ul>

                    <!-- RIGHT ACTION AREA -->
                    <div class="d-flex flex-column flex-lg-row align-items-lg-center gap-2 mt-3 mt-lg-0">
                        <c:if test="${loggedInUser != null && loggedInUser.role != 'ADMIN'}">
                            <a href="${ctx}/cart" class="nav-link nav-pill ${currentUri.endsWith('/cart') ? 'active' : ''}">
                                <i class="bi bi-bag me-1"></i> Cart
                            </a>
                        </c:if>

                        <c:if test="${loggedInUser != null}">
                            <span class="user-chip">
                                <i class="bi bi-person-circle"></i>
                                <span>${loggedInUser.username}</span>
                            </span>

                            <a href="${ctx}/logout" class="btn btn-outline-primary btn-sm btn-nav-action">
                                <i class="bi bi-box-arrow-right me-1"></i> Sign out
                            </a>
                        </c:if>

                        <c:if test="${loggedInUser == null}">
                            <a href="${ctx}/login" class="btn btn-primary btn-sm btn-nav-action px-3 py-2">
                                Sign in <i class="bi bi-arrow-up-right ms-1"></i>
                            </a>
                        </c:if>
                    </div>

                </div>
            </div>
        </nav>
    </div>

    <!-- =========================================================
         MAIN CONTENT AREA
         ========================================================= -->
    <main class="voltrix-home">

        <!-- ================= HERO ================= -->
        <section class="container-xl px-3 px-lg-4 hero-wrap">
            <div class="hero-section">
                <div class="row align-items-center g-4">

                    <!-- Hero Content -->
                    <div class="col-lg-7">
                        <div class="hero-content">

                            <div class="system-status">
                                <span class="status-dot"></span>
                                SYSTEM ONLINE
                                <span class="status-divider">/</span>
                                LIVE DATA
                            </div>

                            <span class="hero-badge">
                                Standardized E-Commerce Benchmarking
                            </span>

                            <h1>
                                Choose tech with a
                                <span>clearer signal.</span>
                            </h1>

                            <p class="hero-description">
                                Explore electronics, compare products, and make
                                smarter purchasing decisions with a clean and
                                reliable shopping experience.
                            </p>

                            <div class="hero-actions">
                                <a href="${ctx}/login" class="btn btn-primary">
                                    Explore Catalog
                                </a>
                                <a href="#how-it-works" class="btn btn-outline-light">
                                    How It Works
                                </a>
                            </div>

                            <div class="hero-features">
                                <div>
                                    <strong>01</strong>
                                    <span>Browse</span>
                                </div>
                                <div>
                                    <strong>02</strong>
                                    <span>Compare</span>
                                </div>
                                <div>
                                    <strong>03</strong>
                                    <span>Checkout</span>
                                </div>
                            </div>

                        </div>
                    </div>

                    <!-- Electronics Showcase -->
                    <div class="col-lg-5">
                        <div class="electronics-showcase">

                            <span class="showcase-orb orb-one"></span>
                            <span class="showcase-orb orb-two"></span>

                            <img class="floating-device device-one"
                                 src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=500&q=80"
                                 alt="Laptop">

                            <img class="floating-device device-two"
                                 src="https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?auto=format&fit=crop&w=500&q=80"
                                 alt="Smartphone">

                            <img class="floating-device device-three"
                                 src="https://images.unsplash.com/photo-1516035069371-29a1b244cc32?auto=format&fit=crop&w=500&q=80"
                                 alt="Camera">

                            <img class="floating-device device-four"
                                 src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=500&q=80"
                                 alt="Headphones">

                            <div class="device-glass"></div>

                            <img class="main-device"
                                 src="https://images.unsplash.com/photo-1498050108023-c5249f4df085?auto=format&fit=crop&w=900&q=80"
                                 alt="Electronics workspace">

                            <div class="device-label">
                                <span class="label-dot"></span>
                                ELECTRONICS / 01
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </section>

        <!-- ================= MOVING ELECTRONICS STRIP ================= -->
        <section class="electronics-marquee">
            <div class="marquee-track">
                <div class="marquee-card">
                    <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=400&q=80" alt="Laptop">
                    <span>LAPTOPS</span>
                </div>
                <div class="marquee-card">
                    <img src="https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?auto=format&fit=crop&w=400&q=80" alt="Smartphone">
                    <span>SMARTPHONES</span>
                </div>
                <div class="marquee-card">
                    <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=400&q=80" alt="Headphones">
                    <span>AUDIO</span>
                </div>
                <div class="marquee-card">
                    <img src="https://images.unsplash.com/photo-1516035069371-29a1b244cc32?auto=format&fit=crop&w=400&q=80" alt="Camera">
                    <span>CAMERAS</span>
                </div>
                <div class="marquee-card">
                    <img src="https://images.unsplash.com/photo-1550745165-9bc0b252726f?auto=format&fit=crop&w=400&q=80" alt="Gaming">
                    <span>GAMING</span>
                </div>
                <!-- duplicated set for seamless marquee loop -->
                <div class="marquee-card">
                    <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=400&q=80" alt="Laptop">
                    <span>LAPTOPS</span>
                </div>
                <div class="marquee-card">
                    <img src="https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?auto=format&fit=crop&w=400&q=80" alt="Smartphone">
                    <span>SMARTPHONES</span>
                </div>
                <div class="marquee-card">
                    <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=400&q=80" alt="Headphones">
                    <span>AUDIO</span>
                </div>
                <div class="marquee-card">
                    <img src="https://images.unsplash.com/photo-1516035069371-29a1b244cc32?auto=format&fit=crop&w=400&q=80" alt="Camera">
                    <span>CAMERAS</span>
                </div>
                <div class="marquee-card">
                    <img src="https://images.unsplash.com/photo-1550745165-9bc0b252726f?auto=format&fit=crop&w=400&q=80" alt="Gaming">
                    <span>GAMING</span>
                </div>
            </div>
        </section>

        <!-- ================= HOW IT WORKS ================= -->
        <section id="how-it-works" class="container-xl px-3 px-lg-4 workflow-section">
            <div class="section-heading">
                <span>WORKFLOW</span>
                <h2>Simple. Clear. Reliable.</h2>
                <p>Everything you need to find and purchase the right technology.</p>
            </div>

            <div class="row g-3">
                <div class="col-md-4">
                    <div class="workflow-card">
                        <div class="workflow-number">01</div>
                        <h3>Browse Catalog</h3>
                        <p>Explore electronics across multiple categories and discover products that match your needs.</p>
                        <span class="workflow-arrow">→</span>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="workflow-card">
                        <div class="workflow-number">02</div>
                        <h3>Compare Products</h3>
                        <p>Review important product information and compare your options before buying.</p>
                        <span class="workflow-arrow">→</span>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="workflow-card">
                        <div class="workflow-number">03</div>
                        <h3>Checkout</h3>
                        <p>Select your product, complete the checkout process, and keep your shopping experience simple.</p>
                        <span class="workflow-arrow">→</span>
                    </div>
                </div>
            </div>
        </section>

        <!-- ================= PRODUCT PREVIEW ================= -->
        <section class="container-xl px-3 px-lg-4 catalog-preview">
            <div class="section-heading">
                <span>EXPLORE</span>
                <h2>Popular Electronics</h2>
                <p>Discover some of the technology categories available on Voltrix.</p>
            </div>

            <div class="row g-3">
                <div class="col-6 col-lg-3">
                    <div class="catalog-card">
                        <img src="https://images.unsplash.com/photo-1496181133206-80ce9b88a853?auto=format&fit=crop&w=600&q=80" alt="Laptops">
                        <div class="catalog-card-content">
                            <span>01</span>
                            <h3>Laptops</h3>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-lg-3">
                    <div class="catalog-card">
                        <img src="https://images.unsplash.com/photo-1598327105666-5b89351aff97?auto=format&fit=crop&w=600&q=80" alt="Smartphones">
                        <div class="catalog-card-content">
                            <span>02</span>
                            <h3>Smartphones</h3>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-lg-3">
                    <div class="catalog-card">
                        <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=600&q=80" alt="Headphones">
                        <div class="catalog-card-content">
                            <span>03</span>
                            <h3>Audio</h3>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-lg-3">
                    <div class="catalog-card">
                        <img src="https://images.unsplash.com/photo-1516035069371-29a1b244cc32?auto=format&fit=crop&w=600&q=80" alt="Cameras">
                        <div class="catalog-card-content">
                            <span>04</span>
                            <h3>Cameras</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- ================= STATS ================= -->
        <section class="container-xl px-3 px-lg-4 stats-section">
            <div class="row g-3">
                <div class="col-6 col-lg-3">
                    <div class="stat-card">
                        <strong>1,200+</strong>
                        <span>Products</span>
                    </div>
                </div>
                <div class="col-6 col-lg-3">
                    <div class="stat-card">
                        <strong>98.4%</strong>
                        <span>Data Accuracy</span>
                    </div>
                </div>
                <div class="col-6 col-lg-3">
                    <div class="stat-card">
                        <strong>3×</strong>
                        <span>Faster Comparison</span>
                    </div>
                </div>
                <div class="col-6 col-lg-3">
                    <div class="stat-card">
                        <strong>24/7</strong>
                        <span>Platform Access</span>
                    </div>
                </div>
            </div>
        </section>

    </main>

    <!-- =========================================================
         FOOTER
         ========================================================= -->
    <footer class="site-footer">
        <div class="container-fluid px-3 px-lg-4">
            <div class="footer-glass">
                <div class="row align-items-center g-3">
                    <div class="col-md-6">
                        <div class="footer-brand">
                            <span class="footer-icon">
                                <i class="bi bi-lightning-charge-fill"></i>
                            </span>
                            <div>
                                <strong>Voltrix</strong>
                                <span>Smarter electronics decisions.</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 text-md-end">
                        <div class="footer-meta">
                            <span>
                                <i class="bi bi-cpu me-1"></i>
                                Electronics intelligence platform
                            </span>
                            <span class="footer-divider"></span>
                            <span>Built with Bootstrap · JSP · Spring Boot</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- TOAST NOTIFICATION CONTAINER -->
    <div id="toastMessage" class="toast-message" role="status" aria-live="polite"></div>

    <!-- BOOTSTRAP JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- VOLTRIX APPLICATION JS -->
    <script src="${ctx}/js/app.js"></script>

</body>
</html>
