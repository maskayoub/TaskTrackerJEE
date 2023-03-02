package metier;

public class contact {
	private int num_contact;
	private String nom_contact;
	private String email_contact;
	private String sujet_contact;
	private String message_contact;
	private boolean etat_contact = false;
	public int getNum_contact() {
		return num_contact;
	}
	public void setNum_contact(int num_contact) {
		this.num_contact = num_contact;
	}
	public String getNom_contact() {
		return nom_contact;
	}
	public void setNom_contact(String nom_contact) {
		this.nom_contact = nom_contact;
	}
	public String getEmail_contact() {
		return email_contact;
	}
	public void setEmail_contact(String email_contact) {
		this.email_contact = email_contact;
	}
	public String getSujet_contact() {
		return sujet_contact;
	}
	public void setSujet_contact(String sujet_contact) {
		this.sujet_contact = sujet_contact;
	}
	public String getMessage_contact() {
		return message_contact;
	}
	public void setMessage_contact(String message_contact) {
		this.message_contact = message_contact;
	}
	public boolean isEtat_contact() {
		return etat_contact;
	}
	public void setEtat_contact(boolean etat_contact) {
		this.etat_contact = etat_contact;
	}
	public contact(int num_contact, String nom_contact, String email_contact, String sujet_contact,
			String message_contact, boolean etat_contact) {
		super();
		this.num_contact = num_contact;
		this.nom_contact = nom_contact;
		this.email_contact = email_contact;
		this.sujet_contact = sujet_contact;
		this.message_contact = message_contact;
		this.etat_contact = etat_contact;
	}
	public contact() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
