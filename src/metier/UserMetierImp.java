package metier;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserMetierImp implements IUserMetier{

	@Override
	public int addUser(user u) {
Connection conn = SingletonConnection.getConnection();
		
		try { 
				PreparedStatement ps = conn.prepareStatement
					("INSERT INTO user(username,nom_user,prenom_user,email_user,tel_user,mdp_user) VALUES (?,?,?,?,?,?)");
				ps.setString(1, u.getUsername());
				ps.setString(2, u.getNom_user());
				ps.setString(3, u.getPrenom_user());
				ps.setString(4, u.getEmail_user());
				ps.setString(5, u.getTel_user());
				ps.setString(6, u.getMdp_user());
				ps.executeUpdate();
				ps.close();						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
	}

	@Override
	public List<user> listeUsers() {
		List<user> ur = new ArrayList<user>();
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("SELECT * FROM user");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				user u = new user();
				u.setUsername(rs.getString("username"));
				u.setNom_user(rs.getString("nom_user"));
				u.setPrenom_user(rs.getString("prenom_user"));
				u.setEmail_user(rs.getString("email_user"));
				u.setTel_user(rs.getString("tel_user"));
				u.setMdp_user(rs.getString("mdp_user"));
				ur.add(u);
			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ur;
	}

	@Override
	public user getUser(int num_user) {
		user u = null;
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("SELECT * FROM user WHERE num_user = ?");
			ps.setInt(1,num_user);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				u = new user();
				u.setNum_user(rs.getInt("num_user"));
				u.setUsername(rs.getString("username"));
				u.setNom_user(rs.getString("nom_user"));
				u.setPrenom_user(rs.getString("prenom_user"));
				u.setEmail_user(rs.getString("email_user"));
				u.setTel_user(rs.getString("tel_user"));
				u.setMdp_user(rs.getString("mdp_user"));
				
 			}
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return u;
	}

	@Override
	public void updateUser(user u) {
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("UPDATE user SET username = ?, nom_user = ?, prenom_user = ?,email_user = ?, tel_user = ?, mdp_user = ? WHERE num_user = ?");
				ps.setString(1, u.getUsername());
				ps.setString(2, u.getNom_user());
				ps.setString(3, u.getPrenom_user());
				ps.setString(4, u.getEmail_user());
				ps.setString(5, u.getTel_user());
				ps.setString(6, u.getMdp_user());
				ps.setInt(7, u.getNum_user());
				ps.executeUpdate();
				ps.close();						
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
	}

	@Override
	public void deleteUser(int num_user) {
		Connection conn = SingletonConnection.getConnection();
		
		try {
				PreparedStatement ps = conn.prepareStatement
					("DELETE FROM user WHERE num_user = ?");
				ps.setInt(1, num_user);
				ps.executeUpdate();
				ps.close();						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public user getUserTwo(String username, String password) {
		user u = null;
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("SELECT * FROM user WHERE email_user = ? AND mdp_user = ?");
			ps.setString(1,username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				u = new user();
				u.setNum_user(rs.getInt("num_user"));
				u.setUsername(rs.getString("username"));
				u.setNom_user(rs.getString("nom_user"));
				u.setPrenom_user(rs.getString("prenom_user"));
				u.setEmail_user(rs.getString("email_user"));
				u.setTel_user(rs.getString("tel_user"));
				u.setMdp_user(rs.getString("mdp_user"));
				
 			}
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return u;
	}

}
