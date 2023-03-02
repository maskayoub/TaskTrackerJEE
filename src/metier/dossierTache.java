package metier;

public class dossierTache {
	private String nameEmp;
	private String duree;
	public String getNameEmp() {
		return nameEmp;
	}
	public void setNameEmp(String nameEmp) {
		this.nameEmp = nameEmp;
	}
	public String getDuree() {
		return duree;
	}
	public void setDuree(String duree) {
		this.duree = duree;
	}
	public dossierTache(String nameEmp, String duree) {
		super();
		this.nameEmp = nameEmp;
		this.duree = duree;
	}
	public dossierTache() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
