package dev.sgp.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditerCollaborateursController extends HttpServlet {
	@Override

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String matricule = req.getParameter("matricule");
		resp.setContentType("text/html");
		resp.getWriter().write("<!DOCTYPE html><html><head><meta charset=\"utf-8\" /></head><body>");
		if (matricule == null) {
			resp.setStatus(400);
			resp.getWriter().write("<h1>code =" + resp.getStatus() + "</h1> </br> <h2> un matricule est attendu</h2>");
		} else {
			resp.getWriter().write(
					"<h1>Liste des collaborateurs</h1>" + "<ul>" + "<li>matricule=" + matricule + "</li>" + "</ul>");
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String matricule = req.getParameter("matricule");
		String titre = req.getParameter("titre");
		String nom = req.getParameter("nom");
		String prenom = req.getParameter("prenom");
		resp.setStatus(201);
		resp.setContentType("text/html");

		if (matricule == null) {
			resp.setStatus(400);
			resp.getWriter().write(" <h2> un matricule est attendu</h2>");
		}

		if (titre == null) {
			resp.setStatus(400);
			resp.getWriter().write(" <h2> un titre est attendu</h2>");
		}

		if (nom == null) {
			resp.setStatus(400);
			resp.getWriter().write("<h2> un nom est attendu</h2>");
		}
		if (prenom == null) {
			resp.setStatus(400);
			resp.getWriter().write("<h2> un prenom est attendu</h2>");
		}
		resp.getWriter().write("<h1>code = " + resp.getStatus());
		if (resp.getStatus() == 201) {
			resp.getWriter()
					.write("</h1> </br> <h2> création du collaborateur avec les informations suivantes : </h2></br>"
							+ "<h4> matricule = " + matricule + "</br> titre = " + titre + "</br> nom = " + nom
							+ "</br> prenom = " + prenom + "</h4>");
		}
		resp.getWriter().write("</body></html>");

	}

}
