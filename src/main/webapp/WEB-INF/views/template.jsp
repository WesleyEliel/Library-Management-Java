<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<%@ taglib prefix="c" uri="jakarta.tags.core" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Librairie | <c:out value="${pageTitle}"/></title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/ti-icons/css/themify-icons.css"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/ti-icons/css/themify-icons.css">
<%--    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/select.dataTables.min.css">--%>
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/book.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png"/>
</head>
<body>
<!-- partial:partials/_navbar.html -->
<jsp:include page="parts/header.jsp"/>

<!-- partial -->
<div class="container-fluid page-body-wrapper pt-5 mt-3">
    <jsp:include page="parts/sidebar.jsp"/>


    <div class="main-panel">
        <jsp:include page="${content}"/>
        <jsp:include page="parts/footer.jsp"/>
    </div>
</div>
<!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
<!-- plugins:js -->
<script src="${pageContext.request.contextPath}/vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->

<script src="${pageContext.request.contextPath}/js/dataTables.select.min.js"></script>
<!-- End plugin js for this page -->
<!-- inject:js -->
<script src="${pageContext.request.contextPath}/js/off-canvas.js"></script>
<script src="${pageContext.request.contextPath}/js/template.js"></script>
<script src="${pageContext.request.contextPath}/js/settings.js"></script>
<!-- endinject -->
<!-- Custom js for this page-->

</body>
</html>