package metier;

public class TacheCount {
	
	private int num_emp;
	private String nom_emp;
	private String prenom_emp;
	private int count;
	public int getNum_emp() {
		return num_emp;
	}
	public void setNum_emp(int num_emp) {
		this.num_emp = num_emp;
	}
	public String getNom_emp() {
		return nom_emp;
	}
	public void setNom_emp(String nom_emp) {
		this.nom_emp = nom_emp;
	}
	public String getPrenom_emp() {
		return prenom_emp;
	}
	public void setPrenom_emp(String prenom_emp) {
		this.prenom_emp = prenom_emp;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public TacheCount(int num_emp, String nom_emp, String prenom_emp, int count) {
		super();
		this.num_emp = num_emp;
		this.nom_emp = nom_emp;
		this.prenom_emp = prenom_emp;
		this.count = count;
	}
	public TacheCount() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
