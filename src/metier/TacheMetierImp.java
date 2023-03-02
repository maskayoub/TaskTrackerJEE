package metier;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TacheMetierImp implements ITache{

	@Override
	public void addTache(tache t) {
		Connection conn = SingletonConnection.getConnection();
		
		try { 
				PreparedStatement ps = conn.prepareStatement
					("INSERT INTO tache(nom_tache,num_doss,num_emp,temp_debut,temp_fin,ordre) VALUES (?,?,?,?,?,?)");
				
				ps.setString(1, t.getNom_tache());
				ps.setInt(2, t.getNum_doss());
				ps.setInt(3, t.getNum_emp());
				ps.setString(4, t.getTemp_debut());
				ps.setString(5, t.getTemp_fin());
				ps.setInt(6,t.getOrdre());
				ps.executeUpdate();
				ps.close();						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
	
	

	@Override
	public tache getTache(int num_dossier) {
		tache t = null;
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("SELECT * FROM tache WHERE num_doss = ? ORDER BY num_tache ASC LIMIT 1");
			ps.setInt(1,num_dossier);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				t = new tache();
				t.setNum_tache(rs.getInt("num_tache"));
				t.setNom_tache(rs.getString("nom_tache"));
				t.setNum_doss(rs.getInt("num_doss"));
				t.setNum_emp(rs.getInt("num_emp"));
				t.setTemp_debut(rs.getString("temp_debut"));
				t.setTemp_fin(rs.getString("temp_fin"));
				t.setOrdre(rs.getInt("ordre"));
							
 			}
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return t;
		
	}

	@Override
	public List<tache> listeTaches() {
		List<tache> task = new ArrayList<tache>();
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("SELECT * FROM tache");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				tache t = new tache();
				t.setNum_tache(rs.getInt("num_tache"));
				t.setNom_tache(rs.getString("nom_tache"));
				t.setNum_doss(rs.getInt("num_doss"));
				t.setNum_emp(rs.getInt("num_emp"));
				t.setTemp_debut(rs.getString("temp_debut"));
				t.setTemp_fin(rs.getString("temp_fin"));
				t.setOrdre(rs.getInt("ordre"));
				task.add(t);
			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return task;
	}

	@Override
	public List<tache> getTachesEmp(int nume_emp) {
		List<tache> task = new ArrayList<tache>();
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("SELECT * FROM tache WHERE num_emp = ? AND ordre = 0 AND num_doss = 1 and temp_debut != 'Suggestion'");
			ps.setInt(1, nume_emp);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				tache t = new tache();
				t.setNum_tache(rs.getInt("num_tache"));
				t.setNom_tache(rs.getString("nom_tache"));
				t.setNum_doss(rs.getInt("num_doss"));
				t.setNum_emp(rs.getInt("num_emp"));
				t.setTemp_debut(rs.getString("temp_debut"));
				t.setTemp_fin(rs.getString("temp_fin"));
				t.setOrdre(rs.getInt("ordre"));
				task.add(t);
			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return task;
	}
	
	
	@Override
	public List<tache> getSuggestionsTaches() {
		List<tache> task = new ArrayList<tache>();
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("SELECT * FROM tache WHERE temp_debut = 'Suggestion'");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				tache t = new tache();
				t.setNum_tache(rs.getInt("num_tache"));
				t.setNom_tache(rs.getString("nom_tache"));
				t.setNum_doss(rs.getInt("num_doss"));
				t.setNum_emp(rs.getInt("num_emp"));
				t.setTemp_debut(rs.getString("temp_debut"));
				t.setTemp_fin(rs.getString("temp_fin"));
				t.setOrdre(rs.getInt("ordre"));
				task.add(t);
			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return task;
	}

	@Override
	public int getDernierePos(int num_doss) {
		tache t = null;
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("SELECT * FROM tache WHERE num_doss = ? ORDER BY ordre DESC LIMIT 1");
			ps.setInt(1,num_doss);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				t = new tache();
				t.setNum_tache(rs.getInt("num_tache"));
				t.setNom_tache(rs.getString("nom_tache"));
				t.setNum_doss(rs.getInt("num_doss"));
				t.setNum_emp(rs.getInt("num_emp"));
				t.setTemp_debut(rs.getString("temp_debut"));
				t.setTemp_fin(rs.getString("temp_fin"));
				t.setOrdre(rs.getInt("ordre"));
							
 			}
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if( t == null)
		{return 1;} else
		return t.getOrdre();
	}

	@Override
	public void updateTache(tache t) {
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("UPDATE tache SET nom_tache = ?, num_doss = ?, num_emp = ?, temp_debut = ?"
							+ ", temp_fin = ?, ordre = ? WHERE num_tache = ?");
				ps.setString(1, t.getNom_tache());
				ps.setInt(2, t.getNum_doss());
				ps.setInt(3, t.getNum_emp());
				ps.setString(4, t.getTemp_debut());
				ps.setString(5, t.getTemp_fin());
				ps.setInt(6, t.getOrdre());
				ps.setInt(7, t.getNum_tache());
				ps.executeUpdate();
				ps.close();						
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		
	}
	}

	@Override
	public tache getTacheED(int num_doss, int num_emp) {
		tache t = null;
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("SELECT * FROM tache WHERE num_doss = ? AND num_emp = ? ORDER BY ordre DESC LIMIT 1");
			ps.setInt(1,num_doss);
			ps.setInt(2,num_emp);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				t = new tache();
				t.setNum_tache(rs.getInt("num_tache"));
				t.setNom_tache(rs.getString("nom_tache"));
				t.setNum_doss(rs.getInt("num_doss"));
				t.setNum_emp(rs.getInt("num_emp"));
				t.setTemp_debut(rs.getString("temp_debut"));
				t.setTemp_fin(rs.getString("temp_fin"));
				t.setOrdre(rs.getInt("ordre"));
							
 			}
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return t;
		
	}

	@Override
	public List<tache> listeTachesDossier(int num_dossier) {
		List<tache> task = new ArrayList<tache>();
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("SELECT * FROM tache WHERE num_doss = ? AND ordre != 0 AND num_doss != 0 order by ordre ASC");
			ps.setInt(1, num_dossier);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				tache t = new tache();
				t.setNum_tache(rs.getInt("num_tache"));
				t.setNom_tache(rs.getString("nom_tache"));
				t.setNum_doss(rs.getInt("num_doss"));
				t.setNum_emp(rs.getInt("num_emp"));
				t.setTemp_debut(rs.getString("temp_debut"));
				t.setTemp_fin(rs.getString("temp_fin"));
				t.setOrdre(rs.getInt("ordre"));
				task.add(t);
			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return task;
	}

	@Override
	public tache getTacheParNum(int num_tache) {
		tache t = null;
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("SELECT * FROM tache WHERE num_tache = ?");
			ps.setInt(1,num_tache);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				t = new tache();
				t.setNum_tache(rs.getInt("num_tache"));
				t.setNom_tache(rs.getString("nom_tache"));
				t.setNum_doss(rs.getInt("num_doss"));
				t.setNum_emp(rs.getInt("num_emp"));
				t.setTemp_debut(rs.getString("temp_debut"));
				t.setTemp_fin(rs.getString("temp_fin"));
				t.setOrdre(rs.getInt("ordre"));
							
 			}
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return t;
		
	}

	@Override
	public List<TacheCount> listeTachesCount() {
		List<TacheCount> task = new ArrayList<TacheCount>();
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("SELECT t.num_emp,e.nom_emp,e.prenom_emp, COUNT(t.num_tache) FROM employe AS e \r\n" + 
							"   INNER JOIN tache AS t \r\n" + 
							"   ON e.num_emp = t.num_emp AND t.num_doss = 1 and ordre = 0 and t.num_emp != 4 and t.temp_debut != 'Suggestion'\r\n" + 
							"   GROUP BY t.num_emp;");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				TacheCount t = new TacheCount();
				t.setNum_emp(rs.getInt("num_emp"));
				t.setNom_emp(rs.getString("nom_emp"));
				t.setPrenom_emp(rs.getString("prenom_emp"));
				t.setCount(rs.getInt("COUNT(t.num_tache)"));
				task.add(t);
			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return task;
	}

	@Override
	public tache getTacheND(String tmp_debut) {
		tache t = null;
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("SELECT * FROM tache WHERE temp_debut = ?");
			ps.setString(1,tmp_debut);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				t = new tache();
				t.setNum_tache(rs.getInt("num_tache"));
				t.setNom_tache(rs.getString("nom_tache"));
				t.setNum_doss(rs.getInt("num_doss"));
				t.setNum_emp(rs.getInt("num_emp"));
				t.setTemp_debut(rs.getString("temp_debut"));
				t.setTemp_fin(rs.getString("temp_fin"));
				t.setOrdre(rs.getInt("ordre"));
							
 			}
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return t;
		
	}

	@Override
	public void deleteTache(int num_tache) {
		Connection conn = SingletonConnection.getConnection();
		
		try {
				PreparedStatement ps = conn.prepareStatement
					("delete from tache where num_tache = ?;");
				
				ps.setInt(1, num_tache);
				ps.executeUpdate();
				ps.close();
									
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void addSuggestionTache(tache t) {
		Connection conn = SingletonConnection.getConnection();
		
		try { 
				PreparedStatement ps = conn.prepareStatement
					("INSERT INTO tache(nom_tache,num_doss,num_emp,temp_debut,temp_fin,ordre) VALUES (?,?,?,?,?,?)");
				
				ps.setString(1, t.getNom_tache());
				ps.setInt(2, 1);
				ps.setInt(3, t.getNum_emp());
				ps.setString(4, "Suggestion");
				ps.setString(5, t.getTemp_fin());
				ps.setInt(6,0);
				ps.executeUpdate();
				ps.close();						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	

}
