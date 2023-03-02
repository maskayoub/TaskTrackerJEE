package metier;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import metier.SingletonConnection;

public class ContactMetierImp implements IContactMetier{

	@Override
	public void initierContact(contact c) {
		Connection conn = SingletonConnection.getConnection();
		
		try { 
				PreparedStatement ps = conn.prepareStatement
					("INSERT INTO contact(nom_contact,email_contact,sujet_contact,message_contact,etat_contact) VALUES (?,?,?,?,?)");
				ps.setString(1, c.getNom_contact());
				ps.setString(2, c.getEmail_contact());
				ps.setString(3, c.getSujet_contact());
				ps.setString(4, c.getMessage_contact());
				ps.setBoolean(5, false);
				ps.executeUpdate();
				ps.close();						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public List<contact> listeContact() {
		List<contact> ct = new ArrayList<contact>();
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("SELECT * FROM contact ORDER BY num_contact DESC");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				contact c = new contact();
				c.setNum_contact(rs.getInt("num_contact"));
				c.setNom_contact(rs.getString("nom_contact"));
				c.setEmail_contact(rs.getString("email_contact"));
				c.setSujet_contact(rs.getString("sujet_contact"));
				c.setMessage_contact(rs.getString("message_contact"));
				c.setEtat_contact(rs.getBoolean("etat_contact"));
				ct.add(c);
			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ct;
	}

	@Override
	public void repondreContact(contact c) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<contact> listeContactDisplay() {
		List<contact> ct = new ArrayList<contact>();
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("SELECT * FROM contact ORDER BY num_contact DESC");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				String message;
				contact c = new contact();
				c.setNum_contact(rs.getInt("num_contact"));
				c.setNom_contact(rs.getString("nom_contact"));
				c.setEmail_contact(rs.getString("email_contact"));
				c.setSujet_contact(rs.getString("sujet_contact"));
				if(wordCount(rs.getString("message_contact"))<4)
					message = rs.getString("message_contact");
				else
				message = firstWords(rs.getString("message_contact"),4);
				
				message = message + "...";
				c.setMessage_contact(message);
				c.setEtat_contact(rs.getBoolean("etat_contact"));
				ct.add(c);
			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ct;
	}
	
	public static String firstWords(String input, int words) {
        for (int i = 0; i < input.length(); i++) {
            // When a space is encountered, reduce words remaining by 1.
            if (input.charAt(i) == ' ') {
                words--;
            }
            // If no more words remaining, return a substring.
            if (words == 0) {
                return input.substring(0, i);
            }
        }
        // Error case.
        return "";
    }
	
	public static int wordCount(String input) {
	    if (input == null || input.isEmpty()) {
	      return 0;
	    }

	    String[] words = input.split("\\s+");
	    return words.length;
	  }

	@Override
	public contact getContact(int num_contact) {
		contact c = null;
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("SELECT * FROM contact where num_contact = ?");
			ps.setInt(1, num_contact);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
			    c = new contact();
				c.setNum_contact(rs.getInt("num_contact"));
				c.setNom_contact(rs.getString("nom_contact"));
				c.setEmail_contact(rs.getString("email_contact"));
				c.setSujet_contact(rs.getString("sujet_contact"));
				c.setMessage_contact(rs.getString("message_contact"));
				c.setEtat_contact(rs.getBoolean("etat_contact"));
			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return c;
	}

	@Override
	public void updateContact(contact c) {
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("UPDATE contact SET etat_contact = ? WHERE num_contact = ?");
					ps.setBoolean(1, c.isEtat_contact());
					ps.setInt(2, c.getNum_contact());
				ps.executeUpdate();
				ps.close();						
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
	}

}
