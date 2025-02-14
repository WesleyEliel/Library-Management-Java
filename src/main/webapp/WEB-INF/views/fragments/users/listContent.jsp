<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<%@ taglib prefix="c" uri="jakarta.tags.core" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Utilisateurs</h3>
                </div>
            </div>
        </div>
    </div>
    <div class="row pt-2">
        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center  mb-4">
                        <h4 class="card-title pt-2 pb-2 pl-5">Liste des utilisateurs.</h4>
                        <a type="button" class="btn btn-primary" href="/users/add">Nouvel utilisateur</a>
                    </div>
                    <c:choose>
                        <c:when test="${empty users}">
                            <div class="container mt-5 rounded border border-1 border-primary-subtle">
                                <div class="row justify-content-center">
                                    <div class="col-md-8 text-center">
                                        <div class="p-5 mt-4 mb-4 text-primary-emphasis" role="alert">
                                            Pas d' utilisateurs trouvés.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="table-responsive">
                                <table class="table table-hover ">
                                    <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Nom complet</th>
                                        <th>Email</th>
                                        <th>Téléphone</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${users}" var="user">
                                        <tr>
                                            <td>${user.id}</td>
                                            <td>${user.fullName}</td>
                                            <td class="text-primary"> ${user.email}</td>
                                            <td class="text-primary"> ${user.phone}</td>
                                            <td>
                                                <div class="d-flex justify-content-between flex-nowrap w-50">
                                                    <a type="button"
                                                       href="/users/${user.id}/update"
                                                       class="d-flex justify-content-center align-items-center btn btn-inverse-success btn-icon">
                                                        <i class="ti-pencil"></i>
                                                    </a>
                                                    <a type="button"
                                                       href="/users/${user.id}/delete"
                                                       class="d-flex justify-content-center align-items-center btn btn-inverse-danger btn-icon">
                                                        <i class="ti-trash"></i>
                                                    </a>
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