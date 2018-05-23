<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="dev.sgp.util.Constantes"%>
<%@page import="dev.sgp.web.ListerCollaborateursController"%>
<%@page import="dev.sgp.entite.Collaborateur"%>
<%@ page language="java" pageEncoding="UTF-8"%>
  <!doctype html>
  <html>
  	<head>
  		<meta charset="UTF-8"/>
  		<title>Index</title>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
     </head>


  <body>

    <div class="container">
      <div class="row">
        <div class="col">
      <header>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Collaborateurs</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="#">Statistiques</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Activités</a>
        </li>
      </ul>
    </div>
  </nav>
  	</header>
    </div>
    </div>

    <div id="ajouter" class="row justify-content-end">
            <div class="col-4">
              <a href="nouveauColaborateur.html"><input type="submit" value="Ajouter un nouveau collaborateur"></a>
          </div>
      </div>

        <div class="row">
          <div class="col-8">
            <h1>Les collaborateurs</h1>
          </div>
        </div>


  	  <div id="rechercher">
           <div class="row">
             <div class="col-4">
               <label for="name">Rechercher un nom ou un prenom qui commence par :</label>
             </div>
             <div class="col-2">
               <input type="text" name="name" id="name"> </br>	</br>
             </div>
             <div class="col-2">
               <input type="submit" value="Rechercher">
             </div>
             <div class="col-4">
               <input type="checkbox" name="activer" value="oui">Voir les collaborateurs desactiver
             </div>
           </div>
           <div class="row">
             <div class="col-4">
               <label for="ville">Filtrer par departement :</label>
             </div>
             <div class="col-5">
               <select>
  				        <option> Tous </option>
  				        <option> Comptabilité </option>
  				        <option> Ressources humaines </option>
  				        <option> Informatique </option>
     		         </select> </br>
               </div>
  	          </div>
            </div>

             <div class="row">
			<%
			List<Collaborateur> listeCollab=Constantes.COLLAB_SERVICE.listerCollaborateurs();
			for (Collaborateur collab : listeCollab) { %>
          <div class="col-3">
                  <div class="card">
                      <div class="card-header">
                          <%=collab.getNom()%>
                          <%=collab.getPrenom()%>
                      </div>
                      <div class="card-body">
                        <img src="<%=request.getContextPath() %>/photo.jpg"/>
                        <p class="card-text">
                        <%=collab.getAdresse()%> <br/>
                        <%=collab.getDateDeNaissance()%><br/>
                         <%=collab.getEmailPro()%><br/>
                         <%=collab.getNumeroDeSecu()%><br/>
                          <a href="#" class="btn btn-primary">Editer</a>
                        </div>
                      </div>
                    </div>              			
			 <% }%>		
			</div>
		</div>	
	</body>
</html>