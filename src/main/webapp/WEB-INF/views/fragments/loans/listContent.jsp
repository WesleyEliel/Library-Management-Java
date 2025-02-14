<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<%@ taglib prefix="c" uri="jakarta.tags.core" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Prêts</h3>
                </div>
            </div>
        </div>
    </div>
    <div class="row pt-2">
        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center  mb-4">
                        <h4 class="card-title pt-2 pb-2 pl-5">Liste des prêts.</h4>
                        <a type="button" class="btn btn-primary" href="/loans/add">Enregistrer un prêt</a>
                    </div>
                    <c:choose>
                        <c:when test="${empty loans}">
                            <div class="container mt-5 rounded border border-1 border-primary-subtle">
                                <div class="row justify-content-center">
                                    <div class="col-md-8 text-center">
                                        <div class="p-5 mt-4 mb-4 text-primary-emphasis" role="alert">
                                            Pas de prêts enregistrés.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Utilisateur</th>
                                        <th>Livre</th>
                                        <th>Status</th>
                                        <th class="text-center">Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${loans}" var="loan">
                                        <tr>
                                            <td>${loan.id}</td>
                                            <td>${loan.getRelatedUser().fullName}</td>
                                            <td class="text-primary"> ${loan.getRelatedBook().title}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${loan.status == 'EN_COURS'}">
                                                        <label class="badge badge-warning">En cours</label>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <label class="badge badge-success">Terminé</label>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <div class="d-flex justify-content-center align-items-center">
                                                    <c:choose>
                                                        <c:when test="${loan.status == 'EN_COURS'}">
                                                            <a type="button"
                                                               aria-label="Terminer"
                                                               href="/loans/${loan.id}/end-loan"
                                                               class="btn btn-secondary text-center">
                                                                Terminer
                                                            </a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <p>_______</p>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </td>
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