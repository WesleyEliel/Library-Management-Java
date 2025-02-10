<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html>

<head>
    <title>Liste des livres</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">

</head>

<body>

<h4>Affichage de la liste des voitures</h4>

<table class="table table-striped">
    <tr>
        <th colspan="4"><a href="/books/add">Nouveau</a></th>
    </tr>
    <tr class="table-primary">
        <th>Marque</th>
        <th>Type</th>
        <th>Kilométrage</th>
        <th>Nbre portes</th>
    </tr>

    <c:forEach items="${books}" var="book">

        <tr>
            <th>${voiture.marque}</th>
            <th>${voiture.type}</th>
            <th>${voiture.kilometrage}</th>
            <th>${voiture.nbPortes}</th>
        </tr>

    </c:forEach>

</table>


</body>
</html>