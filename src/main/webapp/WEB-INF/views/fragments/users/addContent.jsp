<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<%@ taglib prefix="c" uri="jakarta.tags.core" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


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
                        <h4 class="card-title pt-2 pb-2 pl-5 text-">Ajout d' un nouvel utilisateur.</h4>
                    </div>
                    <div class="row justify-content-md-center">
                        <div class="col-12 col-md-8">

                            <c:choose>
                                <c:when test="${not empty error}">
                                    <div class="alert alert-danger" role="alert">
                                            ${error}
                                    </div>
                                </c:when>
                            </c:choose>
                            <c:url var="save_user_url" value="/users/save"/>

                            <form:form action="${save_user_url}" method="post" modelAttribute="user"
                                       class="forms-sample">
                                <div class="form-group">
                                    <form:label path="fullName">Nom complet: </form:label>
                                    <form:input path="fullName" type="text" class="form-control" id="fullName"
                                                placeholder="Nom et prénoms" required="required"/>
                                </div>
                                <div class="form-group">
                                    <form:label path="email">Email address: </form:label>
                                    <form:input path="email" type="email" class="form-control"
                                                placeholder="Adresse e-mail" required="required"/>
                                </div>
                                <div class="form-group">

                                    <form:label path="phone">Téléphone: </form:label>
                                    <form:input path="phone" type="tel" class="form-control"
                                                placeholder="Numéro de téléphone" required="required"/>
                                </div>

                                <div class="d-flex justify-content-between pt-4">
                                    <button class="btn btn-outline-danger btn-fw">Annuler</button>
                                    <button type="submit" class="btn btn-primary">Enregistrer</button>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
