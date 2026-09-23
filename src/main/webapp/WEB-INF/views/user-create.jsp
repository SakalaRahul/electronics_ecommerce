<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Create account · Voltrix</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@500;600&family=Plus+Jakarta+Sans:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${ctx}/css/styles.css">
</head>
<body class="vt-login-body">

    <!-- GLOBAL AMBIENT BACKGROUND GLOWS -->
    <div class="vt-page-glow glow-top-left"></div>
    <div class="vt-page-glow glow-bottom-right"></div>

    <!-- BACKGROUND SCROLLING MARQUEE -->
    <div class="electronics-marquee vt-auth-bg-marquee horizontal-straight">
        <div class="marquee-track">
            <div class="marquee-card"><img src="https://images.unsplash.com/photo-1516035069371-29a1b244cc32?w=400" alt="Camera"><span>PRO CAMERA</span></div>
            <div class="marquee-card"><img src="https://images.unsplash.com/photo-1542751371-adc38448a05e?w=400" alt="Gaming Setup"><span>RIG PRO</span></div>
            <div class="marquee-card"><img src="https://images.unsplash.com/photo-1545454675-3531b543be5d?w=400" alt="Speaker"><span>SMART AUDIO</span></div>
            <div class="marquee-card"><img src="https://images.unsplash.com/photo-1550009158-9ebf69173e03?w=400" alt="Motherboard"><span>CHIPSET</span></div>
            <div class="marquee-card"><img src="https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?w=400" alt="VR Rig"><span>NEURAL GLASS</span></div>
            
            <div class="marquee-card"><img src="https://images.unsplash.com/photo-1516035069371-29a1b244cc32?w=400" alt="Camera"><span>PRO CAMERA</span></div>
            <div class="marquee-card"><img src="https://images.unsplash.com/photo-1542751371-adc38448a05e?w=400" alt="Gaming Setup"><span>RIG PRO</span></div>
            <div class="marquee-card"><img src="https://images.unsplash.com/photo-1545454675-3531b543be5d?w=400" alt="Speaker"><span>SMART AUDIO</span></div>
            <div class="marquee-card"><img src="https://images.unsplash.com/photo-1550009158-9ebf69173e03?w=400" alt="Motherboard"><span>CHIPSET</span></div>
            <div class="marquee-card"><img src="https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?w=400" alt="VR Rig"><span>NEURAL GLASS</span></div>
        </div>
    </div>

    <!-- MAIN CONTAINER -->
    <main class="vt-login-wrapper">
        <div class="container h-100 d-flex align-items-center justify-content-center p-3">
            <div class="auth-card-container auth-card-wide w-100">
                <div class="row g-0 auth-glass-card">
                    
                    <!-- LEFT PANEL: SHOWCASE -->
                    <div class="col-lg-5 auth-aside p-4 p-xl-5 d-flex flex-column justify-content-between position-relative overflow-hidden">
                        <div>
                            <a class="brand-lockup text-white" href="${ctx}/">
                                <span class="brand-mark"><i class="bi bi-cpu"></i></span>
                                <span class="brand-text">Voltrix<small>Electronics intelligence</small></span>
                            </a>
                            
                            <div class="position-relative z-3 mt-4">
                                <div class="system-status mb-2">
                                    <span class="status-dot"></span>
                                    <span>START YOUR WORKSPACE</span>
                                </div>
                                <h1 class="auth-title">Join a calmer way to shop electronics.</h1>
                                <p class="auth-lead mb-0">Create your account to compare specs, build wishlists, and track hardware updates.</p>
                            </div>
                        </div>

                        <!-- SHOWCASE CARD -->
                        <div class="register-showcase my-3">
                            <div class="showcase-banner-card">
                                <img src="https://images.unsplash.com/photo-1550009158-9ebf69173e03?w=600" alt="Hardware Chipset" class="banner-img">
                                <div class="banner-overlay">
                                    <span class="badge bg-primary mb-1">NEW ECOSYSTEM</span>
                                    <h6>Next-Gen Hardware Index</h6>
                                </div>
                            </div>
                        </div>

                        <!-- FEATURES -->
                        <div class="feature-list position-relative z-3">
                            <div class="feature-item"><i class="bi bi-shield-check"></i> <span>Secure & private account access</span></div>
                            <div class="feature-item"><i class="bi bi-sliders"></i> <span>Side-by-side spec comparison engine</span></div>
                        </div>
                    </div>

                    <!-- RIGHT PANEL: FORM -->
                    <div class="col-lg-7 auth-form-wrap p-4 p-xl-5 d-flex flex-column justify-content-between position-relative">
                        
                        <!-- TOP ACTION ROW (Fixed overlapping buttons) -->
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <div class="hero-badge m-0">
                                <i class="bi bi-person-plus me-1"></i> ACCOUNT REGISTRATION
                            </div>
                            <div class="d-flex gap-2">
                                <a href="${ctx}/" class="btn btn-outline-vt-home">
                                    <i class="bi bi-house-door me-1"></i> Home
                                </a>
                                <a href="${ctx}/login" class="btn btn-outline-vt-home">
                                    <i class="bi bi-box-arrow-in-right me-1"></i> Sign in
                                </a>
                            </div>
                        </div>

                        <!-- FORM HEADER -->
                        <div>
                            <h2 class="form-heading mb-1">Create your account.</h2>
                            <p class="form-subheading mb-4">Fill in your details to get started with Voltrix.</p>

                            <c:if test="${not empty error}">
                                <div class="alert alert-danger border-0 rounded-3 mb-4 vt-alert py-2">
                                    <i class="bi bi-exclamation-triangle-fill me-2"></i> ${error}
                                </div>
                            </c:if>

                            <form action="${ctx}/users/create" method="post" class="vt-form">
                                <div class="row g-3">
                                    
                                    <!-- Username -->
                                    <div class="col-md-6">
                                        <div class="form-group mb-0">
                                            <label for="username" class="form-label">Username</label>
                                            <div class="input-group-vt">
                                                <i class="bi bi-person"></i>
                                                <input type="text" id="username" name="username" class="form-control" placeholder="e.g. rahul" required>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Password -->
                                    <div class="col-md-6">
                                        <div class="form-group mb-0">
                                            <label for="password" class="form-label">Password</label>
                                            <div class="input-group-vt">
                                                <i class="bi bi-key"></i>
                                                <input type="password" id="password" name="password" class="form-control" placeholder="••••••••" required>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Phone Number -->
                                    <div class="col-md-6">
                                        <div class="form-group mb-0">
                                            <label for="phone_number" class="form-label">Phone Number</label>
                                            <div class="input-group-vt">
                                                <i class="bi bi-telephone"></i>
                                                <input type="text" id="phone_number" name="phone_number" class="form-control" placeholder="+1 234 567 890" required>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Email -->
                                    <div class="col-md-6">
                                        <div class="form-group mb-0">
                                            <label for="email" class="form-label">Email Address</label>
                                            <div class="input-group-vt">
                                                <i class="bi bi-envelope"></i>
                                                <input type="email" id="email" name="email" class="form-control" placeholder="rahul@example.com" required>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Account Type / Role -->
                                    <div class="col-12">
                                        <div class="form-group mb-0">
                                            <label for="role" class="form-label">Account Type</label>
                                            <div class="input-group-vt">
                                                <i class="bi bi-shield-workspace"></i>
                                                <select id="role" name="role" class="form-select form-select-vt" required>
                                                    <option value="USER" selected>User account (Standard access)</option>
                                                    <option value="ADMIN">Administrator account (Control room & product management)</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <button type="submit" class="btn btn-primary btn-lg w-100 btn-vt-submit mt-4">
                                    <span>Create account</span>
                                    <i class="bi bi-arrow-right ms-2"></i>
                                </button>
                            </form>
                        </div>

                        <!-- FOOTER LINK -->
                        <p class="text-center auth-footer-text mt-4 mb-0">
                            Already have an account? <a href="${ctx}/login" class="vt-link">Sign in instead</a>
                        </p>
                    </div>

                </div>
            </div>
        </div>
    </main>

</body>
</html>