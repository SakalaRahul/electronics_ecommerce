<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="currentUri" value="${pageContext.request.requestURI}" />
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Something went wrong · Voltrix</title>
    
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

    <div class="site-shell position-relative z-2">
        
        <!-- STANDALONE NAVBAR -->
        <div class="container-fluid px-3 px-lg-4 pt-3 position-relative z-3">
            <nav class="navbar navbar-expand-lg app-navbar px-4 py-3 rounded-4 auth-glass-card">
                <div class="container-fluid px-0 position-relative">
                    <a class="brand-lockup me-4 text-white text-decoration-none" href="${ctx}/products">
                        <span class="brand-mark">
                            <i class="bi bi-lightning-charge-fill text-info"></i>
                        </span>
                        <span class="brand-text text-white">
                            Voltrix
                            <small class="text-white-50 d-block" style="font-size: 0.65rem;">ELECTRONICS INTELLIGENCE</small>
                        </span>
                    </a>
                </div>
            </nav>
        </div>

        <!-- MAIN ERROR CONTENT -->
        <main class="page-content py-5 px-3 px-lg-4">
            <div class="container max-width-xl text-center">
                <div class="glass-card auth-glass-card p-5 rounded-4 my-5 reveal mx-auto" style="max-width: 600px;">
                    <i class="bi bi-exclamation-octagon text-danger display-1 mb-3"></i>
                    <h2 class="text-white fw-bold mb-2">We couldn't complete that action.</h2>
                    <p class="text-white-50 mb-4">
                        <c:out value="${errorMessage}" default="Please try again in a moment." />
                    </p>
                    <a href="${ctx}/cart" class="btn btn-primary px-4 py-2 rounded-3 fw-semibold">
                        Back to cart <i class="bi bi-arrow-right ms-2"></i>
                    </a>
                </div>
            </div>
        </main>

        <!-- STANDALONE FOOTER -->
        <footer class="site-footer mt-5 pb-4 position-relative z-2">
            <div class="container-fluid px-3 px-lg-4">
                <div class="footer-glass py-3 px-4 rounded-4 auth-glass-card text-center text-md-start">
                    <div class="row align-items-center g-3">
                        <div class="col-md-6">
                            <div class="footer-brand d-flex align-items-center justify-content-center justify-content-md-start gap-3">
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
                                <span>Built with Bootstrap · JSP · Spring Boot</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>