<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="currentUri" value="${pageContext.request.requestURI}" />
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit Product · Voltrix</title>

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
             FLOATING NAVBAR CAPSULE
             ========================================================= -->
        <div class="container-fluid px-3 px-lg-4 pt-3 position-relative z-3">
            <nav class="navbar navbar-expand-lg app-navbar px-4 py-3 rounded-4 auth-glass-card">
                <div class="container-fluid px-0 position-relative">

                    <!-- BRAND -->
                    <a class="brand-lockup me-4 text-white text-decoration-none" href="${ctx}/products">
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

                    <!-- NAVIGATION LINKS -->
                    <div class="collapse navbar-collapse justify-content-between" id="mainNav">
                        <ul class="navbar-nav mx-auto align-items-lg-center gap-lg-1 mt-3 mt-lg-0">
                            <li class="nav-item">
                                <a href="${ctx}/products" class="nav-link text-white ${currentUri.endsWith('/products') ? 'active' : ''}">
                                    <i class="bi bi-grid-3x3-gap me-1"></i> Explore
                                </a>
                            </li>
                            <c:if test="${loggedInUser != null && loggedInUser.role == 'ADMIN'}">
                                <li class="nav-item">
                                    <a href="${ctx}/products" class="nav-link text-white active">
                                        <i class="bi bi-speedometer2 me-1"></i> Control Room
                                    </a>
                                </li>
                            </c:if>
                        </ul>

                        <!-- USER PROFILE / LOGOUT -->
                        <div class="d-flex flex-column flex-lg-row align-items-lg-center gap-2 mt-3 mt-lg-0">
                            <c:if test="${loggedInUser != null}">
                                <span class="user-chip text-white bg-dark border border-secondary px-3 py-1 rounded-pill">
                                    <i class="bi bi-person-circle text-info me-1"></i>
                                    <span>${loggedInUser.username}</span>
                                </span>
                                <a href="${ctx}/logout" class="btn btn-outline-light btn-sm btn-nav-action">
                                    <i class="bi bi-box-arrow-right me-1"></i> Sign out
                                </a>
                            </c:if>
                        </div>

                    </div>
                </div>
            </nav>
        </div>

        <!-- =========================================================
             MAIN EDIT FORM CONTENT
             ========================================================= -->
        <main class="page-content py-5 px-3 px-lg-4">
            <div class="container max-width-lg reveal">

                <!-- BACK BUTTON -->
                <a href="${ctx}/products" class="btn btn-link text-white-50 text-decoration-none p-0 mb-4 d-inline-flex align-items-center">
                    <i class="bi bi-arrow-left me-2"></i> Back to Product List
                </a>

                <!-- FORM CONTAINER CARD -->
                <div class="glass-card auth-glass-card p-4 p-md-5 rounded-4 shadow-lg border border-secondary border-opacity-50 relative overflow-hidden">
                    
                    <!-- Background Watermark Icon -->
                    <div class="position-absolute top-0 end-0 p-4 opacity-10 pointer-events-none">
                        <i class="bi bi-pencil-square display-1 text-info"></i>
                    </div>

                    <!-- HEADER -->
                    <div class="mb-4 position-relative z-2">
                        <span class="badge bg-info bg-opacity-10 text-info border border-info border-opacity-25 mb-2 px-3 py-1 rounded-pill">Catalog Control</span>
                        <h1 class="text-white fw-bold mb-2 h2">Refine Product</h1>
                        <p class="text-white-50">Keep the specifications and presentation details current.</p>
                    </div>

                    <!-- Added enctype="multipart/form-data" for file handling -->
                    <form action="${ctx}/products/edit/${product.id}" method="post" enctype="multipart/form-data" class="position-relative z-2">
                        <input type="hidden" name="id" value="${product.id}">

                        <!-- PRODUCT NAME -->
                        <div class="form-group mb-4">
                            <label for="name" class="form-label text-white-50 small text-uppercase fw-semibold mb-2">Product Name</label>
                            <div class="input-group">
                                <span class="input-group-text bg-dark border-secondary text-white-50"><i class="bi bi-box-seam"></i></span>
                                <input type="text" id="name" name="name" class="form-control vt-input bg-dark border-secondary text-white" value="${product.name}" required placeholder="e.g. MacBook Pro 16 M3 Max">
                            </div>
                        </div>

                        <!-- DESCRIPTION -->
                        <div class="form-group mb-4">
                            <label for="description" class="form-label text-white-50 small text-uppercase fw-semibold mb-2">Description</label>
                            <textarea id="description" name="description" class="form-control vt-input bg-dark border-secondary text-white" rows="4" required placeholder="Detailed product summary...">${product.description}</textarea>
                        </div>

                        <!-- CATEGORY, BRAND, STOCK QUANTITY -->
                        <div class="row g-3 mb-4">
                            <div class="col-md-4">
                                <label for="category" class="form-label text-white-50 small text-uppercase fw-semibold mb-2">Category</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-dark border-secondary text-white-50"><i class="bi bi-tag"></i></span>
                                    <input type="text" id="category" name="category" class="form-control vt-input bg-dark border-secondary text-white" value="${product.category}" placeholder="e.g. Laptops" required>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label for="brand" class="form-label text-white-50 small text-uppercase fw-semibold mb-2">Brand</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-dark border-secondary text-white-50"><i class="bi bi-building"></i></span>
                                    <input type="text" id="brand" name="brand" class="form-control vt-input bg-dark border-secondary text-white" value="${product.brand}" placeholder="e.g. Apple" required>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label for="stockQuantity" class="form-label text-white-50 small text-uppercase fw-semibold mb-2">Stock Quantity</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-dark border-secondary text-white-50"><i class="bi bi-layers"></i></span>
                                    <input type="number" id="stockQuantity" name="stockQuantity" class="form-control vt-input bg-dark border-secondary text-white" min="0" value="${product.stockQuantity}" required>
                                </div>
                            </div>
                        </div>

                        <!-- PRICE & DISCOUNT -->
                        <div class="row g-3 mb-4">
                            <div class="col-md-6">
                                <label for="price" class="form-label text-white-50 small text-uppercase fw-semibold mb-2">Price (INR)</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-dark border-secondary text-white-50">₹</span>
                                    <input type="number" id="price" name="price" class="form-control vt-input bg-dark border-secondary text-white" value="${product.price}" step="0.01" min="0" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="discountPercent" class="form-label text-white-50 small text-uppercase fw-semibold mb-2">Discount %</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-dark border-secondary text-white-50">%</span>
                                    <input type="number" id="discountPercent" name="discountPercent" class="form-control vt-input bg-dark border-secondary text-white" value="${product.discountPercent}" step="0.01" min="0" max="100">
                                </div>
                            </div>
                        </div>

                        <!-- CURRENT IMAGE PREVIEW -->
                        <c:if test="${not empty product.imagePath}">
                            <div class="mb-3">
                                <label class="form-label text-white-50 small text-uppercase fw-semibold mb-2">Current Image Preview</label>
                                <div class="p-2 bg-dark rounded-4 border border-secondary border-opacity-50" style="max-width: 240px;">
                                    <img src="${product.imagePath}" alt="${product.name}" class="img-fluid rounded-3 shadow-sm">
                                </div>
                            </div>
                        </c:if>

                        <!-- PRODUCT IMAGE FILE UPLOAD -->
                        <div class="form-group mb-4">
                            <label for="imageFile" class="form-label text-white-50 small text-uppercase fw-semibold mb-2">Update Product Image File</label>
                            <input type="file" name="imageFile" id="imageFile" class="form-control vt-input bg-dark border-secondary text-white" accept="image/jpeg, image/png, image/webp">
                            <small class="form-text text-white-50 mt-1 d-block">
                                <i class="bi bi-info-circle me-1"></i> Leave blank to keep the current image. Upload a new file (JPEG, PNG, WebP) to replace it.
                            </small>
                        </div>

                        <!-- TECHNICAL SPECIFICATIONS -->
                        <div class="form-group mb-4 pt-3 border-top border-secondary border-opacity-25">
                            <label class="form-label text-white-50 small text-uppercase fw-semibold mb-1">Specifications</label>
                            <p class="text-white-50 small mb-3">
                                Add technical details—e.g. RAM, Processor, Storage.
                            </p>

                            <div id="specRows">
                                <c:forEach var="key" items="${product.specKeys}" varStatus="status">
                                    <div class="row g-2 mb-2 spec-row">
                                        <div class="col-md-5">
                                            <input type="text" name="specKeys" class="form-control vt-input bg-dark border-secondary text-white" value="${key}" placeholder="Spec name">
                                        </div>
                                        <div class="col-md-6">
                                            <input type="text" name="specValues" class="form-control vt-input bg-dark border-secondary text-white" value="${product.specValues[status.index]}" placeholder="Value">
                                        </div>
                                        <div class="col-md-1 d-flex align-items-center">
                                            <button type="button" class="btn btn-outline-danger btn-sm remove-spec-btn" title="Remove row">
                                                <i class="bi bi-x-lg"></i>
                                            </button>
                                        </div>
                                    </div>
                                </c:forEach>

                                <c:forEach var="i" begin="1" end="2">
                                    <div class="row g-2 mb-2 spec-row">
                                        <div class="col-md-5">
                                            <input type="text" name="specKeys" class="form-control vt-input bg-dark border-secondary text-white" placeholder="Spec name (e.g. RAM)">
                                        </div>
                                        <div class="col-md-6">
                                            <input type="text" name="specValues" class="form-control vt-input bg-dark border-secondary text-white" placeholder="Value (e.g. 16 GB)">
                                        </div>
                                        <div class="col-md-1 d-flex align-items-center">
                                            <button type="button" class="btn btn-outline-danger btn-sm remove-spec-btn" title="Remove row">
                                                <i class="bi bi-x-lg"></i>
                                            </button>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <button type="button" id="addSpecBtn" class="btn btn-outline-info btn-sm mt-2">
                                <i class="bi bi-plus-lg me-1"></i> Add another specification
                            </button>
                        </div>

                        <!-- ACTION BUTTONS -->
                        <div class="d-flex gap-3 mt-5 pt-3 border-top border-secondary border-opacity-25">
                            <button type="submit" class="btn btn-primary px-4 py-2 fw-semibold rounded-3 d-flex align-items-center">
                                <i class="bi bi-check2-circle me-2"></i> Update Product
                            </button>
                            <a href="${ctx}/products" class="btn btn-outline-light px-4 py-2 fw-semibold rounded-3">
                                Cancel
                            </a>
                        </div>
                    </form>

                </div>
            </div>
        </main>

        <!-- FOOTER -->
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

    </div>

    <!-- BOOTSTRAP JS & SCRIPT FOR DYNAMIC ROWS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const specContainer = document.getElementById('specRows');
            const addSpecBtn = document.getElementById('addSpecBtn');

            addSpecBtn.addEventListener('click', function () {
                const newRow = document.createElement('div');
                newRow.className = 'row g-2 mb-2 spec-row';
                newRow.innerHTML = `
                    <div class="col-md-5">
                        <input type="text" name="specKeys" class="form-control vt-input bg-dark border-secondary text-white" placeholder="Spec name">
                    </div>
                    <div class="col-md-6">
                        <input type="text" name="specValues" class="form-control vt-input bg-dark border-secondary text-white" placeholder="Value">
                    </div>
                    <div class="col-md-1 d-flex align-items-center">
                        <button type="button" class="btn btn-outline-danger btn-sm remove-spec-btn" title="Remove row">
                            <i class="bi bi-x-lg"></i>
                        </button>
                    </div>
                `;
                specContainer.appendChild(newRow);
            });

            specContainer.addEventListener('click', function (e) {
                if (e.target.closest('.remove-spec-btn')) {
                    e.target.closest('.spec-row').remove();
                }
            });
        });
    </script>
</body>
</html>