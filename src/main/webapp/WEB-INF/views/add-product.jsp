<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="currentUri" value="${pageContext.request.requestURI}" />
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add product · Voltrix</title>
    
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

                    <!-- BRAND (Left) -->
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
             MAIN FORM CONTENT AREA
             ========================================================= -->
        <main class="page-content py-5">
            <div class="container max-width-lg">
                
                <!-- FORM CARD CONTAINER -->
                <div class="form-panel glass-card auth-glass-card p-4 p-md-5 rounded-4 border border-secondary border-opacity-25 shadow-lg reveal">
                    
                    <div class="eyebrow mb-1">Catalog control</div>
                    <h1 class="h2 text-white fw-bold mb-2">Add a new product</h1>
                    <p class="lead text-white-50 mb-4">Give shoppers enough signal to make a confident comparison.</p>

                    <!-- ERROR ALERT -->
                    <c:if test="${param.error == 'FileUploadFailed'}">
                        <div class="alert alert-danger alert-dismissible fade show bg-danger bg-opacity-25 text-white border-danger mb-4" role="alert">
                            <i class="bi bi-exclamation-triangle-fill me-2"></i>
                            The image could not be uploaded. Please try again.
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <form action="${ctx}/products/add" method="post" enctype="multipart/form-data">
                        
                        <!-- PRODUCT NAME -->
                        <div class="form-group mb-3">
                            <label for="name" class="form-label text-white fw-medium">Product name</label>
                            <input type="text" id="name" name="name" class="form-control vt-input" placeholder="e.g. Dell Inspiron 15" required>
                        </div>

                        <!-- DESCRIPTION -->
                        <div class="form-group mb-4">
                            <label for="description" class="form-label text-white fw-medium">Description</label>
                            <textarea id="description" name="description" class="form-control vt-input" rows="4" placeholder="What should shoppers know first?" required></textarea>
                        </div>

                        <!-- CATEGORY, BRAND, STOCK -->
                        <div class="row g-3 mb-4">
                            <div class="col-md-4">
                                <label for="category" class="form-label text-white fw-medium">Category</label>
                                <input type="text" id="category" name="category" class="form-control vt-input" placeholder="e.g. Laptops" value="${product.category}" required>
                            </div>
                            <div class="col-md-4">
                                <label for="brand" class="form-label text-white fw-medium">Brand</label>
                                <input type="text" id="brand" name="brand" class="form-control vt-input" placeholder="e.g. Apple" value="${product.brand}" required>
                            </div>
                            <div class="col-md-4">
                                <label for="stockQuantity" class="form-label text-white fw-medium">Stock quantity</label>
                                <input type="number" id="stockQuantity" name="stockQuantity" class="form-control vt-input" min="0" value="0" required>
                            </div>
                        </div>

                        <!-- PRICE & DISCOUNT -->
                        <div class="row g-3 mb-4">
                            <div class="col-md-6">
                                <label for="price" class="form-label text-white fw-medium">Price (INR)</label>
                                <div class="input-group">
                                    <span class="input-group-text vt-input-addon text-white">₹</span>
                                    <input type="number" id="price" name="price" class="form-control vt-input" step="0.01" min="0" placeholder="0.00" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="discountPercent" class="form-label text-white fw-medium">Discount %</label>
                                <div class="input-group">
                                    <input type="number" id="discountPercent" name="discountPercent" class="form-control vt-input" step="0.01" min="0" max="100" value="0">
                                    <span class="input-group-text vt-input-addon text-white">%</span>
                                </div>
                            </div>
                        </div>

                        <!-- PRODUCT IMAGE FILE UPLOAD -->
                        <div class="form-group mb-4">
                            <label for="imageFile" class="form-label text-white fw-medium">Product Image</label>
                            <input type="file" name="imageFile" id="imageFile" class="form-control vt-input" accept="image/jpeg, image/png, image/webp" required>
                            <small class="form-text text-white-50 mt-1 d-block">
                                <i class="bi bi-info-circle me-1"></i> Upload a clear image file (JPEG, PNG, WebP) for the best card preview.
                            </small>
                        </div>

                        <!-- SPECIFICATIONS SECTION -->
                        <div class="form-group mb-4">
                            <label class="form-label text-white fw-medium fs-5">Specifications</label>
                            <small class="form-text text-white-50 d-block mb-3">
                                Add key technical details for comparison—e.g. RAM, Processor, Storage for a laptop, or Camera, Battery for a phone.
                            </small>

                            <div id="specRows">
                                <c:forEach var="i" begin="1" end="2">
                                    <div class="d-flex gap-2 mb-2 spec-row">
                                        <input type="text" name="specKeys" class="form-control vt-input" placeholder="Spec name (e.g. RAM)">
                                        <input type="text" name="specValues" class="form-control vt-input" placeholder="Value (e.g. 16 GB)">
                                        <button type="button" class="btn btn-outline-danger btn-icon remove-spec-btn" title="Remove row" style="display:none;">
                                            <i class="bi bi-x-lg"></i>
                                        </button>
                                    </div>
                                </c:forEach>
                            </div>
                            
                            <div class="d-flex justify-content-between align-items-center mt-2">
                                <button type="button" id="addSpecBtn" class="btn btn-outline-info btn-sm">
                                    <i class="bi bi-plus-lg me-1"></i> Add another specification
                                </button>
                                <small class="form-text text-white-50">Leave a row's name blank to skip it.</small>
                            </div>
                        </div>

                        <!-- SUBMIT / CANCEL ACTION BUTTONS -->
                        <div class="d-flex flex-wrap gap-3 pt-3 border-top border-secondary border-opacity-25">
                            <button type="submit" class="btn btn-primary px-4 py-2 rounded-3 fw-semibold">
                                Save product <i class="bi bi-check2 ms-1"></i>
                            </button>
                            <a href="${ctx}/products" class="btn btn-outline-light px-4 py-2 rounded-3 fw-semibold">
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

                        <!-- BRAND -->
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

                        <!-- INFO -->
                        <div class="col-md-6 text-md-end">
                            <div class="footer-meta text-white-50 small">
                                <span>
                                    <i class="bi bi-cpu me-1 text-info"></i>
                                    Electronics intelligence platform
                                </span>

                                <span class="footer-divider mx-2 text-white-50">|</span>

                                <span>
                                    Built with Bootstrap · JSP · Spring Boot
                                </span>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </footer>

    </div>

    <!-- TOAST NOTIFICATION CONTAINER -->
    <div id="toastMessage" class="toast-message" role="status" aria-live="polite"></div>

    <!-- BOOTSTRAP JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- DYNAMIC SPECIFICATION ROWS JAVASCRIPT -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const specContainer = document.getElementById('specRows');
            const addSpecBtn = document.getElementById('addSpecBtn');

            function updateRemoveButtons() {
                const rows = specContainer.querySelectorAll('.spec-row');
                rows.forEach((row) => {
                    const removeBtn = row.querySelector('.remove-spec-btn');
                    if (rows.length > 1) {
                        removeBtn.style.display = 'inline-block';
                    } else {
                        removeBtn.style.display = 'none';
                    }
                });
            }

            addSpecBtn.addEventListener('click', function () {
                const newRow = document.createElement('div');
                newRow.className = 'd-flex gap-2 mb-2 spec-row';
                newRow.innerHTML = `
                    <input type="text" name="specKeys" class="form-control vt-input" placeholder="Spec name (e.g. Storage)">
                    <input type="text" name="specValues" class="form-control vt-input" placeholder="Value (e.g. 512 GB SSD)">
                    <button type="button" class="btn btn-outline-danger btn-icon remove-spec-btn" title="Remove row">
                        <i class="bi bi-x-lg"></i>
                    </button>
                `;
                specContainer.appendChild(newRow);
                updateRemoveButtons();
            });

            specContainer.addEventListener('click', function (e) {
                if (e.target.closest('.remove-spec-btn')) {
                    const rowToRemove = e.target.closest('.spec-row');
                    rowToRemove.remove();
                    updateRemoveButtons();
                }
            });

            updateRemoveButtons();
        });
    </script>
</body>
</html>