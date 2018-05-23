<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@page import="dev.sgp.util.Constantes"%>
<%@page import="dev.sgp.web.ListerVisiteController"%>
<%@page import="dev.sgp.entite.VisiteWeb"%>
<%@page isELIgnored="false"%>
<%@ page language="java" pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<title>Index</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
</head>


<body>

	
		<c:set var="compteurCreer" scope="page" value="${0}" />
		<c:set var="tempsCreer" scope="page" value="${0}" />
		<c:set var="minCreer" scope="page" value="${100000}" />
		<c:set var="maxCreer" scope="page" value="${0}" />

		<c:set var="compteurLister" scope="page" value="${ 0 }" />
		<c:set var="tempsLister" scope="page" value="${ 0 }" />
		<c:set var="minLister" scope="page" value="${ 10000000 }" />
		<c:set var="maxLister" scope="page" value="${ 0 }" />
	


	<c:forEach var="visite" items="${listeVisite}">
		<c:if test="${visite.chemin=='http://localhost:8080/sgp/collaborateurs/creer'}">
			
				<c:set var="compteurCreer" value="${compteurCreer+1}" />
				<c:set var="tempsCreer" value="${temspCreer+visite.tempsExecution}" />
			
			<c:if test="${visite.tempsExecution<minCreer}">
				
					<c:set var="minCreer" value="${visite.tempsExecution}" />
					
			 	 
			</c:if>
			 	 <c:if test="${visite.tempsExectution>maxCreer}">
					  <c:set var="maxCreer" value="${visite.tempsExecution}" />	  
			</c:if>
			  </c:if>			  
			  
			</c:forEach>
	
	 <c:set var="tempsCreer" value="${tempsCreer/compteurCreer}" />	
    <section>
			<table>
			
				<tr>
					<th> Chemin</th>				
					<th> Nombre de Visite </th>
					<th> Min (ms) </th>
					<th> Max (ms) </th>
					<th> Moyenne (ms) </th>
				</tr>
				
				
				<tr>
					<th> /collaborateurs/creer</th>				
					<th> <p><c:out value="${compteurCreer}" /></p> </th>
					<th> <p><c:out value="${minCreer}" /></p>  </th>
					<th> <p><c:out value="${maxCreer}" /></p>  </th>
					<th> <p><c:out value="${tempsCreer}" /></p>  </th>
				</tr>
			</table>
								
		</section>
		
	
				</body>
</html>