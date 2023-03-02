package metier;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class DossiersMetierImp implements IDossiersMetier{

	private Iemploye metier = new EmployeMetierImp();
	private ITache metier1 = new TacheMetierImp();
	
	@Override
	public int addDossier(dossier d) {
		Connection conn = SingletonConnection.getConnection();
		
		try { 
				PreparedStatement ps = conn.prepareStatement
					("INSERT INTO dossier(nom_doss,liste_emp,tache_courante,empl_courant,date_ajout,etat_doss,progression_doss,nbre_emp,tracking_number,email_cl,num_cl,num_admin,state) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)");
				ps.setString(1, d.getNom_doss());
				ps.setString(2, d.getListe_emp());
				ps.setInt(3, d.getTache_courante().getNum_tache());
				ps.setInt(4, d.getEmpl_courant().getNum_emp());
				ps.setString(5, d.getDate_ajout());
				ps.setString(6, d.getEtat_doss());
				ps.setInt(7, d.getProgression_doss());
				ps.setInt(8, d.getNbre_emp());
				ps.setString(9, d.getTracking_number());
				ps.setString(10, d.getEmail_cl());
				ps.setInt(11, 1);
				ps.setInt(12, 1);
				ps.setInt(13, 0);
				ps.executeUpdate();
				ps.close();						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
	}

	@Override
	public List<dossier> listeDossiers() {
		List<dossier> doss = new ArrayList<dossier>();
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("SELECT * FROM dossier where num_doss != 1 ORDER BY num_doss DESC");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				dossier d = new dossier();
				d.setNum_doss(rs.getInt("num_doss"));
				d.setNom_doss(rs.getString("nom_doss"));
				d.setListe_emp(rs.getString("liste_emp"));
								
				//Employé
				employe emp = metier.getEmploye(rs.getInt("empl_courant"));
				d.setEmpl_courant(emp);
				
				//Tache
				int num = d.getNum_doss();
//				int em = emp.getNum_emp();
//				tache t = metier1.getTacheED(num, em);
//				if(t==null) {}
//				else {d.setTache_courante(t);}
				tache t = metier1.getTache(num);
				d.setTache_courante(t);
				d.setDate_ajout(rs.getString("date_ajout"));
				d.setEtat_doss(rs.getString("etat_doss"));
				d.setProgression_doss(rs.getInt("progression_doss"));
				d.setNbre_emp(rs.getInt("nbre_emp"));
				d.setTracking_number(rs.getString("tracking_number"));
				d.setEmail_cl(rs.getString("email_cl"));
				d.setState(rs.getBoolean("state"));
				doss.add(d);
			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return doss;
	}

	@Override
	public dossier getDossier(int num_doss) {
		dossier d = null;
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("SELECT * FROM dossier WHERE num_doss = ?");
			ps.setInt(1,num_doss);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				d = new dossier();
				d.setNum_doss(rs.getInt("num_doss"));
				d.setNom_doss(rs.getString("nom_doss"));
				d.setListe_emp(rs.getString("liste_emp"));
								
				//Employé
				employe emp = metier.getEmploye(rs.getInt("empl_courant"));
				d.setEmpl_courant(emp);
				
				//Tache
				int num = d.getNum_doss();
//				int em = emp.getNum_emp();
//				tache t = metier1.getTacheED(num, em);
//				if(t==null) {}
//				else {d.setTache_courante(t);}
				tache t = metier1.getTache(num);
				d.setTache_courante(t);
				d.setDate_ajout(rs.getString("date_ajout"));
				d.setEtat_doss(rs.getString("etat_doss"));
				d.setProgression_doss(rs.getInt("progression_doss"));
				d.setNbre_emp(rs.getInt("nbre_emp"));
				d.setTracking_number(rs.getString("tracking_number"));
				d.setEmail_cl(rs.getString("email_cl"));
				d.setState(rs.getBoolean("state"));
				
 			}
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return d;
	}

	@Override
	public void updateDossier(dossier d) {
		Connection conn = SingletonConnection.getConnection();
	try {
		PreparedStatement ps = conn.prepareStatement
				("UPDATE dossier SET nom_doss = ?, liste_emp = ?, tache_courante = ?, empl_courant = ?,etat_doss = ?"
						+ ", progression_doss = ?, nbre_emp = ?,tracking_number = ?, email_cl = ?, state = ?  WHERE num_doss = ?");
				ps.setString(1, d.getNom_doss());
				ps.setString(2, d.getListe_emp());
				ps.setInt(3, d.getTache_courante().getNum_tache());
				System.out.println(d.getTache_courante().getNum_tache());
				ps.setInt(4, d.getEmpl_courant().getNum_emp());
				ps.setString(5, d.getEtat_doss());
				ps.setInt(6, d.getProgression_doss());
				ps.setInt(7, d.getNbre_emp());
				ps.setString(8, d.getTracking_number());
				ps.setString(9, d.getEmail_cl());
				ps.setBoolean(10, d.isState());
				ps.setInt(11, d.getNum_doss());
			ps.executeUpdate();
			ps.close();						
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
		
	}

	@Override
	public void deleteDossier(int num_doss) {
		Connection conn = SingletonConnection.getConnection();
		
		try {
				PreparedStatement ps = conn.prepareStatement
					("delete from tache where num_doss = ?;");
				PreparedStatement ps1 = conn.prepareStatement
						("DELETE FROM dossier WHERE num_doss = ?");
				ps.setInt(1, num_doss);
				ps.executeUpdate();
				ps.close();
				ps1.setInt(1, num_doss);
				ps1.executeUpdate();
				ps1.close();						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}



	@Override
	public void transferDossier(int num_doss, employe next_emp) {
		
		dossier d = getDossier(num_doss);
		d.setEmpl_courant(next_emp);
		int max = d.getNbre_emp();
		int prog_inc = 100/max;
		d.setProgression_doss(d.getProgression_doss() + prog_inc);
		if(d.getProgression_doss() <= 100 && d.getProgression_doss() >=97)
		{
			d.setProgression_doss(100);
		}
		else
		{
			if(d.getProgression_doss() > 100)
			{
				d.setProgression_doss(100);
			}
		}

		if (d.getProgression_doss() == 100) {
				
				envoyerEmail send = new envoyerEmail();
				String contenu = "\r\n" + 
						"Bonjour,\r\n" + 
						"Nous vous informons que le traitement de votre dossier a été effectué avec succès. Voici le détail de l’opération :\r\n" + 
						"\r\n" + 
						"Site web : http://www.tasktracker.ma\r\n" + 
						"\r\n" + 
						"Nom du dossier: "+d.getNom_doss()+"\r\n" + 
						"\r\n" + 
						"N° de suivi du dossier : "+d.getTracking_number()+"\r\n" + 
						"\r\n" + 
						"Vous pouvez suivre la progression de votre dossier sur notre site Web en utilisant le numéro de suivi ci-dessus.\r\n" + 
						"\r\n" + 
						"Pour plus d'informations, prière de nous envoyer un message via la section contact de notre site web.\r\n" + 
						"\r\n" + 
						"Task Tracker vous remercie.";
				
				send.sendEmail(d.getEmail_cl(), contenu, "Votre Dossier Est Prêt");
			}
			
	    d.setEtat_doss("N/A");
		updateDossier(d);
	}
	

	@Override
	public dossier getDernierDossier() {
		dossier d = null;
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("SELECT * FROM dossier ORDER BY num_doss DESC LIMIT 1");
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				d = new dossier();
				d.setNum_doss(rs.getInt("num_doss"));
				d.setNom_doss(rs.getString("nom_doss"));
				d.setListe_emp(rs.getString("liste_emp"));
								
				//Employé
				employe emp = metier.getEmploye(rs.getInt("empl_courant"));
				d.setEmpl_courant(emp);
				
				//Tache
//				int em = emp.getNum_emp();
//				tache t = metier1.getTacheED(num, em);
//				if(t==null) {}
//				else {d.setTache_courante(t);}
				tache t = metier1.getTacheParNum(rs.getInt("tache_courante"));
				d.setTache_courante(t);
				d.setDate_ajout(rs.getString("date_ajout"));
				d.setEtat_doss(rs.getString("etat_doss"));
				d.setProgression_doss(rs.getInt("progression_doss"));
				d.setNbre_emp(rs.getInt("nbre_emp"));
				d.setTracking_number(rs.getString("tracking_number"));
				d.setEmail_cl(rs.getString("email_cl"));
				d.setState(rs.getBoolean("state"));
 			}
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return d;
	}

	@Override
	public List<dossier> listeDossiersEmp(int num_emp) {
		List<dossier> doss = new ArrayList<dossier>();
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("SELECT * FROM dossier where empl_courant = ? and etat_doss != 'Echec De Traitement' and progression_doss != '100' ORDER BY num_doss DESC");
			ps.setInt(1, num_emp);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				dossier d = new dossier();
				d.setNum_doss(rs.getInt("num_doss"));
				d.setNom_doss(rs.getString("nom_doss"));
				d.setListe_emp(rs.getString("liste_emp"));
								
				//Employé
				employe emp = metier.getEmploye(rs.getInt("empl_courant"));
				d.setEmpl_courant(emp);
				
				//Tache
				int num = d.getNum_doss();
//				int em = emp.getNum_emp();
//				tache t = metier1.getTacheED(num, em);
//				if(t==null) {}
//				else {d.setTache_courante(t);}
				tache t = metier1.getTache(num);
				d.setTache_courante(t);
				d.setDate_ajout(rs.getString("date_ajout"));
				d.setEtat_doss(rs.getString("etat_doss"));
				d.setProgression_doss(rs.getInt("progression_doss"));
				d.setNbre_emp(rs.getInt("nbre_emp"));
				d.setTracking_number(rs.getString("tracking_number"));
				d.setEmail_cl(rs.getString("email_cl"));
				d.setState(rs.getBoolean("state"));
				doss.add(d);
			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return doss;
	}

	@Override
	public dossier getDossierTrack(String tracking_number) {
		dossier d = null;
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("SELECT * FROM dossier WHERE tracking_number = ?");
			ps.setString(1,tracking_number);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				d = new dossier();
				d.setNum_doss(rs.getInt("num_doss"));
				d.setNom_doss(rs.getString("nom_doss"));
				d.setListe_emp(rs.getString("liste_emp"));
								
				//Employé
				employe emp = metier.getEmploye(rs.getInt("empl_courant"));
				d.setEmpl_courant(emp);
				
				//Tache
				int num = d.getNum_doss();
//				int em = emp.getNum_emp();
//				tache t = metier1.getTacheED(num, em);
//				if(t==null) {}
//				else {d.setTache_courante(t);}
				tache t = metier1.getTache(num);
				d.setTache_courante(t);
				d.setDate_ajout(rs.getString("date_ajout"));
				d.setEtat_doss(rs.getString("etat_doss"));
				d.setProgression_doss(rs.getInt("progression_doss"));
				d.setNbre_emp(rs.getInt("nbre_emp"));
				d.setTracking_number(rs.getString("tracking_number"));
				d.setEmail_cl(rs.getString("email_cl"));
				d.setState(rs.getBoolean("state"));
				
 			}
	
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return d;
	}
	
	
	@Override
	public List<dossier> listeDossiersEmail(String emailcl) {
		List<dossier> doss = new ArrayList<dossier>();
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("SELECT * FROM dossier where email_cl = ? ORDER BY num_doss DESC");
			ps.setString(1, emailcl);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				dossier d = new dossier();
				d.setNum_doss(rs.getInt("num_doss"));
				d.setNom_doss(rs.getString("nom_doss"));
				d.setListe_emp(rs.getString("liste_emp"));
								
				//Employé
				employe emp = metier.getEmploye(rs.getInt("empl_courant"));
				d.setEmpl_courant(emp);
				
				//Tache
				int num = d.getNum_doss();
//				int em = emp.getNum_emp();
//				tache t = metier1.getTacheED(num, em);
//				if(t==null) {}
//				else {d.setTache_courante(t);}
				tache t = metier1.getTache(num);
				d.setTache_courante(t);
				d.setDate_ajout(rs.getString("date_ajout"));
				d.setEtat_doss(rs.getString("etat_doss"));
				d.setProgression_doss(rs.getInt("progression_doss"));
				d.setNbre_emp(rs.getInt("nbre_emp"));
				d.setTracking_number(rs.getString("tracking_number"));
				d.setEmail_cl(rs.getString("email_cl"));
				d.setState(rs.getBoolean("state"));
				doss.add(d);
			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return doss;
	}
	
	@Override
	public List<dossier> listeDossiersEnCours() {
		List<dossier> doss = new ArrayList<dossier>();
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("SELECT * FROM dossier where progression_doss < 100 AND etat_doss != 'Echec De Traitement' AND num_doss != 1;");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				dossier d = new dossier();
				d.setNum_doss(rs.getInt("num_doss"));
				d.setNom_doss(rs.getString("nom_doss"));
				d.setListe_emp(rs.getString("liste_emp"));
								
				//Employé
				employe emp = metier.getEmploye(rs.getInt("empl_courant"));
				d.setEmpl_courant(emp);
				
				//Tache
				int num = d.getNum_doss();
//				int em = emp.getNum_emp();
//				tache t = metier1.getTacheED(num, em);
//				if(t==null) {}
//				else {d.setTache_courante(t);}
				tache t = metier1.getTache(num);
				d.setTache_courante(t);
				d.setDate_ajout(rs.getString("date_ajout"));
				d.setEtat_doss(rs.getString("etat_doss"));
				d.setProgression_doss(rs.getInt("progression_doss"));
				d.setNbre_emp(rs.getInt("nbre_emp"));
				d.setTracking_number(rs.getString("tracking_number"));
				d.setEmail_cl(rs.getString("email_cl"));
				d.setState(rs.getBoolean("state"));
				doss.add(d);
			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return doss;
	}
	
	@Override
	public List<dossier> listeDossiersNonTraites() {
		List<dossier> doss = new ArrayList<dossier>();
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("SELECT * FROM dossier where etat_doss = 'Echec De Traitement';");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				dossier d = new dossier();
				d.setNum_doss(rs.getInt("num_doss"));
				d.setNom_doss(rs.getString("nom_doss"));
				d.setListe_emp(rs.getString("liste_emp"));
								
				//Employé
				employe emp = metier.getEmploye(rs.getInt("empl_courant"));
				d.setEmpl_courant(emp);
				
				//Tache
				int num = d.getNum_doss();
//				int em = emp.getNum_emp();
//				tache t = metier1.getTacheED(num, em);
//				if(t==null) {}
//				else {d.setTache_courante(t);}
				tache t = metier1.getTache(num);
				d.setTache_courante(t);
				d.setDate_ajout(rs.getString("date_ajout"));
				d.setEtat_doss(rs.getString("etat_doss"));
				d.setProgression_doss(rs.getInt("progression_doss"));
				d.setNbre_emp(rs.getInt("nbre_emp"));
				d.setTracking_number(rs.getString("tracking_number"));
				d.setEmail_cl(rs.getString("email_cl"));
				d.setState(rs.getBoolean("state"));
				doss.add(d);
			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return doss;
	}
	
	@Override
	public List<dossier> listeDossiersTraites() {
		List<dossier> doss = new ArrayList<dossier>();
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("SELECT * FROM dossier where progression_doss = 100;");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				dossier d = new dossier();
				d.setNum_doss(rs.getInt("num_doss"));
				d.setNom_doss(rs.getString("nom_doss"));
				d.setListe_emp(rs.getString("liste_emp"));
								
				//Employé
				employe emp = metier.getEmploye(rs.getInt("empl_courant"));
				d.setEmpl_courant(emp);
				
				//Tache
				int num = d.getNum_doss();
//				int em = emp.getNum_emp();
//				tache t = metier1.getTacheED(num, em);
//				if(t==null) {}
//				else {d.setTache_courante(t);}
				tache t = metier1.getTache(num);
				d.setTache_courante(t);
				d.setDate_ajout(rs.getString("date_ajout"));
				d.setEtat_doss(rs.getString("etat_doss"));
				d.setProgression_doss(rs.getInt("progression_doss"));
				d.setNbre_emp(rs.getInt("nbre_emp"));
				d.setTracking_number(rs.getString("tracking_number"));
				d.setEmail_cl(rs.getString("email_cl"));
				d.setState(rs.getBoolean("state"));
				doss.add(d);
			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return doss;
	}
	
	@Override
	public List<dossier> listeDossiersEmpArchive(int num_emp) {
		List<dossier> doss = new ArrayList<dossier>();
		Connection conn = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement
					("SELECT * FROM dossier where num_doss IN (SELECT num_doss FROM tache where num_emp=?) AND etat_doss = 'Echec De Traitement' or progression_doss = '100' ORDER BY num_doss DESC;\r\n" + 
							"");
			ps.setInt(1, num_emp);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				dossier d = new dossier();
				d.setNum_doss(rs.getInt("num_doss"));
				d.setNom_doss(rs.getString("nom_doss"));
				d.setListe_emp(rs.getString("liste_emp"));
								
				//Employé
				employe emp = metier.getEmploye(rs.getInt("empl_courant"));
				d.setEmpl_courant(emp);
				
				//Tache
				int num = d.getNum_doss();
//				int em = emp.getNum_emp();
//				tache t = metier1.getTacheED(num, em);
//				if(t==null) {}
//				else {d.setTache_courante(t);}
				tache t = metier1.getTache(num);
				d.setTache_courante(t);
				d.setDate_ajout(rs.getString("date_ajout"));
				d.setEtat_doss(rs.getString("etat_doss"));
				d.setProgression_doss(rs.getInt("progression_doss"));
				d.setNbre_emp(rs.getInt("nbre_emp"));
				d.setTracking_number(rs.getString("tracking_number"));
				d.setEmail_cl(rs.getString("email_cl"));
				d.setState(rs.getBoolean("state"));
				doss.add(d);
			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return doss;
	}
	

}
