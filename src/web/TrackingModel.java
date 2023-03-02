package web;

import java.util.ArrayList;
import java.util.List;

import metier.IDossiersMetier;
import metier.TacheCount;
import metier.dossier;
import metier.employe;
import metier.tache;
import metier.user;



public class TrackingModel {
	
private IDossiersMetier metier;
	
	private dossier rs = new dossier();
	private List<dossier> dossier = new ArrayList<dossier>();
	private List<employe> emp = new ArrayList<employe>();
	private List<tache> taches = new ArrayList<tache>();
	private user ur = new user();
	private employe em = new employe();
	private List<TacheCount> tachecount = new ArrayList<TacheCount>();
	
	
	
	public List<TacheCount> getTachecount() {
		return tachecount;
	}
	public void setTachecount(List<TacheCount> tachecount) {
		this.tachecount = tachecount;
	}
	public IDossiersMetier getMetier() {
		return metier;
	}
	public void setMetier(IDossiersMetier metier) {
		this.metier = metier;
	}
	public employe getEm() {
		return em;
	}
	public void setEm(employe em) {
		this.em = em;
	}
	public user getUr() {
		return ur;
	}
	public void setUr(user ur) {
		this.ur = ur;
	}
	public List<tache> getTaches() {
		return taches;
	}
	public void setTaches(List<tache> taches) {
		this.taches = taches;
	}
	public List<employe> getEmp() {
		return emp;
	}
	public void setEmp(List<employe> emp) {
		this.emp = emp;
	}
	public dossier getRs() {
		return rs;
	}
	public void setRs(dossier rs) {
		this.rs = rs;
	}
	
	public List<dossier> getDossier() {
		
		return dossier;
	}
	public void setDossier(List<dossier> dossier) {
		this.dossier = dossier;
	}
	
	

}
