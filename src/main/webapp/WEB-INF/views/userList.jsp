<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--&lt;%&ndash; Définition de la variable pour le titre et le contenu &ndash;%&gt;--%>
<c:set var="pageTitle" value="Liste des utilisateurs" scope="request"/>
<c:set var="content" value="fragments/users/listContent.jsp" scope="request"/>

<%-- Inclusion du template principal --%>
<jsp:include page="template.jsp"/>