<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<%@ taglib prefix="c" uri="jakarta.tags.core" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
        <li class="nav-item">
            <a class="nav-link" href="/" id="sidebar-home-menu">
                <i class="ti ti-pulse menu-icon"></i>
                <span class="menu-title">Dashboard</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/users" id="sidebar-users-menu">
                <i class="ti ti-user menu-icon"></i>
                <span class="menu-title">Utilisateurs</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/books" id="sidebar-books-menu">
                <i class="ti ti-book menu-icon"></i>
                <span class="menu-title">Livres</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/loans" id="sidebar-loans-menu">
                <i class="ti ti-bookmark-alt menu-icon"></i>
                <span class="menu-title">Prêts</span>
            </a>
        </li>
    </ul>
</nav>
<!-- partial -->
