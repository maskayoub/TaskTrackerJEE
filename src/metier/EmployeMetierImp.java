package metier;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeMetierImp implements Iemploye{

	@Override
	public int addEmploye(employe emp) {
      Connection conn = SingletonConnection.getConnection();
		
		try { 
				PreparedStatement ps = conn.prepareStatement
					("INSERT INTO employe(nom_emp,prenom_emp,add_emp,tel_emp,email_emp,mdp_emp,cin_emp,datenai_emp) VALUES (?,?,?,?,?,?,?,?)");
				ps.setString(1, emp.getNom_emp());
				ps.setString(2, emp.getPrenom_emp());
				ps.setString(3, emp.getAdd_emp());
				ps.setString(4, emp.getTel_emp());
				ps.setString(5, emp.getEmail_emp());
				ps.setString(6, emp.getMdp_emp());
				ps.setString(7, emp.getCin_emp());
				ps.setString(8, emp.getDatenai_emp());
				ps.executeUpdate();
				ps.close();						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
	}

	@Override
	public List<employe> listeEmployes() {
		List<employe> empl = new ArrayList<employe>();
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("SELECT * FROM employe where num_emp != 4 and num_emp != 13;");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				employe emp = new employe();
				emp.setNum_emp(rs.getInt("num_emp"));
				emp.setNom_emp(rs.getString("nom_emp"));
				emp.setPrenom_emp(rs.getString("prenom_emp"));
				emp.setAdd_emp(rs.getString("add_emp"));
				emp.setTel_emp(rs.getString("tel_emp"));
				emp.setEmail_emp(rs.getString("email_emp"));
				emp.setMdp_emp(rs.getString("mdp_emp"));
				emp.setCin_emp(rs.getString("cin_emp"));
				emp.setDatenai_emp(rs.getString("datenai_emp")); 
				empl.add(emp);
			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return empl;
	}
	
	@Override
	public List<employe> listeEmployesLogin() {
		List<employe> empl = new ArrayList<employe>();
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("SELECT * FROM employe where num_emp != 4");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				employe emp = new employe();
				emp.setNum_emp(rs.getInt("num_emp"));
				emp.setNom_emp(rs.getString("nom_emp"));
				emp.setPrenom_emp(rs.getString("prenom_emp"));
				emp.setAdd_emp(rs.getString("add_emp"));
				emp.setTel_emp(rs.getString("tel_emp"));
				emp.setEmail_emp(rs.getString("email_emp"));
				emp.setMdp_emp(rs.getString("mdp_emp"));
				emp.setCin_emp(rs.getString("cin_emp"));
				emp.setDatenai_emp(rs.getString("datenai_emp")); 
				empl.add(emp);
			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return empl;
	}

	@Override
	public void updateEmploye(employe emp) {
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("UPDATE employe SET nom_emp = ?, prenom_emp = ?, add_emp = ?"
							+ ", tel_emp = ?, email_emp = ?,mdp_emp = ?, cin_emp = ?, datenai_emp = ?,mdp_emp = ? WHERE num_emp = ?");
				ps.setString(1, emp.getNom_emp());
				ps.setString(2, emp.getPrenom_emp());
				ps.setString(3, emp.getAdd_emp());
				ps.setString(4, emp.getTel_emp());
				ps.setString(5, emp.getEmail_emp());
				ps.setString(6, emp.getMdp_emp());
				ps.setString(7, emp.getCin_emp());
				ps.setString(8, emp.getDatenai_emp());
				ps.setString(9, emp.getMdp_emp());
				ps.setInt(10, emp.getNum_emp());
				ps.executeUpdate();
				ps.close();						
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
			
	}

	@Override
	public void deleteEmploye(int num_emp) {
		Connection conn = SingletonConnection.getConnection();
		
		try {
			PreparedStatement ps = conn.prepareStatement
					("DELETE FROM tache WHERE num_emp = ?");
				ps.setInt(1, num_emp);
				ps.setInt(1, num_emp);
				ps.executeUpdate();
				ps.close();	
				PreparedStatement ps1 = conn.prepareStatement
					("DELETE FROM employe WHERE num_emp = ?");
				ps1.setInt(1, num_emp);
				ps1.executeUpdate();
				ps1.close();			
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public employe getEmploye(int num_emp) {
		employe emp = null;
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("SELECT * FROM employe WHERE num_emp = ?");
			ps.setInt(1,num_emp);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				emp = new employe();
				emp.setNum_emp(rs.getInt("num_emp"));
				emp.setNom_emp(rs.getString("nom_emp"));
				emp.setPrenom_emp(rs.getString("prenom_emp"));
				emp.setAdd_emp(rs.getString("add_emp"));
				emp.setTel_emp(rs.getString("tel_emp"));
				emp.setEmail_emp(rs.getString("email_emp"));
				emp.setMdp_emp(rs.getString("mdp_emp"));
				emp.setCin_emp(rs.getString("cin_emp"));
				emp.setDatenai_emp(rs.getString("datenai_emp"));
 			}
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return emp;
	}

	@Override
	public employe getEmployeTwo(String email, String mdp) {
		employe emp = null;
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("SELECT * FROM employe WHERE email_emp = ? AND mdp_emp = ?");
			ps.setString(1,email);
			ps.setString(2,mdp);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				emp = new employe();
				emp.setNum_emp(rs.getInt("num_emp"));
				emp.setNom_emp(rs.getString("nom_emp"));
				emp.setPrenom_emp(rs.getString("prenom_emp"));
				emp.setAdd_emp(rs.getString("add_emp"));
				emp.setTel_emp(rs.getString("tel_emp"));
				emp.setEmail_emp(rs.getString("email_emp"));
				emp.setMdp_emp(rs.getString("mdp_emp"));
				emp.setCin_emp(rs.getString("cin_emp"));
				emp.setDatenai_emp(rs.getString("datenai_emp"));
 			}
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return emp;
	}

	
}
