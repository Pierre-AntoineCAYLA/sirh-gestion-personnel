package dev.sgp.entite;

public class VisiteWeb {
	int id;
	String chemin;
	int tempsExecution;

	public VisiteWeb(int id, String chemin, int tempsExecution) {
		super();
		this.id = id;
		this.chemin = chemin;
		this.tempsExecution = tempsExecution;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getChemin() {
		return chemin;
	}

	public void setChemin(String chemin) {
		this.chemin = chemin;
	}

	public int getTempsExecution() {
		return tempsExecution;
	}

	public void setTempsExecution(int tempsExecution) {
		this.tempsExecution = tempsExecution;
	}
}
