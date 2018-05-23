package dev.sgp.web;

import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.sgp.entite.Collaborateur;
import dev.sgp.service.CollaborateurService;
import dev.sgp.util.Constantes;

public class CreerCollabController extends HttpServlet {
	private CollaborateurService collabService = Constantes.COLLAB_SERVICE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/collab/creerCollab.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String adresse = req.getParameter("adresse");
		String nom = req.getParameter("nom");
		String prenom = req.getParameter("prenom");
		String dateDeNaissance = req.getParameter("date");
		String numeroSecu = req.getParameter("numeroSecurite");
		ZonedDateTime dateHeureCreation = ZonedDateTime.now(ZoneId.of("Europe/Paris"));
		resp.setStatus(201);
		resp.setContentType("text/html");

		if (adresse == null) {
			resp.setStatus(400);

		}

		if (dateDeNaissance == null) {
			resp.setStatus(400);
		}

		if (nom == null) {
			resp.setStatus(400);
		}
		if (prenom == null) {
			resp.setStatus(400);
		}

		if (numeroSecu.trim().length() != 15) {
			resp.setStatus(400);

		}
		resp.getWriter().write("<h1>code = " + resp.getStatus());

		if (resp.getStatus() == 201) {

			Collaborateur collab = new Collaborateur("M" + Math.floor(Math.random() * Math.floor(99)), nom, prenom,
					LocalDate.parse(dateDeNaissance), adresse, numeroSecu, nom + "." + prenom + "@societe.com",
					"photo.jpg", dateHeureCreation, true);
			resp.getWriter()
					.write("</h1> </br> <h2> création du collaborateur avec les informations suivantes : </h2></br>"
							+ "<h4> matricule = " + collab.getMatricule() + "</br> nom = " + collab.getNom()
							+ "</br> prenom = " + collab.getPrenom() + "</br> date de naissance = "
							+ collab.getDateDeNaissance() + "</br> adresse = " + collab.getAdresse()
							+ "</br> numero de secu = " + collab.getNumeroDeSecu() + "</br> mail Pro = "
							+ collab.getEmailPro() + "</br> date heure creation = " + collab.getDateHeureCreation()
							+ "</br> is actif : = " + collab.isActif() + "</h4>");
			resp.sendRedirect("http://localhost:8080/sgp/collaborateurs/lister");
		} else {
			resp.sendRedirect("http://localhost:8080/sgp/collaborateurs/creer?errors");
		}

		resp.getWriter().write("</body></html>");
	}
}