<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<%@ taglib prefix="c" uri="jakarta.tags.core" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Bon retour...</h3>
                    <h6 class="font-weight-normal mb-4">Votre application de gestion de livres, prêts de livre
                        et autres... </h6>
                </div>
            </div>
        </div>
    </div>
    <div class="row mb-4">
        <div class="col-md-6 grid-margin stretch-card">
            <div class="card tale-bg">
                <div class="card-people mt-auto">
                    <img src="${pageContext.request.contextPath}/images/dashboard/people.svg" alt="people">
                    <div class="weather-info">
                        <div class="d-flex">
                            <div>
                                <h2 class="mb-0 font-weight-normal"><i class="icon-sun me-2"></i>${ formattedTime }
                                </h2>
                            </div>
                            <div class="ms-2">
                                <h4 class="location font-weight-normal">Bénin</h4>
                                <h6 class="font-weight-normal">Abomey-Calavi</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6 grid-margin transparent">
            <div class="row">
                <div class="col-md-6 mb-4 stretch-card transparent">
                    <div class="card card-tale">
                        <div class="card-body">
                            <p class="mb-4">Total des utilisateurs</p>
                            <p class="fs-30 mb-2">${ totalUsers }</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-4 stretch-card transparent">
                    <div class="card card-dark-blue">
                        <div class="card-body">
                            <p class="mb-4">Total des livres</p>
                            <p class="fs-30 mb-2">${ totalBooks }</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-4 mb-lg-0 stretch-card transparent">
                    <div class="card card-light-blue">
                        <div class="card-body">
                            <p class="mb-4">Total des prêts</p>
                            <p class="fs-30 mb-2">${ totalLoans }</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 stretch-card transparent">
                    <div class="card card-light-danger">
                        <div class="card-body">
                            <p class="mb-4">Total des prêts actifs</p>
                            <p class="fs-30 mb-2">${ totalActiveLoans }</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row pt-2">
        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <p class="card-title mb-4">Les dernier livres</p>
                    <c:choose>
                        <c:when test="${empty lastBooks}">
                            <div class="container mt-5 rounded border border-1 border-primary-subtle">
                                <div class="row justify-content-center">
                                    <div class="col-md-8 text-center">
                                        <div class="p-5 mt-4 mb-4 text-primary-emphasis" role="alert">
                                            Pas de livres trouvés.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="table-responsive">
                                <table class="table table-striped table-borderless">
                                    <thead class="mb-5">
                                    <tr>
                                        <th>Nom</th>
                                        <th>Genre</th>
                                        <th>Auteur</th>
                                        <th>Publié le</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${lastBooks}" var="book">
                                        <tr>
                                            <td>${ book.title }</td>
                                            <td>${ book.genre }</td>
                                            <td class="font-weight-bold">${ book.getAuthor().fullName }</td>
                                            <td>${ book.publishedAt }</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>