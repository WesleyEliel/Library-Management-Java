<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<%@ taglib prefix="c" uri="jakarta.tags.core" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


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
                        <h4 class="card-title pt-2 pb-2 pl-5 text-">Enregistrer le prêt d' un livre.</h4>
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
                            <c:url var="save_loan_url" value="/loans/save"/>

                            <form:form action="${save_loan_url}" method="post" modelAttribute="loan"
                                       class="forms-sample">

                                <div class="form-group">
                                    <form:label path="relatedUser">Utilisateur relatif : </form:label>
                                    <form:select path="relatedUser" class="form-select" required="required">
                                        <form:options items="${allUsers}" itemValue="id" itemLabel="fullName"/>
                                    </form:select>
                                </div>

                                <div class="form-group">
                                    <form:label path="relatedBook">Livre prêté : </form:label>
                                    <form:select path="relatedBook" class="form-select" required="required">
                                        <form:options items="${availableBooks}" itemValue="id" itemLabel="title"/>
                                    </form:select>
                                </div>

                                <div class="form-group row pt-2">
                                    <div class="col form-group">
                                        <form:label path="loanDate">Date d' emprunt: </form:label>
                                        <form:input path="loanDate" type="date" class="form-control"
                                                    required="required"/>
                                    </div>
                                    <div class="col form-group">
                                        <form:label path="expectedReturnDate">Date de retour prévue: </form:label>
                                        <form:input path="expectedReturnDate" type="date" class="form-control"
                                                    required="required"/>
                                    </div>
                                </div>

                                <div class="d-flex justify-content-between pt-4">
                                    <button type="reset" class="btn btn-outline-danger btn-fw">Annuler</button>
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
