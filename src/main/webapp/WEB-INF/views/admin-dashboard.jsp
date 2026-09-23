<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="currentUri" value="${pageContext.request.requestURI}" />
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Control room · Voltrix</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&family=JetBrains+Mono:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/css/styles.css">
</head>
<body class="vt-controlroom-body">

    <div class="vt-page-glow glow-top-left"></div>
    <div class="vt-page-glow glow-bottom-right"></div>

    <div class="vt-bg-marquee-container" aria-hidden="true">
        <div class="vt-bg-marquee-track">
            <img src="https://images.unsplash.com/photo-1518770660439-4636190af475?auto=format&fit=crop&w=600&q=80" class="vt-marquee-img" alt="Tech">
            <img src="https://images.unsplash.com/photo-1550745165-9bc0b252726f?auto=format&fit=crop&w=600&q=80" class="vt-marquee-img" alt="Tech">
        </div>
        <div class="vt-bg-marquee-track reverse">
            <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=600&q=80" class="vt-marquee-img" alt="Tech">
            <img src="https://images.unsplash.com/photo-1546868871-7041f2a55e12?auto=format&fit=crop&w=600&q=80" class="vt-marquee-img" alt="Tech">
        </div>
    </div>

    <div class="container-fluid px-3 px-lg-4 pt-3 position-relative z-3">
        <nav class="navbar navbar-expand-lg app-navbar px-4 py-3 rounded-4 auth-glass-card">
            <div class="container-fluid px-0 position-relative">
                <a class="brand-lockup me-4 text-white" href="${ctx}/products">
                    <span class="brand-mark"><i class="bi bi-lightning-charge-fill text-info"></i></span>
                    <span class="brand-text text-white">Voltrix<small class="text-white-50">ELECTRONICS INTELLIGENCE</small></span>
                </a>
                <button class="navbar-toggler border-0 shadow-none text-white ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav">
                    <i class="bi bi-list fs-3 text-white"></i>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="mainNav">
                    <!-- Compare link removed for admin view -->
                    <ul class="navbar-nav mx-auto align-items-lg-center gap-lg-1 mt-3 mt-lg-0">
                        <li class="nav-item">
                            <a href="${ctx}/products" class="nav-link text-white"><i class="bi bi-grid-3x3-gap me-1"></i> Explore</a>
                        </li>
                        <c:if test="${loggedInUser != null && loggedInUser.role == 'ADMIN'}">
                            <li class="nav-item">
                                <a href="${ctx}/admin/dashboard" class="nav-link text-white active"><i class="bi bi-speedometer2 me-1"></i> Control Room</a>
                            </li>
                        </c:if>
                    </ul>
                    <div class="d-flex flex-column flex-lg-row align-items-lg-center gap-2 mt-3 mt-lg-0">
                        <c:if test="${loggedInUser != null}">
                            <span class="user-chip text-white bg-dark border border-secondary px-3 py-1 rounded-pill">
                                <i class="bi bi-person-circle text-info me-1"></i><span>${loggedInUser.username}</span>
                            </span>
                            <a href="${ctx}/logout" class="btn btn-outline-light btn-sm btn-nav-action"><i class="bi bi-box-arrow-right me-1"></i> Sign out</a>
                        </c:if>
                    </div>
                </div>
            </div>
        </nav>
    </div>

    <main class="voltrix-home py-4 position-relative z-2">
        <div class="container-fluid px-3 px-lg-4">
            <section class="hero-panel reveal mb-4 p-4 p-lg-5 rounded-4 position-relative overflow-hidden">
                <div class="hero-content position-relative z-2">
                    <div class="eyebrow mb-2">Operations overview</div>
                    <h1 class="display-6 fw-bold text-white mb-2">Keep the catalog in signal.</h1>
                    <p class="lead text-white-50 mb-4">Manage product discovery, user accounts, and financial transactions.</p>
                </div>
            </section>

            <div class="row g-4">
                <!-- PRODUCTS CARD -->
                <div class="col-lg-6">
                    <div class="glass-card reveal h-100 p-4 p-lg-5 rounded-4 d-flex flex-column justify-content-between">
                        <div>
                            <div class="stat-icon mb-3 fs-3"><i class="bi bi-box-seam"></i></div>
                            <div class="eyebrow mb-1">Catalog control</div>
                            <h2 class="h3 text-white mb-3">Products</h2>
                            <p class="text-white-50">Add new electronics, manage specs, and update pricing and stocks.</p>
                        </div>
                        <div class="d-flex flex-wrap gap-2 mt-4">
                            <a href="${ctx}/products" class="btn btn-primary px-4 py-2">Manage products</a>
                            <a href="${ctx}/products/add" class="btn btn-outline-primary px-4 py-2 text-white">Add product</a>
                        </div>
                    </div>
                </div>

                <!-- USERS & PAYMENTS CARD -->
                <div class="col-lg-6">
                    <div class="glass-card reveal h-100 p-4 p-lg-5 rounded-4 d-flex flex-column justify-content-between">
                        <div>
                            <div class="stat-icon mb-3 fs-3"><i class="bi bi-people"></i></div>
                            <div class="eyebrow mb-1">People & Transactions</div>
                            <h2 class="h3 text-white mb-3">Users & Payments</h2>
                            <p class="text-white-50">Review marketplace user accounts and audit user checkout logs, purchased products, and gateway methods.</p>
                        </div>
                        <div class="d-flex flex-wrap gap-2 mt-4">
                            <a href="${ctx}/users" class="btn btn-primary px-4 py-2">Manage users</a>
                            <a href="${ctx}/admin/payments" class="btn btn-outline-info px-4 py-2"><i class="bi bi-receipt me-1"></i> View Payments</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <footer class="site-footer mt-5 pb-4 position-relative z-2">
        <div class="container-fluid px-3 px-lg-4">
            <div class="footer-glass py-3 px-4 rounded-4 auth-glass-card">
                <div class="row align-items-center g-3">
                    <div class="col-md-6">
                        <strong class="text-white d-block">Voltrix</strong>
                    </div>
                    <div class="col-md-6 text-md-end text-white-50 small">
                        <span>Electronics intelligence platform</span>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>