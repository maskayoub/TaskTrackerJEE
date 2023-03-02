package metier;

public class user {
	private int num_user;
	private String username;
	private String nom_user;
	private String prenom_user;
	private String email_user;
	private String tel_user;
	private String mdp_user;
	public int getNum_user() {
		return num_user;
	}
	public void setNum_user(int num_user) {
		this.num_user = num_user;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getNom_user() {
		return nom_user;
	}
	public void setNom_user(String nom_user) {
		this.nom_user = nom_user;
	}
	public String getPrenom_user() {
		return prenom_user;
	}
	public void setPrenom_user(String prenom_user) {
		this.prenom_user = prenom_user;
	}
	public String getEmail_user() {
		return email_user;
	}
	public void setEmail_user(String email_user) {
		this.email_user = email_user;
	}
	public String getTel_user() {
		return tel_user;
	}
	public void setTel_user(String tel_user) {
		this.tel_user = tel_user;
	}
	public String getMdp_user() {
		return mdp_user;
	}
	public void setMdp_user(String mdp_user) {
		this.mdp_user = mdp_user;
	}
	public user(int num_user, String username, String nom_user, String prenom_user, String email_user, String tel_user,
			String mdp_user) {
		super();
		this.num_user = num_user;
		this.username = username;
		this.nom_user = nom_user;
		this.prenom_user = prenom_user;
		this.email_user = email_user;
		this.tel_user = tel_user;
		this.mdp_user = mdp_user;
	}
	public user() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
