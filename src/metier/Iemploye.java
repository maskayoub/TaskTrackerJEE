package metier;
import java.util.List;


public interface Iemploye {
	
	public int addEmploye(employe e);
	public List<employe> listeEmployes();
	public void updateEmploye(employe e);
	public void deleteEmploye(int num_emp);
	public employe getEmploye(int num_emp);
	public employe getEmployeTwo(String email, String mdp);
	List<employe> listeEmployesLogin();
	

}
