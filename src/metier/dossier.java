package metier;

import java.io.Serializable;
import java.util.List;

public class dossier implements Serializable{
	
	private int num_doss;
	private String nom_doss;
	//private String type_doss;
	private String liste_emp;
	private tache tache_courante;
	private employe empl_courant;
	private String date_ajout;
	private String etat_doss;
	private int progression_doss;
	private int nbre_emp;
	private String tracking_number;
	private String email_cl;
	private boolean state = false;
	
	
	
	public boolean isState() {
		return state;
	}
	public void setState(boolean state) {
		this.state = state;
	}
	public String getTracking_number() {
		return tracking_number;
	}
	public void setTracking_number(String tracking_number) {
		this.tracking_number = tracking_number;
	}
	public String getEmail_cl() {
		return email_cl;
	}
	public void setEmail_cl(String email_cl) {
		this.email_cl = email_cl;
	}
	public dossier() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getNum_doss() {
		return num_doss;
	}
	public void setNum_doss(int num_doss) {
		this.num_doss = num_doss;
	}
	
	public String getDate_ajout() {
		return date_ajout;
	}
	public void setDate_ajout(String date_ajout) {
		this.date_ajout = date_ajout;
	}
	public String getEtat_doss() {
		return etat_doss;
	}
	public void setEtat_doss(String etat_doss) {
		this.etat_doss = etat_doss;
	}
	public String getNom_doss() {
		return nom_doss;
	}
	public void setNom_doss(String nom_doss) {
		this.nom_doss = nom_doss;
	}
	public employe getEmpl_courant() {
		return empl_courant;
	}
	public void setEmpl_courant(employe empl_courant) {
		this.empl_courant = empl_courant;
	}
	public int getProgression_doss() {
		return progression_doss;
	}
	public void setProgression_doss(int progression_doss) {
		this.progression_doss = progression_doss;
	}
	public int getNbre_emp() {
		return nbre_emp;
	}
	public void setNbre_emp(int nbre_emp) {
		this.nbre_emp = nbre_emp;
	}
	public String getListe_emp() {
		return liste_emp;
	}
	public void setListe_emp(String  liste_emp) {
		this.liste_emp = liste_emp;
	}
	public tache getTache_courante() {
		return tache_courante;
	}
	public void setTache_courante(tache tache_courante) {
		this.tache_courante = tache_courante;
	}
	public dossier(int num_doss, String nom_doss, String liste_emp, tache tache_courante, employe empl_courant,
			String date_ajout, String etat_doss, int progression_doss, int nbre_emp, String tracking_number,
			String email_cl) {
		super();
		this.num_doss = num_doss;
		this.nom_doss = nom_doss;
		this.liste_emp = liste_emp;
		this.tache_courante = tache_courante;
		this.empl_courant = empl_courant;
		this.date_ajout = date_ajout;
		this.etat_doss = etat_doss;
		this.progression_doss = progression_doss;
		this.nbre_emp = nbre_emp;
		this.tracking_number = tracking_number;
		this.email_cl = email_cl;
	}
	
	
	
//	public String getType_doss() {
//		return type_doss;
//	}
//	public void setType_doss(String type_doss) {
//		this.type_doss = type_doss;
//	}
	
	
	

}
