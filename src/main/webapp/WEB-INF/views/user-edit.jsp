<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="currentUri" value="${pageContext.request.requestURI}" />
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit User · Voltrix</title>

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
                            <li class="nav-item">
                                <a href="${ctx}/compare" class="nav-link text-white ${currentUri.endsWith('/compare') ? 'active' : ''}">
                                    <i class="bi bi-bar-chart-line me-1"></i> Compare
                                </a>
                            </li>
                            <c:if test="${loggedInUser != null && loggedInUser.role == 'ADMIN'}">
                                <li class="nav-item">
                                    <a href="${ctx}/admin/dashboard" class="nav-link text-white active">
                                        <i class="bi bi-speedometer2 me-1"></i> Control Room
                                    </a>
                                </li>
                            </c:if>
                        </ul>

                        <!-- RIGHT ACTION AREA -->
                        <div class="d-flex flex-column flex-lg-row align-items-lg-center gap-2 mt-3 mt-lg-0">
                            <c:if test="${loggedInUser != null && loggedInUser.role != 'ADMIN'}">
                                <a href="${ctx}/cart" class="nav-link nav-pill text-white">
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
        <main class="page-content py-5 px-3 px-lg-4">
            <div class="container-fluid max-width-md reveal">

                <!-- BACK LINK -->
                <a href="${ctx}/users" class="btn btn-link text-white-50 text-decoration-none p-0 mb-4 d-inline-flex align-items-center">
                    <i class="bi bi-arrow-left me-2"></i> Back to User List
                </a>

                <!-- EDIT FORM PANEL -->
                <div class="glass-card auth-glass-card p-4 p-md-5 rounded-4 shadow-lg border border-secondary border-opacity-50 relative overflow-hidden">
                    
                    <!-- Decorative Icon -->
                    <div class="position-absolute top-0 end-0 p-4 opacity-25">
                        <i class="bi bi-person-gear display-1 text-info"></i>
                    </div>

                    <div class="mb-4 position-relative z-2">
                        <h1 class="text-white fw-bold mb-2 h2">Edit User Profile</h1>
                        <p class="text-white-50">Update system access levels and contact details.</p>
                    </div>

                    <form action="${ctx}/users/update/${user.id}" method="post" class="position-relative z-2">
                        
                        <div class="row g-4">
                            <!-- USERNAME -->
                            <div class="col-md-6">
                                <label for="username" class="form-label text-white-50 small text-uppercase fw-semibold mb-2">Username</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-dark border-secondary text-white-50"><i class="bi bi-person"></i></span>
                                    <input type="text" id="username" name="username" class="form-control vt-input bg-dark border-secondary text-white" value="${user.username}" required>
                                </div>
                            </div>

                            <!-- PASSWORD -->
                            <div class="col-md-6">
                                <label for="password" class="form-label text-white-50 small text-uppercase fw-semibold mb-2">Password</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-dark border-secondary text-white-50"><i class="bi bi-key"></i></span>
                                    <input type="password" id="password" name="password" class="form-control vt-input bg-dark border-secondary text-white" value="${user.password}" required>
                                </div>
                            </div>

                            <!-- EMAIL (READ-ONLY) -->
                            <div class="col-md-6">
                                <label for="email" class="form-label text-white-50 small text-uppercase fw-semibold mb-2">Email Address</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-dark border-secondary text-warning" title="Email cannot be changed">
                                        <i class="bi bi-lock-fill"></i>
                                    </span>
                                    <input type="email" id="email" name="email" class="form-control vt-input bg-dark border-secondary text-white-50 cursor-not-allowed" value="${user.email}" readonly>
                                </div>
                                <div class="form-text text-white-50 mt-1 small">
                                    <i class="bi bi-info-circle me-1"></i>Email address is locked and cannot be modified.
                                </div>
                            </div>

                            <!-- PHONE NUMBER -->
                            <div class="col-md-6">
                                <label for="phone_number" class="form-label text-white-50 small text-uppercase fw-semibold mb-2">Phone Number</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-dark border-secondary text-white-50"><i class="bi bi-telephone"></i></span>
                                    <input type="tel" id="phone_number" name="phone_number" class="form-control vt-input bg-dark border-secondary text-white" value="${user.phone_number}" required>
                                </div>
                            </div>

                            <!-- ROLE -->
                            <div class="col-12">
                                <label for="role" class="form-label text-white-50 small text-uppercase fw-semibold mb-2">System Role</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-dark border-secondary text-white-50"><i class="bi bi-shield-lock"></i></span>
                                    <select id="role" name="role" class="form-select vt-input bg-dark border-secondary text-white" required>
                                        <option value="USER" ${user.role == 'USER' ? 'selected' : ''}>Standard User</option>
                                        <option value="ADMIN" ${user.role == 'ADMIN' ? 'selected' : ''}>Administrator</option>
                                    </select>
                                </div>
                                <div class="form-text text-white-50 mt-2 small">Administrators have full access to product and user management.</div>
                            </div>
                        </div>

                        <!-- ACTIONS -->
                        <div class="d-flex gap-3 mt-5 pt-3 border-top border-secondary border-opacity-25">
                            <button type="submit" class="btn btn-primary px-4 py-2 fw-semibold rounded-3 d-flex align-items-center">
                                <i class="bi bi-check2-circle me-2"></i> Update User
                            </button>
                            <a href="${ctx}/users" class="btn btn-outline-light px-4 py-2 fw-semibold rounded-3">
                                Cancel
                            </a>
                        </div>
                    </form>

                </div>
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