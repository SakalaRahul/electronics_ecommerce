<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Write Review · Voltrix</title>
    
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

    <div class="site-shell position-relative z-2 py-5">
        <div class="container max-width-md">
            <div class="glass-card auth-glass-card p-5 rounded-4 shadow-sm my-4">
                <div class="text-center mb-4">
                    <i class="bi bi-star-fill text-warning display-4 mb-2"></i>
                    <h2 class="text-white fw-bold">How was your product?</h2>
                    <p class="text-white-50">Share your feedback for <strong class="text-white">${product.name}</strong></p>
                </div>

                <form action="${ctx}/review/save" method="post">
                    <input type="hidden" name="productId" value="${product.id}">
                    
                    <div class="mb-3">
                        <label class="form-label text-white">Rating (1 to 5 Stars)</label>
                        <select name="rating" class="form-select bg-dark text-white border-secondary py-2">
                            <option value="5">★★★★★ - 5 Stars (Excellent)</option>
                            <option value="4">★★★★☆ - 4 Stars (Good)</option>
                            <option value="3">★★★☆☆ - 3 Stars (Average)</option>
                            <option value="2">★★☆☆☆ - 2 Stars (Poor)</option>
                            <option value="1">★☆☆☆☆ - 1 Star (Terrible)</option>
                        </select>
                    </div>

                    <div class="mb-4">
                        <label class="form-label text-white">Your Review Comments</label>
                        <textarea name="comment" class="form-control bg-dark text-white border-secondary" rows="4" placeholder="Write details about performance, build quality..." required></textarea>
                    </div>

                    <div class="d-flex gap-2">
                        <button type="submit" class="btn btn-primary flex-grow-1 py-2 fw-semibold shadow-sm">Submit Review</button>
                        <a href="${ctx}/products" class="btn btn-outline-light py-2 px-4">Skip</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- BOOTSTRAP JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>