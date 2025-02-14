<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>--%>
<%--&lt;%&ndash;<%@ taglib prefix="c" uri="jakarta.tags.core" %>&ndash;%&gt;--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<!-- partial:partials/_navbar.html -->
<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
    <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-start">
        <a class="navbar-brand brand-logo me-5" href="/">
            <img src="${pageContext.request.contextPath}/images/dashboard/library.png" class="me-2" alt="Logo"/>
        </a>
        <a class="navbar-brand brand-logo-mini" href="/">
            <img
                    src="${pageContext.request.contextPath}/images/dashboard/library-r.png"
                    alt="Logo Reduit"/>
        </a>
    </div>
    <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
            <span class="icon-menu"></span>
        </button>
        <ul class="navbar-nav mr-lg-2">
            <li class="nav-item nav-search d-none d-lg-block">
                <div class="input-group">
                    <div class="input-group-prepend hover-cursor" id="navbar-search-icon">
            <span class="input-group-text" id="search">
              <i class="ti ti-search"></i>
            </span>
                    </div>
                    <input type="text" class="form-control" id="navbar-search-input" placeholder="Rechercher..."
                           aria-label="search" aria-describedby="search">
                </div>
            </li>
        </ul>
        <ul class="navbar-nav navbar-nav-right">
            <li class="nav-item nav-settings d-none d-lg-flex">
                <a class="nav-link" href="#">
                    <i class="ti ti-more-alt"></i>
                </a>
            </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button"
                data-toggle="offcanvas">
            <span class="ti ti-menu-alt"></span>
        </button>
    </div>
</nav>