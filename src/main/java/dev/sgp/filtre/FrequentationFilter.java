package dev.sgp.filtre;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import dev.sgp.entite.VisiteWeb;
import dev.sgp.util.Constantes;

public class FrequentationFilter implements Filter {
	private FilterConfig config = null;

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		VisiteWeb visite = new VisiteWeb(0, "", 0);
		int compteur = 0;
		long before = System.currentTimeMillis();
		chain.doFilter(req, resp);
		long after = System.currentTimeMillis();
		String path = ((HttpServletRequest) req).getRequestURI();
		config.getServletContext().log(path + " : " + (after - before));
		compteur = compteur + 1;
		visite.setId(compteur);
		visite.setChemin(path);
		visite.setTempsExecution((int) (after - before));
		Constantes.STATISTIQUES_SERVICE.sauvegarderVisite(visite);
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		this.config = config;
		config.getServletContext().log("FrequentationFilter initialized");

	}

}
