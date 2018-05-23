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
  		<meta charset="UTF-8"/>
  		<title>Index</title>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
     </head>


  <body>

			   <p><c:set var="compteurCreer" scope="page" value="${ 0 }"></c:set>
			   	  <c:set var="tempsCreer" scope="page" value="${0 }"></c:set>
			   	  <c:set var="minCreer" scope="page" value="${ 100000 }"></c:set>
			   	  <c:set var="maxCreer" scope="page" value="${ 0 }"></c:set>
				  
				  <c:set var="compteurLister" scope="page" value="${ 0 }"></c:set>
			   	  <c:set var="tempsLister" scope="page" value="${ 0 }"></c:set>
			   	  <c:set var="minLister" scope="page" value="${ 10000000 }"></c:set>
			   	  <c:set var="maxLister" scope="page" value="${ 0 }"></c:set>
				  </p>
			
			
			<c:forEach var="visite" items="${listeVisite}">
				<c:if test="${visite.chemin.isEqual(http://localhost:8080/sgp/collaborateurs/creer)}">
				  <p><c:set var="compteurCreer"value="${compteurCreer+1}"</c:set>
			   	  <c:set var="tempsCreer" value="${temspCreer+visite.tempsExecution}"</c:set></p>
			      <c:if test="${visite.tempsExectution<minCreer)}">
			 		<p> <c:set var="minCreer" value="${visite.tempsExecution}"</c:set><p>
			 	 </c:if>
			 	 <c:if test="${visite.tempsExectution>maxCreer)}">
					 <p> <c:set var="maxCreer" value="${visite.tempsExecution}"</c:set><p>
				  </c:if>
			  </c:if>
			  
			  	<c:if test="${visite.chemin.isEqual(http://localhost:8080/sgp/collaborateurs/lister)}">
				  <p><c:set value="${ compteurLister }">compteurLister+1</c:set>
			   	  <c:set value="${ tempsLister }">temspListerr+visite.tempsExecution</c:set></p>
			      <c:if test="${visite.tempsExectution<minLister)}">
			 		<p> <c:set value="${ minlister }">visite.tempsExecution</c:set><p>
			 	 </c:if>
			 	 <c:if test="${visite.tempsExectution>maxLister)}">
					 <p> <c:set value="${ maxLister }">visite.tempsExecution</c:set><p>
				  </c:if>
			  </c:if>
			</c:forEach>
	
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
					<th>  </th>
					<th> Min (ms) </th>
					<th> Max (ms) </th>
					<th> Moyenne (ms) </th>
				</tr>
			</table>
								
		</section>
		
	</body>
</html>