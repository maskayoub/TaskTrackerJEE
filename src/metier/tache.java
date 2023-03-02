package metier;

import java.util.List;

public class tache {
	private int num_tache;
	private String nom_tache;
	private int num_doss;
	private int num_emp;
	private String temp_debut;
	private String temp_fin;
	private int ordre;
	private String temps;
	
	public String getTemps() {
		return temps;
	}
	public void setTemps(String temps) {
		this.temps = temps;
	}
	public String getNom_tache() {
		return nom_tache;
	}
	public void setNom_tache(String nom_tache) {
		this.nom_tache = nom_tache;
	}
	public int getNum_doss() {
		return num_doss;
	}
	public void setNum_doss(int num_doss) {
		this.num_doss = num_doss;
	}
	public int getNum_emp() {
		return num_emp;
	}
	public void setNum_emp(int num_emp) {
		this.num_emp = num_emp;
	}
	public String getTemp_debut() {
		return temp_debut;
	}
	public void setTemp_debut(String temp_debut) {
		this.temp_debut = temp_debut;
	}
	public String getTemp_fin() {
		return temp_fin;
	}
	public void setTemp_fin(String temp_fin) {
		this.temp_fin = temp_fin;
	}
	public int getOrdre() {
		return ordre;
	}
	public void setOrdre(int order) {
		this.ordre = order;
	}
	
	public tache() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public tache(int num_tache, String nom_tache, int num_doss, int num_emp, String temp_debut, String temp_fin,
			int ordre, String temps) {
		super();
		this.num_tache = num_tache;
		this.nom_tache = nom_tache;
		this.num_doss = num_doss;
		this.num_emp = num_emp;
		this.temp_debut = temp_debut;
		this.temp_fin = temp_fin;
		this.ordre = ordre;
		this.temps = temps;
	}
	public int getNum_tache() {
		return num_tache;
	}
	public void setNum_tache(int num_tache) {
		this.num_tache = num_tache;
	}
	
	
	
	

}
