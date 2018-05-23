package dev.sgp.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.sgp.entite.VisiteWeb;
import dev.sgp.service.StatistiqueService;
import dev.sgp.util.Constantes;

public class ListerVisiteController extends HttpServlet {
	private StatistiqueService visiteService = Constantes.STATISTIQUES_SERVICE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/collab/Statistiques.jsp").forward(req, resp);
		List<VisiteWeb> listeVisite = visiteService.listerVisite();
	}
}