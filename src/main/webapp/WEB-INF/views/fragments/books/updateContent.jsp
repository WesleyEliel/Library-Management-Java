<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<%@ taglib prefix="c" uri="jakarta.tags.core" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Livres</h3>
                </div>
            </div>
        </div>
    </div>
    <div class="row pt-2">
        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center  mb-4">
                        <h4 class="card-title pt-2 pb-2 pl-5 text-">Ajout d' un nouveau livre.</h4>
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
                            <c:url var="save_book_url" value="/books/${book.id}/update-save"/>

                            <form:form action="${save_book_url}" method="post" modelAttribute="book"
                                       class="forms-sample">
                                <div class="form-group">
                                    <form:label path="title">Titre: </form:label>
                                    <form:input path="title" type="text" class="form-control"
                                                placeholder="Titre" required="required"/>
                                </div>
                                <div class="form-group">
                                    <form:label path="genre">Genre: </form:label>
                                    <form:input path="genre" type="text" class="form-control"
                                                placeholder="Le genre du livre" required="required"/>
                                </div>
                                <div class="form-group">

                                    <form:label
                                            path="publishedAt">Date de publication: </form:label>
                                    <form:input path="publishedAt" type="date" class="form-control"
                                                value="${book.publishedAt}" required="required"/>
                                </div>

                                <div class="form-group row pt-2">
                                    <div class="col-9 form-group">
                                        <form:label path="author">Auteur : </form:label>
                                        <form:select path="author" class="form-select" required="required">
                                            <form:options items="${allUsers}" itemValue="id" itemLabel="fullName"/>
                                        </form:select>
                                    </div>

                                    <div class="col-3 form-group">
                                        <form:label path="isAvailable">Disponible : </form:label>
                                        <form:select path="isAvailable" class="form-select" required="required">
                                            <form:options items="${availabilityStatuses}"/>
                                        </form:select>

                                    </div>
                                </div>

                                <div class="d-flex justify-content-between pt-4">
                                    <a class="btn btn-outline-danger btn-fw" href="/books">Annuler</a>
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
