<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Reviews for ${product.name} · Voltrix</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${ctx}/css/styles.css">
</head>
<body class="vt-controlroom-body">

    <div class="container py-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h2 class="text-white fw-bold">Customer Reviews</h2>
                <p class="text-white-50">Feedback for <strong class="text-white">${product.name}</strong></p>
            </div>
			<a href="${ctx}/products" class="btn btn-outline-light mb-4">
			                <i class="bi bi-arrow-left me-2"></i> Back to Catalog
			            </a>
        </div>

        <c:choose>
            <c:when test="${empty reviews}">
                <div class="glass-card p-5 text-center rounded-4">
                    <p class="text-white-50 mb-0">No reviews yet for this product. Be the first to leave one after your purchase!</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="row g-3">
                    <c:forEach var="rev" items="${reviews}">
                        <div class="col-md-12">
                            <div class="glass-card p-4 rounded-4">
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <h5 class="text-white mb-0"><i class="bi bi-person-circle me-2"></i>${rev.username}</h5>
                                    <div class="text-warning">
                                        <c:forEach begin="1" end="${rev.rating}">★</c:forEach>
                                        <c:forEach begin="1" end="${5 - rev.rating}"><span class="text-muted">☆</span></c:forEach>
                                    </div>
                                </div>
                                <p class="text-white-50 mb-0">${rev.comment}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>