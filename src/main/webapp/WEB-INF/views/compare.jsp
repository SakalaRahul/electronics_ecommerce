<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="currentUri" value="${pageContext.request.requestURI}" />
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Compare products · Voltrix</title>

    <!-- GOOGLE FONTS -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&family=JetBrains+Mono:wght@400;500;600&display=swap" rel="stylesheet">

    <!-- BOOTSTRAP CSS & ICONS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <!-- VOLTRIX GLOBAL STYLES -->
    <link rel="stylesheet" href="${ctx}/css/styles.css">
</head>
<body class="vt-controlroom-body">

    <!-- GLOBAL AMBIENT BACKGROUND GLOWS -->
    <div class="vt-page-glow glow-top-left"></div>
    <div class="vt-page-glow glow-bottom-right"></div>

    <!-- BACKGROUND SCROLLING MARQUEE IMAGES -->
    <div class="vt-bg-marquee-container" aria-hidden="true">
        <div class="vt-bg-marquee-track">
            <img src="https://images.unsplash.com/photo-1518770660439-4636190af475?auto=format&fit=crop&w=600&q=80" class="vt-marquee-img" alt="Tech 1">
            <img src="https://images.unsplash.com/photo-1550745165-9bc0b252726f?auto=format&fit=crop&w=600&q=80" class="vt-marquee-img" alt="Tech 2">
            <img src="https://images.unsplash.com/photo-1526738549149-8e07eca6c147?auto=format&fit=crop&w=600&q=80" class="vt-marquee-img" alt="Tech 3">
            <img src="https://images.unsplash.com/photo-1531297484001-80022131f5a1?auto=format&fit=crop&w=600&q=80" class="vt-marquee-img" alt="Tech 4">
        </div>
        <div class="vt-bg-marquee-track reverse">
            <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=600&q=80" class="vt-marquee-img" alt="Tech 5">
            <img src="https://images.unsplash.com/photo-1546868871-7041f2a55e12?auto=format&fit=crop&w=600&q=80" class="vt-marquee-img" alt="Tech 6">
            <img src="https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?auto=format&fit=crop&w=600&q=80" class="vt-marquee-img" alt="Tech 7">
            <img src="https://images.unsplash.com/photo-1603302576837-37561b2e2302?auto=format&fit=crop&w=600&q=80" class="vt-marquee-img" alt="Tech 8">
        </div>
    </div>

    <div class="site-shell position-relative z-2">

        <!-- =========================================================
             INLINE HEADER / NAVBAR (Floating Glass Capsule)
             ========================================================= -->
        <div class="container-fluid px-3 px-lg-4 pt-3 position-relative z-3">
            <nav class="navbar navbar-expand-lg app-navbar px-4 py-3 rounded-4 auth-glass-card">
                <div class="container-fluid px-0 position-relative">

                    <!-- BRAND -->
                    <a class="brand-lockup me-4 text-white" href="${ctx}/products">
                        <span class="brand-mark">
                            <i class="bi bi-lightning-charge-fill text-info"></i>
                        </span>
                        <span class="brand-text text-white">
                            Voltrix
                            <small class="text-white-50">ELECTRONICS INTELLIGENCE</small>
                        </span>
                    </a>

                    <!-- MOBILE MENU TOGGLER -->
                    <button class="navbar-toggler border-0 shadow-none text-white ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav" aria-controls="mainNav" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="bi bi-list fs-3 text-white"></i>
                    </button>

                    <!-- COLLAPSIBLE SECTION -->
                    <div class="collapse navbar-collapse justify-content-between" id="mainNav">

                        <!-- CENTERED NAVIGATION LINKS -->
                        <ul class="navbar-nav mx-auto align-items-lg-center gap-lg-1 mt-3 mt-lg-0">
                            <li class="nav-item">
                                <a href="${ctx}/products" class="nav-link text-white ${currentUri.endsWith('/products') ? 'active' : ''}">
                                    <i class="bi bi-grid-3x3-gap me-1"></i> Explore
                                </a>
                            </li>

                            <!-- Show Compare link for guests and regular users only (Hidden for ADMIN) -->
                            <c:if test="${loggedInUser == null || loggedInUser.role != 'ADMIN'}">
                                <li class="nav-item">
                                    <a href="${ctx}/compare" class="nav-link text-white ${fn:contains(currentUri, '/compare') ? 'active' : ''}">
                                        <i class="bi bi-bar-chart-line me-1"></i> Compare
                                    </a>
                                </li>
                            </c:if>

                            <c:if test="${loggedInUser != null && loggedInUser.role == 'ADMIN'}">
                                <li class="nav-item">
                                    <a href="${ctx}/admin/dashboard" class="nav-link text-white ${currentUri.endsWith('/admin/dashboard') ? 'active' : ''}">
                                        <i class="bi bi-speedometer2 me-1"></i> Control Room
                                    </a>
                                </li>
                            </c:if>
                        </ul>

                        <!-- RIGHT ACTION AREA -->
                        <div class="d-flex flex-column flex-lg-row align-items-lg-center gap-2 mt-3 mt-lg-0">
                            <c:if test="${loggedInUser != null && loggedInUser.role != 'ADMIN'}">
                                <a href="${ctx}/cart" class="nav-link nav-pill text-white ${currentUri.endsWith('/cart') ? 'active' : ''}">
                                    <i class="bi bi-bag me-1"></i> Cart
                                </a>
                            </c:if>

                            <c:if test="${loggedInUser != null}">
                                <span class="user-chip text-white bg-dark border border-secondary px-3 py-1 rounded-pill">
                                    <i class="bi bi-person-circle text-info me-1"></i>
                                    <span>${loggedInUser.username}</span>
                                </span>
                                <a href="${ctx}/logout" class="btn btn-outline-light btn-sm btn-nav-action">
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
        <main class="page-content py-4 px-3 px-lg-4">
            <div class="container-fluid max-width-xl">

                <!-- PAGE HEADING -->
                <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3 mb-4">
                    <div>
                        <div class="eyebrow text-info mb-1">Decision workspace</div>
                        <h1 class="text-white fw-bold mb-1">Compare without the noise.</h1>
                        <p class="lead text-white-50 mb-0 fs-6">See price, details, and practical differences in one calm view.</p>
                    </div>

                    <a href="${ctx}/products" class="btn btn-outline-light px-4 py-2 rounded-3 fw-semibold">
                        <i class="bi bi-arrow-left me-2"></i> Back to catalog
                    </a>
                </div>

                <!-- COMPARISON MATRIX OR EMPTY STATE -->
                <c:choose>
                    <c:when test="${not empty comparisonProducts and fn:length(comparisonProducts) >= 1}">
                        <!-- COMPARISON TABLE CONTAINER -->
                        <div class="table-panel glass-card auth-glass-card p-4 rounded-4 mb-4 overflow-hidden reveal">
                            <div class="table-responsive">
                                <table class="table table-dark table-borderless align-middle mb-0 comparison-table" style="background: transparent;">
                                    <thead>
                                        <tr class="border-bottom border-secondary border-opacity-50">
                                            <th scope="col" class="bg-transparent text-white-50 fw-semibold text-uppercase fs-7 pb-3" style="min-width: 180px;">
                                                Product signal
                                            </th>
                                            <c:forEach var="product" items="${comparisonProducts}">
                                                <th scope="col" class="bg-transparent text-center pb-3" style="min-width: 260px;">
                                                    <div class="product-image-wrap bg-dark bg-opacity-50 rounded-3 p-3 mb-3 d-flex align-items-center justify-content-center mx-auto" style="height: 160px; max-width: 220px;">
                                                        <c:choose>
                                                            <c:when test="${not empty product.imagePath}">
                                                                <img class="img-fluid max-height-100 rounded" src="${product.imagePath}" alt="${product.name}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <i class="bi bi-cpu display-4 text-info"></i>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                    <h3 class="h5 text-white fw-bold mb-0">${product.name}</h3>
                                                </th>
                                            </c:forEach>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <!-- BASE PRICE ROW -->
                                        <tr class="border-bottom border-secondary border-opacity-25">
                                            <th scope="row" class="bg-transparent text-white fw-semibold">Base Price</th>
                                            <c:forEach var="product" items="${comparisonProducts}">
                                                <td class="bg-transparent text-center">
                                                    <span class="text-white fs-5 fw-semibold">₹ ${product.price}</span>
                                                </td>
                                            </c:forEach>
                                        </tr>

                                        <!-- DISCOUNT PERCENTAGE ROW -->
                                        <tr class="border-bottom border-secondary border-opacity-25">
                                            <th scope="row" class="bg-transparent text-white fw-semibold">Discount</th>
                                            <c:forEach var="product" items="${comparisonProducts}">
                                                <td class="bg-transparent text-center">
                                                    <c:choose>
                                                        <c:when test="${product.discountPercent > 0}">
                                                            <span class="badge bg-success bg-opacity-25 text-success border border-success border-opacity-50 px-2 py-1">
                                                                ${product.discountPercent}% OFF
                                                            </span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="text-white-50 small">No discount</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </c:forEach>
                                        </tr>

                                        <!-- FINAL PRICE AFTER DISCOUNT ROW -->
                                        <tr class="border-bottom border-secondary border-opacity-25">
                                            <th scope="row" class="bg-transparent text-white fw-semibold">Final Price</th>
                                            <c:forEach var="product" items="${comparisonProducts}">
                                                <td class="bg-transparent text-center">
                                                    <span class="product-price text-info fs-4 fw-bold">
                                                        ₹ <fmt:formatNumber value="${product.finalPrice}" maxFractionDigits="2" minFractionDigits="2" />
                                                    </span>
                                                </td>
                                            </c:forEach>
                                        </tr>

                                        <!-- SPECIFICATIONS ROW -->
                                        <tr class="border-bottom border-secondary border-opacity-25">
                                            <th scope="row" class="bg-transparent text-white fw-semibold">Specifications</th>
                                            <c:forEach var="product" items="${comparisonProducts}">
                                                <td class="bg-transparent text-center text-white-50 small p-3">
                                                    ${product.specifications}
                                                </td>
                                            </c:forEach>
                                        </tr>

                                        <!-- DESCRIPTION ROW -->
                                        <tr class="border-bottom border-secondary border-opacity-25">
                                            <th scope="row" class="bg-transparent text-white fw-semibold">Description</th>
                                            <c:forEach var="product" items="${comparisonProducts}">
                                                <td class="bg-transparent text-center text-white-50 small p-3">
                                                    ${product.description}
                                                </td>
                                            </c:forEach>
                                        </tr>

                                        <!-- RATING + ADD TO CART ROW -->
                                        <tr>
                                            <th scope="row" class="bg-transparent text-white fw-semibold">Next move</th>
                                            <c:forEach var="product" items="${comparisonProducts}">
                                                <td class="bg-transparent text-center pt-3">
                                                    <div class="mb-3">
                                                        <c:choose>
                                                            <c:when test="${product.rating > 0}">
                                                                <span class="rating text-warning">
                                                                    <i class="bi bi-star-fill"></i>
                                                                    <span class="text-white ms-1">${product.rating}</span>
                                                                </span>
                                                            </c:when>
                                                            
                                                        </c:choose>
                                                    </div>

                                                    <c:choose>
                                                        <c:when test="${loggedInUser != null && loggedInUser.role == 'ADMIN'}">
                                                            <a href="${ctx}/products/edit/${product.id}" class="btn btn-warning btn-sm px-3 fw-semibold rounded-3">
                                                                <i class="bi bi-pencil-square me-1"></i> Edit product
                                                            </a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <form action="${ctx}/cart/add" method="post" class="d-inline-block">
                                                                <input type="hidden" name="productId" value="${product.id}">
                                                                <input type="hidden" name="quantity" value="1">
                                                                <button type="submit" class="btn btn-primary btn-sm px-4 fw-semibold rounded-3">
                                                                    <i class="bi bi-bag-plus me-1"></i> Add to cart
                                                                </button>
                                                            </form>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </c:forEach>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </c:when>

                    <c:otherwise>
                        <!-- EMPTY STATE -->
                        <div class="empty-state glass-card auth-glass-card text-center p-5 rounded-4 my-4 reveal">
                            <i class="bi bi-bar-chart-line text-info display-1 mb-3"></i>
                            <h2 class="text-white fw-bold mb-2">Choose products to start.</h2>
                            <p class="text-white-50 mb-4">Use the product catalog to select items for comparison.</p>
                            <a href="${ctx}/products" class="btn btn-primary px-4 py-2 rounded-3 fw-semibold">
                                Explore products <i class="bi bi-arrow-right ms-2"></i>
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>

            </div>
        </main>

        <!-- =========================================================
             INLINE FOOTER
             ========================================================= -->
        <footer class="site-footer mt-5 pb-4 position-relative z-2">
            <div class="container-fluid px-3 px-lg-4">
                <div class="footer-glass py-3 px-4 rounded-4 auth-glass-card">
                    <div class="row align-items-center g-3">
                        <div class="col-md-6">
                            <div class="footer-brand d-flex align-items-center gap-3">
                                <span class="footer-icon text-info fs-4">
                                    <i class="bi bi-lightning-charge-fill"></i>
                                </span>
                                <div>
                                    <strong class="text-white d-block">Voltrix</strong>
                                    <span class="text-white-50 small">Smarter electronics decisions.</span>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 text-md-end">
                            <div class="footer-meta text-white-50 small">
                                <span><i class="bi bi-cpu me-1 text-info"></i> Electronics intelligence platform</span>
                                <span class="footer-divider mx-2 text-white-50">|</span>
                                <span>Built with Bootstrap · JSP · Spring Boot</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>

    </div>

    <!-- BOOTSTRAP JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>