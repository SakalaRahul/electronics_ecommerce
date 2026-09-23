<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>User Payments Audit · Voltrix</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/css/styles.css">
</head>
<body class="vt-controlroom-body">
    <div class="vt-page-glow glow-top-left"></div>
    <div class="vt-page-glow glow-bottom-right"></div>

    <div class="container py-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <a href="${ctx}/admin/dashboard" class="text-white-50 text-decoration-none small"><i class="bi bi-arrow-left me-1"></i> Control Room</a>
                <h1 class="h3 text-white fw-bold mt-1">User Payments & Orders Ledger</h1>
            </div>
        </div>

        <div class="glass-card auth-glass-card p-4 rounded-4 shadow-lg border border-secondary border-opacity-25">
            <div class="table-responsive">
                <table class="table table-dark table-hover align-middle mb-0">
                    <thead>
                        <tr class="text-white-50 small text-uppercase">
                            <th>Transaction ID</th>
                            <th>Customer Username</th>
                            <th>Purchased Products</th>
                            <th>Payment Method</th>
                            <th>Amount Paid</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Changed from paymentsList to orders -->
                        <c:choose>
                            <c:when test="${not empty orders}">
                                <c:forEach var="order" items="${orders}">
                                    <tr>
                                        <td><code class="text-info">${order.razorpayPaymentId != null ? order.razorpayPaymentId : 'N/A'}</code></td>
                                        <td>${order.user != null ? order.user.username : 'Unknown'}</td>
                                        <td>
                                            <span class="text-white">
                                                <c:forEach var="item" items="${order.orderItems}">
                                                    <div>${item.product.name} (x${item.quantity})</div>
                                                </c:forEach>
                                            </span>
                                        </td>
                                        <td><span class="badge bg-secondary">${order.paymentMethod != null ? order.paymentMethod : 'Razorpay'}</span></td>
                                        <td class="fw-bold text-success">₹<fmt:formatNumber value="${order.totalPrice}" pattern="#,##0.00"/></td>
                                        <td><span class="badge bg-success bg-opacity-25 text-success">${order.orderStatus}</span></td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="6" class="text-center text-white-50 py-4">No payment transactions recorded yet.</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>