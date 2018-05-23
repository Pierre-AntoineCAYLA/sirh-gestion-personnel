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
import dev.sgp.util.Constantes;

public class CreerCollabController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/collab/creerCollab.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String adresse = (String) req.getParameter("adresse");
		String nom = (String) req.getParameter("nom");
		String prenom = (String) req.getParameter("prenom");
		String dateDeNaissance = (String) req.getParameter("date");
		String numeroSecu = (String) req.getParameter("numeroSecurite");
		ZonedDateTime dateHeureCreation = ZonedDateTime.now(ZoneId.of("Europe/Paris"));
		resp.setStatus(200);
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
		if (numeroSecu != null && numeroSecu.trim().length() != 15) {
			resp.setStatus(400);

		}

		if (resp.getStatus() == 200) {

			Collaborateur collab = new Collaborateur("M" + Math.floor(Math.random() * Math.floor(99)), nom, prenom,
					LocalDate.parse(dateDeNaissance), adresse, numeroSecu, nom + "." + prenom + "@societe.com",
					"photo.jpg", dateHeureCreation, true);
			Constantes.COLLAB_SERVICE.sauvegarderCollaborateur(collab);

			resp.sendRedirect("http://localhost:8080/sgp/collaborateurs/lister");
		} else {
			resp.sendRedirect("http://localhost:8080/sgp/collaborateurs/creer?errors");
		}

		resp.getWriter().write("</body></html>");
	}
}