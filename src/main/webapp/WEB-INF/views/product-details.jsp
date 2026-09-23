<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${product.name} · Voltrix</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${ctx}/css/styles.css">
</head>
<body class="vt-controlroom-body">
    <div class="site-shell position-relative z-2 py-5">
        <div class="container max-width-xl">
            
            <a href="${ctx}/products" class="btn btn-outline-light mb-4">
                <i class="bi bi-arrow-left me-2"></i> Back to Catalog
            </a>

            <div class="glass-card auth-glass-card p-4 rounded-4 text-white">
                <div class="row g-4 align-items-center">
                    
                    <!-- PRODUCT IMAGE -->
                    <div class="col-md-5 text-center">
                        <div class="bg-dark bg-opacity-50 rounded-3 p-4 d-flex align-items-center justify-content-center" style="min-height: 300px;">
                            <c:choose>
                                <c:when test="${not empty product.imagePath}">
                                    <img src="${product.imagePath}" alt="${product.name}" class="img-fluid rounded" style="max-height: 280px;">
                                </c:when>
                                <c:otherwise>
                                    <i class="bi bi-cpu display-1 text-info"></i>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>

                    <!-- PRODUCT INFO -->
                    <div class="col-md-7">
                        <span class="badge bg-info text-dark mb-2">${product.category}</span>
                        <h1 class="fw-bold mb-2">${product.name}</h1>
                        <p class="text-white-50 mb-3">${product.description}</p>
                        
                        <div class="mb-3">
                            <span class="fs-3 fw-bold text-info">₹ ${product.price}</span>
                            <c:if test="${product.discountPercent > 0}">
                                <span class="badge bg-success ms-2">${product.discountPercent}% OFF</span>
                            </c:if>
                        </div>

                        <p class="text-white-50 mb-4"><strong>Brand:</strong> ${product.brand} | <strong>Stock Available:</strong> ${product.stockQuantity}</p>

                        <!-- SPECIFICATIONS LIST -->
                        <c:if test="${not empty product.specifications}">
                            <h5 class="fw-semibold text-white mb-2"><i class="bi bi-sliders me-1"></i> Specifications</h5>
                            <ul class="list-group list-group-dark mb-4 bg-transparent">
                                <c:forEach var="spec" items="${product.specifications}">
                                    <li class="list-group-item bg-dark bg-opacity-25 text-white border-secondary d-flex justify-content-between">
                                        <span>${spec.key}</span>
                                        <span class="text-white-50">${spec.value}</span>
                                    </li>
                                </c:forEach>
                            </ul>
                        </c:if>

                        <!-- ACTION BUTTONS -->
                        <div class="d-flex gap-2">
                            <c:choose>
                                <c:when test="${loggedInUser != null && loggedInUser.role == 'ADMIN'}">
                                    <a href="${ctx}/products/edit/${product.id}" class="btn btn-warning px-4 fw-semibold">
                                        <i class="bi bi-pencil-square me-1"></i> Edit Product
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <form action="${ctx}/cart/add" method="post">
                                        <input type="hidden" name="productId" value="${product.id}">
                                        <input type="hidden" name="quantity" value="1">
                                        <button type="submit" class="btn btn-primary px-4 fw-semibold">
                                            <i class="bi bi-bag-plus me-1"></i> Add to Cart
                                        </button>
                                    </form>
                                </c:otherwise>
                            </c:choose>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>