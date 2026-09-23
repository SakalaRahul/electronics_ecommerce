<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="currentUri" value="${pageContext.request.requestURI}" />
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Explore products · Voltrix</title>

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
                                <a href="${ctx}/products" class="nav-link text-white active">
                                    <i class="bi bi-grid-3x3-gap me-1"></i> Explore
                                </a>
                            </li>

                            <!-- Show Compare link for guests and regular users only (Hidden for ADMIN) -->
                            <c:if test="${loggedInUser == null || loggedInUser.role != 'ADMIN'}">
                                <li class="nav-item">
                                    <a href="${ctx}/compare" class="nav-link text-white ${currentUri.endsWith('/compare') ? 'active' : ''}">
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

                <!-- SYSTEM NOTIFICATION ALERTS -->
                <c:if test="${param.error == 'ProductUsedInOrder'}">
                    <div class="alert alert-warning alert-dismissible fade show bg-warning bg-opacity-25 text-white border-warning mb-4" role="alert">
                        <i class="bi bi-shield-exclamation me-2 text-warning"></i>
                        This product cannot be deleted because it is already included in an existing order. You can edit the product instead.
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <c:if test="${param.error == 'ProductNotFound'}">
                    <div class="alert alert-danger alert-dismissible fade show bg-danger bg-opacity-25 text-white border-danger mb-4" role="alert">
                        <i class="bi bi-exclamation-triangle-fill me-2 text-danger"></i>
                        Product was not found.
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <!-- HERO PANEL WITH FLOATING TECH VISUAL -->
                <section class="hero-panel glass-card auth-glass-card p-4 p-md-5 rounded-4 mb-4 position-relative overflow-hidden reveal">
                    <div class="row align-items-center">
                        <div class="col-lg-7">
                            <div class="eyebrow text-info mb-2">The upgrade desk</div>
                            <h1 class="display-5 text-white fw-bold mb-3">Find the right tech without the tab overload.</h1>
                            <p class="lead text-white-50 mb-4">Browse the catalog, shortlist your contenders, and compare them side by side before you commit.</p>

                            <div class="d-flex flex-wrap gap-3">
                                <a href="#catalog" class="btn btn-light px-4 py-2 rounded-3 fw-semibold">
                                    Browse catalog <i class="bi bi-arrow-down ms-1"></i>
                                </a>
                                <c:choose>
                                    <c:when test="${loggedInUser.role == 'ADMIN'}">
                                        <a href="${ctx}/admin/dashboard" class="btn btn-outline-light px-4 py-2 rounded-3 fw-semibold">
                                            Open control room
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${ctx}/cart" class="btn btn-outline-light px-4 py-2 rounded-3 fw-semibold">
                                            Open your cart
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <div class="col-lg-5 d-none d-lg-block position-relative">
                            <div class="hero-visual-wrapper position-relative text-center py-4">
                                <div class="hero-visual-glow"></div>
                                <img src="https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=600&q=80" 
                                     alt="Voltrix Tech Hub" 
                                     class="img-fluid floating-hero-img rounded-4 shadow-lg border border-info border-opacity-25">

                                <div class="floating-badge badge-top-left glass-card p-2 px-3 rounded-pill position-absolute d-flex align-items-center gap-2 border border-info border-opacity-50">
                                    <i class="bi bi-lightning-charge-fill text-info fs-5"></i>
                                    <span class="text-white small fw-bold">Ultra-Fast Compare</span>
                                </div>

                                <div class="floating-badge badge-bottom-right glass-card p-2 px-3 rounded-pill position-absolute d-flex align-items-center gap-2 border border-cyan border-opacity-50">
                                    <i class="bi bi-cpu-fill text-cyan fs-5"></i>
                                    <span class="text-white small fw-bold">AI Specs Engine</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- STAT CARDS ROW -->
                <section class="row g-3 mb-4">
                    <div class="col-md-4">
                        <div class="stat-card glass-card auth-glass-card p-4 rounded-4 reveal">
                            <div class="stat-icon text-info fs-3 mb-2">
                                <i class="bi bi-box-seam"></i>
                            </div>
                            <div class="stat-value text-white fs-2 fw-bold">
                                ${products.size()}
                            </div>
                            <div class="stat-label text-white-50">
                                products in the catalog
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="stat-card glass-card auth-glass-card p-4 rounded-4 reveal" style="animation-delay:.1s">
                            <div class="stat-icon text-info fs-3 mb-2">
                                <i class="bi bi-columns-gap"></i>
                            </div>
                            <div class="stat-value text-white fs-2 fw-bold">
                                3-way
                            </div>
                            <div class="stat-label text-white-50">
                                comparison workspace
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="stat-card glass-card auth-glass-card p-4 rounded-4 reveal" style="animation-delay:.2s">
                            <div class="stat-icon text-info fs-3 mb-2">
                                <i class="bi bi-shield-check"></i>
                            </div>
                            <div class="stat-value text-white fs-2 fw-bold">
                                Secure
                            </div>
                            <div class="stat-label text-white-50">
                                checkout-ready shopping
                            </div>
                        </div>
                    </div>
                </section>

                <!-- CATALOG SECTION -->
                <section id="catalog">
                    <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3 mb-4">
                        <div>
                            <div class="eyebrow text-info mb-1">Curated catalog</div>
                            <h2 class="text-white fw-bold mb-1">What are you upgrading?</h2>
                            <p class="lead text-white-50 mb-0 fs-6">Select a few products to unlock the comparison view.</p>
                        </div>

                        <c:if test="${loggedInUser.role == 'ADMIN'}">
                            <a href="${ctx}/products/add" class="btn btn-primary px-4 py-2 rounded-3 fw-semibold">
                                <i class="bi bi-plus-lg me-1"></i> Add product
                            </a>
                        </c:if>
                    </div>

                    <!-- SEARCH & FILTERS TOOLBAR -->
                    <div class="toolbar glass-card auth-glass-card p-3 rounded-4 mb-4 d-flex flex-column flex-md-row gap-3 align-items-center">
                        <div class="search-wrap flex-grow-1 position-relative w-100">
                            <i class="bi bi-search position-absolute top-50 start-0 translate-middle-y ms-3 text-white-50"></i>
                            <input id="productSearch" type="search" class="form-control vt-input ps-5" placeholder="Search products by name or description...">
                        </div>

                        <div class="category-pills d-flex gap-2 w-100 w-md-auto overflow-auto">
                            <a href="${ctx}/products" class="btn btn-sm ${empty activeFilter ? 'btn-info text-dark fw-semibold' : 'btn-outline-light'} rounded-pill px-3">All products</a>
                            <a href="${ctx}/products?filter=best-value" class="btn btn-sm ${activeFilter == 'best-value' ? 'btn-info text-dark fw-semibold' : 'btn-outline-light'} rounded-pill px-3">Best value</a>
                            <a href="${ctx}/products?filter=trending" class="btn btn-sm ${activeFilter == 'trending' ? 'btn-info text-dark fw-semibold' : 'btn-outline-light'} rounded-pill px-3">Trending</a>
                        </div>
                    </div>

                    <!-- PRODUCT CARDS GRID -->
                    <c:choose>
                        <c:when test="${not empty products}">
                            <div class="row g-4" id="productGrid">
                                <c:forEach var="product" items="${products}" varStatus="status">
                                    <div class="col-sm-6 col-xl-4 product-col" data-search="${product.name.toLowerCase()} ${product.description.toLowerCase()}">
                                        <article class="product-card glass-card auth-glass-card rounded-4 p-4 h-100 d-flex flex-column justify-content-between reveal position-relative overflow-hidden" style="animation-delay:${status.index * 0.06}s">
                                            
                                            <!-- TOP BAR CONTROLS (View Button + View Reviews + Compare checkbox) -->
                                            <div class="d-flex justify-content-between align-items-center mb-3 z-3">
                                                <div class="d-flex gap-2">
                                                    <!-- VIEW BUTTON -->
                                                    <a href="${ctx}/products/${product.id}" class="btn btn-outline-info btn-sm rounded-pill px-3 fw-semibold d-flex align-items-center gap-1 shadow-sm">
                                                        <i class="bi bi-eye"></i> View
                                                    </a>
                                                    <!-- VIEW REVIEWS BUTTON -->
                                                    <a href="${ctx}/review/view?productId=${product.id}" class="btn btn-outline-warning btn-sm rounded-pill px-3 fw-semibold d-flex align-items-center gap-1 shadow-sm">
                                                        <i class="bi bi-star-fill"></i> Reviews
                                                    </a>
                                                </div>

                                                <!-- COMPARE TOGGLE (FOR NON-ADMIN) -->
                                                <c:if test="${loggedInUser.role != 'ADMIN'}">
                                                    <label class="compare-toggle bg-dark bg-opacity-75 border border-secondary text-white px-3 py-1 rounded-pill small d-flex align-items-center gap-2 cursor-pointer shadow-sm mb-0">
                                                        <input type="checkbox" class="compare-check form-check-input mt-0" value="${product.id}" data-name="${product.name}">
                                                        <span>Compare</span>
                                                    </label>
                                                </c:if>
                                            </div>

                                            <!-- AUTO-FIT IMAGE WRAPPER -->
                                            <div class="product-image-wrap bg-dark bg-opacity-50 rounded-3 p-0 text-center mb-3 overflow-hidden d-flex justify-content-center align-items-center">
                                                <c:choose>
                                                    <c:when test="${not empty product.imagePath}">
                                                        <img src="${product.imagePath}" alt="${product.name}" class="img-fluid rounded-3 w-100 h-auto d-block" style="object-fit: cover;">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="py-4">
                                                            <i class="bi bi-cpu text-info display-3"></i>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>

                                            <!-- BODY CONTENT -->
                                            <div class="product-body flex-grow-1 d-flex flex-column justify-content-between">
                                                <div>
                                                    <span class="badge bg-info bg-opacity-25 text-info border border-info border-opacity-25 mb-2">
                                                        <i class="bi bi-stars me-1"></i> Smart pick
                                                    </span>
                                                    <h3 class="product-title text-white h5 fw-bold mb-2">${product.name}</h3>
                                                    <p class="product-description text-white-50 small mb-3 text-truncate-3">${product.description}</p>
                                                </div>

                                                <div>
                                                    <!-- PRICE + DISCOUNT BLOCK -->
                                                    <div class="d-flex flex-column gap-1 mb-3">
                                                        <div class="d-flex align-items-center gap-2 flex-wrap">
                                                            <span class="product-price text-white fs-4 fw-bold">
                                                                &#8377; <fmt:formatNumber value="${product.finalPrice}" maxFractionDigits="2"/>
                                                            </span>
                                                            <c:if test="${product.discountPercent > 0}">
                                                                <span class="text-white-50 text-decoration-line-through small">
                                                                    &#8377; <fmt:formatNumber value="${product.price}" maxFractionDigits="2"/>
                                                                </span>
                                                                <span class="badge bg-success bg-opacity-25 text-success border border-success border-opacity-50">
                                                                    <fmt:formatNumber value="${product.discountPercent}" maxFractionDigits="0"/>% off
                                                                </span>
                                                            </c:if>
                                                        </div>
														<c:if test="${product.rating > 0.0}">
														    <span class="rating text-warning small" aria-label="${product.rating} out of 5 stars">
														        <c:forEach begin="1" end="5" var="i">
														            <c:choose>
														                <c:when test="${i <= product.rating}">
														                    <i class="bi bi-star-fill"></i>
														                </c:when>
														                <c:when test="${i - product.rating <= 0.5 && product.rating % 1 >= 0.5}">
														                    <i class="bi bi-star-half"></i>
														                </c:when>
														                <c:otherwise>
														                    <i class="bi bi-star text-white-50"></i>
														                </c:otherwise>
														            </c:choose>
														        </c:forEach>
														        <span class="ms-1 text-white-50">(${product.rating})</span>
														    </span>
														</c:if>
                                                    </div>

                                                    <!-- CART ACTION FOR USER -->
                                                    <c:if test="${loggedInUser.role != 'ADMIN'}">
                                                        <form action="${ctx}/cart/add" method="post" class="d-flex gap-2">
                                                            <input type="hidden" name="productId" value="${product.id}">
                                                            <input type="number" name="quantity" value="1" min="1" class="form-control vt-input text-center" style="max-width: 70px;">
                                                            <button type="submit" class="btn btn-primary flex-grow-1 rounded-3">
                                                                <i class="bi bi-bag-plus me-1"></i> Add to cart
                                                            </button>
                                                        </form>
                                                    </c:if>

                                                    <!-- ADMIN CONTROLS -->
                                                    <c:if test="${loggedInUser.role == 'ADMIN'}">
                                                        <div class="d-flex gap-2">
                                                            <a href="${ctx}/products/edit/${product.id}" class="btn btn-warning flex-grow-1 fw-semibold">Edit</a>
                                                            <a href="${ctx}/products/delete/${product.id}" class="btn btn-danger flex-grow-1 fw-semibold" onclick="return confirm('Delete this product?')">Delete</a>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:when>

                        <c:otherwise>
                            <!-- EMPTY STATE -->
                            <div class="empty-state glass-card auth-glass-card text-center p-5 rounded-4 my-4">
                                <i class="bi bi-box2-heart text-info display-1 mb-3"></i>
                                <h3 class="text-white fw-bold mb-2">No products found for this filter.</h3>
                                <p class="text-white-50">Try switching your filter or adding a new product.</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </section>

            </div>
        </main>

        <!-- FLOATING COMPARISON BAR -->
        <div id="compareBar" class="compare-bar fixed-bottom m-4 p-3 glass-card auth-glass-card rounded-4 border border-info border-opacity-50 shadow-lg d-none align-items-center justify-content-between z-3" style="max-width: 480px; margin-left: auto !important;">
            <span class="text-white">
                <i class="bi bi-bar-chart-line text-info me-2"></i>
                <strong id="compareCount" class="text-info">0</strong> products selected
            </span>
            <button id="openCompare" type="button" class="btn btn-light btn-sm px-3 rounded-pill fw-semibold">
                Open comparison <i class="bi bi-arrow-up-right ms-1"></i>
            </button>
        </div>

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

    <!-- CLIENT-SIDE SEARCH & COMPARISON LOGIC -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Live Product Search
            const searchInput = document.getElementById('productSearch');
            const productCols = document.querySelectorAll('.product-col');

            if (searchInput) {
                searchInput.addEventListener('input', function (e) {
                    const query = e.target.value.toLowerCase().trim();
                    productCols.forEach(col => {
                        const searchData = col.getAttribute('data-search') || '';
                        if (searchData.includes(query)) {
                            col.style.display = 'block';
                        } else {
                            col.style.display = 'none';
                        }
                    });
                });
            }

            // Comparison Selection Logic
            const compareChecks = document.querySelectorAll('.compare-check');
            const compareBar = document.getElementById('compareBar');
            const compareCount = document.getElementById('compareCount');
            const openCompareBtn = document.getElementById('openCompare');

            function updateCompareBar() {
                const selected = Array.from(compareChecks).filter(cb => cb.checked);
                if (compareCount) compareCount.textContent = selected.length;

                if (selected.length > 0) {
                    compareBar.classList.remove('d-none');
                    compareBar.classList.add('d-flex');
                } else {
                    compareBar.classList.remove('d-flex');
                    compareBar.classList.add('d-none');
                }
            }

            compareChecks.forEach(cb => {
                cb.addEventListener('change', updateCompareBar);
            });

            if (openCompareBtn) {
                openCompareBtn.addEventListener('click', function () {
                    const selectedIds = Array.from(compareChecks)
                        .filter(cb => cb.checked)
                        .map(cb => cb.value);

                    if (selectedIds.length > 0) {
                        window.location.href = '${ctx}/compare?ids=' + selectedIds.join(',');
                    }
                });
            }
        });
    </script>
</body>
</html>