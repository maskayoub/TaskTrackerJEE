package metier;

import java.util.List;

public interface IContactMetier {
	
	public void initierContact(contact c);
	public List<contact> listeContact();
	public List<contact> listeContactDisplay();
	public contact getContact(int num_contact);
	public void repondreContact(contact c);
	public void updateContact(contact c);

}
