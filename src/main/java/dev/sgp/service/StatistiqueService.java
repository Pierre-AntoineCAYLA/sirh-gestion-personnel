package dev.sgp.service;

import java.util.ArrayList;
import java.util.List;

import dev.sgp.entite.VisiteWeb;

public class StatistiqueService {
	List<VisiteWeb> listeVisite = new ArrayList<>();

	public List<VisiteWeb> listerVisite() {
		return listeVisite;
	}

	public void sauvegarderVisite(VisiteWeb visite) {
		listeVisite.add(visite);
	}

}
