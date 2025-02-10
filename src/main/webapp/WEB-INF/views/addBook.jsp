<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
    <head>
		<title>Gestion des voitures</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
	</head>
	
	<body>
		
		<h4>Enregistrement d'un livre</h4>
       
       <c:url var="save_voiture_url" value="/books/save"/>
       
        <form:form action="${save_voiture_url}" method="post" modelAttribute="book" class="form">
        
        	<div class="form-group">
	            <form:label path="marque">Marque: </form:label> 
	            <form:input class="form-control" type="text" path="marque"/>
            </div>
            
            <div class="form-group">
	            <form:label path="type">Type: </form:label> 
	            <form:input class="form-control" type="text" path="type"/>
            </div>
      
            
            <div class="form-group">
            <form:label path="kilometrage">Kilométrage: </form:label> 
            <form:input class="form-control" path="kilometrage"/>
           
            
            <div class="form-group">
            	<input type="reset" class="btn btn-warning" value="Annuler"/>
            	<input type="submit" class="btn btn-success" value="Enregistrer"/>
            </div>
            
        </form:form>
    
    </body>
</html>