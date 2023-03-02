package metier;

public class employe {
	
	private int num_emp;
	private String nom_emp;
	private String prenom_emp;
	private String add_emp;
	private String tel_emp;
	private String email_emp;
	private String mdp_emp;
	private String cin_emp;
	private String datenai_emp;
	
	
	public String getMdp_emp() {
		return mdp_emp;
	}
	public void setMdp_emp(String mdp_emp) {
		this.mdp_emp = mdp_emp;
	}
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
	public String getAdd_emp() {
		return add_emp;
	}
	public void setAdd_emp(String add_emp) {
		this.add_emp = add_emp;
	}
	public String getTel_emp() {
		return tel_emp;
	}
	public void setTel_emp(String tel_emp) {
		this.tel_emp = tel_emp;
	}
	public String getEmail_emp() {
		return email_emp;
	}
	public void setEmail_emp(String email) {
		this.email_emp = email;
	}
	public String getCin_emp() {
		return cin_emp;
	}
	public void setCin_emp(String cin_emp) {
		this.cin_emp = cin_emp;
	}
	public String getDatenai_emp() {
		return datenai_emp;
	}
	public void setDatenai_emp(String datenai_emp) {
		this.datenai_emp = datenai_emp;
	}
	
	public employe(int num_emp, String nom_emp, String prenom_emp, String add_emp, String tel_emp, String email_emp,
			String mdp_emp, String cin_emp, String datenai_emp) {
		super();
		this.num_emp = num_emp;
		this.nom_emp = nom_emp;
		this.prenom_emp = prenom_emp;
		this.add_emp = add_emp;
		this.tel_emp = tel_emp;
		this.email_emp = email_emp;
		this.mdp_emp = mdp_emp;
		this.cin_emp = cin_emp;
		this.datenai_emp = datenai_emp;
	}
	public employe() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	

}
