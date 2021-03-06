<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <html>
    	<head>
    		<meta charset="UTF-8"/>
    		<title>Index</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
       </head>




    <body onload="formIsValid()" >

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

          <div class="row">
            <div class="col-8">
              <h1>Nouveau collaborateur</h1>
            </div>
          </div>

        <form method="POST">
            <div class="row">

                <div class="col-5">
                  <label for="nom">Nom</label>
                </div>
                <div class="col-4">
                  <input type="text" class="form-control" id="nom" placeholder="Nom" required>
                </div>
              </div>

              <div class="row">
                <div class="col-5">
                  <label for="prenom">Prenom</label>
                </div>
                <div class="col-4">
                  <input type="text" class="form-control" id="prenom" placeholder="Prenom" required>
                </div>
              </div>

              <div class="row">
                <div class="col-5">
                  <label for="date">Date de Naissance</label>
                </div>
                <div class="col-4">
                  <input type="date" class="form-control" id="date" placeholder="Date" required>
                </div>
              </div>

              <div class="row">
                <div class="col-5">
                    <label for="adresse">Adresse</label>
                  </div>
                  <div class="col-4">
                    <input type="text" class="form-control" id="adresse" placeholder="Adresse" required>
                </div>
              </div>

              <div class="row">
                <div class="col-5">
                  <label for="numeroSecurite">Numero de sécurité sociale</label>
                </div>
                <div class="col-4">
                  <input type="number" class="form-control" id="numeroSecurite" placeholder="NumeroSecurite" maxlength=15 required>
              </div>
            </div>

          <div class="row justify-content-center">
            <div class="col-8">
          <button type="submit" class="form-control">Créer</button>
        </div>
          </div>
        </form>
</div>
        


        <script>

          function formIsValid(){

            var url=document.location.href;
            var nom = document.getElementById('nom');
            var prenom = document.getElementById('prenom');
            var date = document.getElementById('date');
            var adresse = document.getElementById('adresse');
            var numeroSecurite = document.getElementById('numeroSecurite');
            if(url==="http://localhost:8080/sgp/collaborateurs/creer?errors"){
              nom.setAttribute("class","is-invalid form-control");
              prenom.setAttribute("class","is-invalid form-control");
              adresse.setAttribute("class","is-invalid form-control");
              date.setAttribute("class","is-invalid form-control");
              numeroSecurite.setAttribute("class","is-invalid form-control");
          }
            
        }


        

                  

        </script>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

    	</body>

    </html>
