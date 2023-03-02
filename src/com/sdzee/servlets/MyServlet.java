package com.sdzee.servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;

import metier.ContactMetierImp;
import metier.IContactMetier;
import metier.contact;
import metier.AES;
import metier.DossiersMetierImp;
import metier.EmployeMetierImp;
import metier.IDossiersMetier;
import metier.ITache;
import metier.IUserMetier;
import metier.Iemploye;
import metier.TacheCount;
import metier.TacheMetierImp;
import metier.Tracking;
import metier.UserMetierImp;
import metier.dossier;
import metier.dossierTache;
import metier.employe;
import metier.envoyerEmail;
import metier.tache;
import metier.user;
import web.TrackingModel;


/**
 * Servlet implementation class MyServlet
 */
@WebServlet("/MyServlet")
public class MyServlet extends HttpServlet {
	
	private IDossiersMetier metier;
	private Iemploye metier1;
	private ITache metier2;
	private IUserMetier metier3;
	private IContactMetier metierC;

	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}
	
	@Override
	public void init() throws ServletException {
		metier = new DossiersMetierImp();
		metier1 = new EmployeMetierImp();
		metier2 = new TacheMetierImp();
		metier3 = new UserMetierImp();
		metierC = new ContactMetierImp();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	TrackingModel model = new TrackingModel();
	String action = request.getParameter("action");
	List<dossier> dossier;
	List<employe> empl;
	List<tache> taches;

	request.setAttribute("modd", model);
//	model.setDateRes(request.getParameter("dateRes"));
	dossier = metier.listeDossiers();
	empl = metier1.listeEmployes();
	taches = metier2.listeTaches();
	model.setEmp(empl);
	model.setDossier(dossier);
	AES cryptage = null;
	String key = "bachelorgenieinfo";
	
//	 for(dossier re:dossier) {
//		 System.out.println(re.getNum_doss() + " " + re.getNom_doss() + " " + re.getType_doss()
//		 + " " + re.getEtat_doss());
//	 }
	
	
	
	//////////////////////Traitement Via Le ServletPath //////////////////////
		
	if(request.getServletPath().equals("/platformeEmploye.php"))
    {
		HttpSession session = request.getSession();
		
		if (action != null) {
			if (action.equals("suggestionTache")) {
				request.setAttribute("ajouter", true);
			}
			
		}
		
		if (session.getAttribute("loggedOnEmp")==null){
		String username = request.getParameter("email");
		String mdp = request.getParameter("password");
		List<employe> lsemp = metier1.listeEmployesLogin();
		System.out.println("Connexion Employe");
		int k = 0;
		for(employe em:lsemp)
		{
			if(em.getEmail_emp().equals(username) && em.getMdp_emp().equals(mdp))
				k++;
		}
		String err = "Login ou mot de passe incorrect";
		if(k == 0)
		{
			request.setAttribute("erreur", err);
			request.getRequestDispatcher("loginEmploye.jsp").forward(request, response); 
		}
			
		else
			if(k>0)
			{
				
				employe e = metier1.getEmployeTwo(username, mdp);
				session.setAttribute("loggedOnEmp", e);
				model.setEm(e);
				dossier = metier.listeDossiersEmp(e.getNum_emp());
				model.setDossier(dossier);
				String sessus = e.getPrenom_emp() + " " + e.getNom_emp();
				request.setAttribute("user", sessus);
				request.setAttribute("email", username);
				System.out.println("Login: " + e.getNum_emp() + " & k = " +k);
			}
		}
		else
		{	
		employe emplo = (employe) session.getAttribute("loggedOnEmp");
		dossier = metier.listeDossiersEmp(emplo.getNum_emp());
		model.setDossier(dossier);
		request.getRequestDispatcher("indexEmploye.jsp").forward(request, response);
		}
		
    }
	else
		if(request.getServletPath().equals("/ModifierEmploye.php"))
		{
			empl = metier1.listeEmployes();
			model.setEmp(empl);
			request.getRequestDispatcher("listeEmployes.jsp").forward(request, response);
		}
		else
			if(request.getServletPath().equals("/login.php"))
			{
				String username = request.getParameter("emailuser");
				System.out.println(username);
				String mdp = AES.encrypt(request.getParameter("password"), key);
				List<user> lstu = metier3.listeUsers();

				int k = 0;
				for(user us:lstu)
				{
					if(us.getEmail_user().equals(username) && us.getMdp_user().equals(mdp))
						k++;
					System.out.println(k);
					
					
				}
				String err = "Login ou mot de passe incorrect";
				if(k == 0)
				{
					request.setAttribute("erreur", err);
					request.getRequestDispatcher("login.jsp").forward(request, response); 
				}
					
				else
					if(k>0)
					{
						HttpSession session = request.getSession();
						user u = metier3.getUserTwo(username,mdp);
						session.setAttribute("nom", u);
						model.setUr(u);
					    response.sendRedirect("indexClient.jsp");
					}

			}
			else
				if(request.getServletPath().equals("/MonCompte.php"))
				{
					
					
					String ref1 = request.getParameter("ref1");
					dossier = metier.listeDossiersEmail(ref1);
					model.setDossier(dossier);
					request.getRequestDispatcher("dossierClient.jsp").forward(request, response);
				}
				else
					if(request.getServletPath().equals("/DossiersEnCours.php"))
					{
						dossier = metier.listeDossiersEnCours();
						model.setDossier(dossier);
						request.setAttribute("type", "En Cours De Traitement");
						request.setAttribute("path", "DossiersEnCours.php");
						if(action != null) {
						if (action.equals("detDoss")) {
							int ref1 = Integer.parseInt(request.getParameter("ref1"));
							String typeD = request.getParameter("typeD");
							List <tache> t = metier2.listeTachesDossier(ref1);
						    List<dossierTache> ldt = new ArrayList<dossierTache>();
						    if (t.isEmpty())
							 {
								 request.setAttribute("vide", true);
							 }
						    else
						    {
						    	System.out.println("yes");
						    	request.setAttribute("detail", true);
						    }
						    	
							for (tache r : t) {
								dossierTache dt  = new dossierTache();
								employe e = metier1.getEmploye(r.getNum_emp());
								dt.setNameEmp(e.getNom_emp() + " " + e.getPrenom_emp());
								String ch1 = r.getTemp_debut();
								 String ch2 = r.getTemp_fin();
								 String duree ="";
								 
								 if(ch1.equals("N/A"))
								 {
									 duree = "L'Employé n'a pas encore commencé";
								 }
								 else
									 if(ch2.equals("N/A"))
									 {
										 duree = "Début: " + ch1;
									 }
									 else
									 {
								 String tabOne1[]  = ch1.split(" ");
								 String tabOne2[]  = ch2.split(" ");
								 
								 
								 String tabTwo1[]  = tabOne1[0].split("/");
								 String tabTwo2[]  = tabOne1[1].split(":");
								 String tabTwo3[]  = tabOne2[0].split("/");
								 String tabTwo4[]  = tabOne2[1].split(":");
								 
								 int time1 = Integer.parseInt(tabTwo4[0])*60*60 + Integer.parseInt(tabTwo4[1])*60 + Integer.parseInt(tabTwo4[2]);
								 int time2 = Integer.parseInt(tabTwo2[0])*60*60 + Integer.parseInt(tabTwo2[1])*60 + Integer.parseInt(tabTwo2[2]);
								 
								 int time = time1 - time2;
								 int h = time/3600;
								 int min = time%3600/60;
								 int s = time%3600%60;
								 int a = Integer.parseInt(tabTwo3[0]) - Integer.parseInt(tabTwo1[0]);
								 int m = Integer.parseInt(tabTwo3[1]) - Integer.parseInt(tabTwo1[1]);
								 int j = Integer.parseInt(tabTwo3[2]) - Integer.parseInt(tabTwo1[2]);
								 
								 if (a != 0)
									 duree =  + a + " An(s)   ";
								 if (m != 0)
									 duree = duree + m + " Mois  ";
								 if (j != 0)
									 duree = duree + j + " Jour(s)  ";
								 if (h != 0)
									 duree = duree + h + " Heure(s)  ";
								 if (min != 0)
									 duree =duree +min + " Minute(s)  ";
								 if (s != 0)
									 duree = duree + s + " Seconde(s)  ";
									 }
								dt.setDuree(duree);
								ldt.add(dt);
							}
							 for (dossierTache r : ldt) {
							    	System.out.println(r.getNameEmp() + " " + r.getDuree());
							    }
							request.setAttribute("dt", ldt);
							request.setAttribute("taches", t);
							
							
							System.out.println(request.getServletPath());
							System.out
									.println("Here " + typeD);
							
						}
						}
						request.getRequestDispatcher("listeDossiersAdmin.jsp").forward(request, response);
					}
					else
						if(request.getServletPath().equals("/DossiersNonTraitees.php"))
						{
							dossier = metier.listeDossiersNonTraites();
							model.setDossier(dossier);
							request.setAttribute("type", "Non Traitées");
							request.setAttribute("path", "DossiersNonTraitees.php");
							if(action != null) {
							if (action.equals("detDoss")) {
								int ref1 = Integer.parseInt(request.getParameter("ref1"));
								String typeD = request.getParameter("typeD");
								List <tache> t = metier2.listeTachesDossier(ref1);
							    List<dossierTache> ldt = new ArrayList<dossierTache>();
							    if (t.isEmpty())
								 {
									 
									 request.setAttribute("vide", true);
								 }
							    else
							    {
							    	System.out.println("yes");
							    	request.setAttribute("detail", true);
							    }
								for (tache r : t) {
									dossierTache dt  = new dossierTache();
									employe e = metier1.getEmploye(r.getNum_emp());
									dt.setNameEmp(e.getNom_emp() + " " + e.getPrenom_emp());
									String ch1 = r.getTemp_debut();
									 String ch2 = r.getTemp_fin();
									 String duree ="";
									 
									 
									 if(ch1.equals("N/A"))
									 {
										 duree = "L'Employé n'a pas encore commencé";
									 }
									 else
										 if(ch2.equals("N/A"))
										 {
											 duree = "Début: " + ch1;
										 }
										 else
										 {
									 String tabOne1[]  = ch1.split(" ");
									 String tabOne2[]  = ch2.split(" ");
									 
									 
									 String tabTwo1[]  = tabOne1[0].split("/");
									 String tabTwo2[]  = tabOne1[1].split(":");
									 String tabTwo3[]  = tabOne2[0].split("/");
									 String tabTwo4[]  = tabOne2[1].split(":");
									 
									 int time1 = Integer.parseInt(tabTwo4[0])*60*60 + Integer.parseInt(tabTwo4[1])*60 + Integer.parseInt(tabTwo4[2]);
									 int time2 = Integer.parseInt(tabTwo2[0])*60*60 + Integer.parseInt(tabTwo2[1])*60 + Integer.parseInt(tabTwo2[2]);
									 
									 int time = time1 - time2;
									 int h = time/3600;
									 int min = time%3600/60;
									 int s = time%3600%60;
									 int a = Integer.parseInt(tabTwo3[0]) - Integer.parseInt(tabTwo1[0]);
									 int m = Integer.parseInt(tabTwo3[1]) - Integer.parseInt(tabTwo1[1]);
									 int j = Integer.parseInt(tabTwo3[2]) - Integer.parseInt(tabTwo1[2]);
									 
									 if (a != 0)
										 duree =  + a + " An(s)   ";
									 if (m != 0)
										 duree = duree + m + " Mois  ";
									 if (j != 0)
										 duree = duree + j + " Jour(s)  ";
									 if (h != 0)
										 duree = duree + h + " Heure(s)  ";
									 if (min != 0)
										 duree =duree +min + " Minute(s)  ";
									 if (s != 0)
										 duree = duree + s + " Seconde(s)  ";
										 }
									dt.setDuree(duree);
									ldt.add(dt);
								}
								 for (dossierTache r : ldt) {
								    	System.out.println(r.getNameEmp() + " " + r.getDuree());
								    }
								request.setAttribute("dt", ldt);
								request.setAttribute("taches", t);
								System.out.println(request.getServletPath());
								System.out
										.println("Here " + typeD);
								
							}
							}
							request.getRequestDispatcher("listeDossiersAdmin.jsp").forward(request, response);
						}
						else
							if(request.getServletPath().equals("/DossiersTraitees.php"))
							{
								dossier = metier.listeDossiersTraites();
								model.setDossier(dossier);
								request.setAttribute("type", "Traitées");
								request.setAttribute("path", "DossiersTraitees.php");
								if(action != null) {
								if (action.equals("detDoss")) {
									int ref1 = Integer.parseInt(request.getParameter("ref1"));
									String typeD = request.getParameter("typeD");
									List <tache> t = metier2.listeTachesDossier(ref1);
								    List<dossierTache> ldt = new ArrayList<dossierTache>();
								    if (t.isEmpty())
									 {
										 
										 request.setAttribute("vide", true);
									 }
								    else
								    {
								    	System.out.println("yes");
								    	request.setAttribute("detail", true);
								    }
									for (tache r : t) {
										dossierTache dt  = new dossierTache();
										employe e = metier1.getEmploye(r.getNum_emp());
										dt.setNameEmp(e.getNom_emp() + " " + e.getPrenom_emp());
										String ch1 = r.getTemp_debut();
										 String ch2 = r.getTemp_fin();
										 String duree ="";
										 
										 if(ch1.equals("N/A"))
										 {
											 duree = "L'Employé n'a pas encore commencé";
										 }
										 else
											 if(ch2.equals("N/A"))
											 {
												 duree = "Début: " + ch1;
											 }
											 else
											 {
										 String tabOne1[]  = ch1.split(" ");
										 String tabOne2[]  = ch2.split(" ");
										 
										 
										 String tabTwo1[]  = tabOne1[0].split("/");
										 String tabTwo2[]  = tabOne1[1].split(":");
										 String tabTwo3[]  = tabOne2[0].split("/");
										 String tabTwo4[]  = tabOne2[1].split(":");
										 
										 int time1 = Integer.parseInt(tabTwo4[0])*60*60 + Integer.parseInt(tabTwo4[1])*60 + Integer.parseInt(tabTwo4[2]);
										 int time2 = Integer.parseInt(tabTwo2[0])*60*60 + Integer.parseInt(tabTwo2[1])*60 + Integer.parseInt(tabTwo2[2]);
										 
										 int time = time1 - time2;
										 int h = time/3600;
										 int min = time%3600/60;
										 int s = time%3600%60;
										 int a = Integer.parseInt(tabTwo3[0]) - Integer.parseInt(tabTwo1[0]);
										 int m = Integer.parseInt(tabTwo3[1]) - Integer.parseInt(tabTwo1[1]);
										 int j = Integer.parseInt(tabTwo3[2]) - Integer.parseInt(tabTwo1[2]);
										 
										 if (a != 0)
											 duree =  + a + " An(s)   ";
										 if (m != 0)
											 duree = duree + m + " Mois  ";
										 if (j != 0)
											 duree = duree + j + " Jour(s)  ";
										 if (h != 0)
											 duree = duree + h + " Heure(s)  ";
										 if (min != 0)
											 duree =duree +min + " Minute(s)  ";
										 if (s != 0)
											 duree = duree + s + " Seconde(s)  ";
											 }
										dt.setDuree(duree);
										ldt.add(dt);
									}
									 for (dossierTache r : ldt) {
									    	System.out.println(r.getNameEmp() + " " + r.getDuree());
									    }
									request.setAttribute("dt", ldt);
									request.setAttribute("taches", t);
									System.out.println(request.getServletPath());
									System.out
											.println("Here " + typeD);
									
								}
								}
								request.getRequestDispatcher("listeDossiersAdmin.jsp").forward(request, response);
							}
							else
								if(request.getServletPath().equals("/TousLesDossiers.php"))
								{
									dossier = metier.listeDossiers();
									model.setDossier(dossier);
									request.setAttribute("before", "Tous Les ");
									request.setAttribute("path", "TousLesDossiers.php");
									request.setAttribute("primary", true);
									if(action != null) {
									if (action.equals("detDoss")) {
										int ref1 = Integer.parseInt(request.getParameter("ref1"));
										String typeD = request.getParameter("typeD");
										List <tache> t = metier2.listeTachesDossier(ref1);
									    List<dossierTache> ldt = new ArrayList<dossierTache>();
									    if (t.isEmpty())
										 {
											 
											 request.setAttribute("vide", true);
										 }
									    else
									    {
									    	System.out.println("yes");
									    	request.setAttribute("detail", true);
									    }
										for (tache r : t) {
											dossierTache dt  = new dossierTache();
											employe e = metier1.getEmploye(r.getNum_emp());
											dt.setNameEmp(e.getNom_emp() + " " + e.getPrenom_emp());
											String ch1 = r.getTemp_debut();
											 String ch2 = r.getTemp_fin();
											 String duree ="";
											
											 if(ch1.equals("N/A"))
											 {
												 duree = "L'Employé n'a pas encore commencé";
											 }
											 else
												 if(ch2.equals("N/A"))
												 {
													 duree = "Début: " + ch1;
												 }
												 else
												 {
											 String tabOne1[]  = ch1.split(" ");
											 String tabOne2[]  = ch2.split(" ");
											 
											 
											 String tabTwo1[]  = tabOne1[0].split("/");
											 String tabTwo2[]  = tabOne1[1].split(":");
											 String tabTwo3[]  = tabOne2[0].split("/");
											 String tabTwo4[]  = tabOne2[1].split(":");
											 
											 int time1 = Integer.parseInt(tabTwo4[0])*60*60 + Integer.parseInt(tabTwo4[1])*60 + Integer.parseInt(tabTwo4[2]);
											 int time2 = Integer.parseInt(tabTwo2[0])*60*60 + Integer.parseInt(tabTwo2[1])*60 + Integer.parseInt(tabTwo2[2]);
											 
											 int time = time1 - time2;
											 int h = time/3600;
											 int min = time%3600/60;
											 int s = time%3600%60;
											 int a = Integer.parseInt(tabTwo3[0]) - Integer.parseInt(tabTwo1[0]);
											 int m = Integer.parseInt(tabTwo3[1]) - Integer.parseInt(tabTwo1[1]);
											 int j = Integer.parseInt(tabTwo3[2]) - Integer.parseInt(tabTwo1[2]);
											 
											 if (a != 0)
												 duree =  + a + " An(s)   ";
											 if (m != 0)
												 duree = duree + m + " Mois  ";
											 if (j != 0)
												 duree = duree + j + " Jour(s)  ";
											 if (h != 0)
												 duree = duree + h + " Heure(s)  ";
											 if (min != 0)
												 duree =duree +min + " Minute(s)  ";
											 if (s != 0)
												 duree = duree + s + " Seconde(s)  ";
												 }
											dt.setDuree(duree);
											ldt.add(dt);
										}
										 for (dossierTache r : ldt) {
										    	System.out.println(r.getNameEmp() + " " + r.getDuree());
										    }
										request.setAttribute("dt", ldt);
										request.setAttribute("taches", t);
										System.out.println(request.getServletPath());
										System.out
												.println("Here " + typeD);
										
									}
									}
									request.getRequestDispatcher("listeDossiersAdmin.jsp").forward(request, response);
							    }
								else
									if (request.getServletPath().equals("/DossiersAchives.php")) {
										HttpSession session = request.getSession();
										
										if (session.getAttribute("loggedOnEmp")==null){
										String username = request.getParameter("email");
										String mdp = request.getParameter("password");
										System.out.println(mdp);
										List<employe> lsemp = metier1.listeEmployes();
										System.out.println("Connexion Employe");
										int k = 0;
										for(employe em:lsemp)
										{
											if(em.getEmail_emp().equals(username) && em.getMdp_emp().equals(mdp))
												k++;
										}
										String err = "Login ou mot de passe incorrect";
										if(k == 0)
										{
											request.setAttribute("erreur", err);
											request.getRequestDispatcher("loginEmploye.jsp").forward(request, response); 
										}
											
										else
											if(k>0)
											{
											session = request.getSession();
			    							employe e = metier1.getEmployeTwo(username, mdp);
			    							session.setAttribute("loggedOnEmp", e);
			    							model.setEm(e);
			    							if(e.getEmail_emp().equals("admin@admin.ma")==true && e.getMdp_emp().equals("123")==true)
			    							{
			    								response.sendRedirect("adminDashboard.jsp");
			    							}
			    							else
			    							{
			    								dossier = metier.listeDossiersEmp(e.getNum_emp());
												model.setDossier(dossier);
												String sessus = e.getPrenom_emp() + " " + e.getNom_emp();
												request.setAttribute("user", sessus);
												request.setAttribute("email", username);
												System.out.println("Login: " + e.getNum_emp() + " & k = " +k);
												request.getRequestDispatcher("indexEmploye.jsp").forward(request, response);

			    							}
											}
										}
										else
										{	
										employe emplo = (employe) session.getAttribute("loggedOnEmp");
										dossier = metier.listeDossiersEmpArchive(emplo.getNum_emp());
										model.setDossier(dossier);
										request.getRequestDispatcher("indexEmploye.jsp").forward(request, response);
										}
									}
									else
										if(request.getServletPath().equals("/MessagesClients.php"))
										{
											List<contact> mess = metierC.listeContactDisplay();
											request.setAttribute("messages", mess);
											request.getRequestDispatcher("listeMessages.jsp").forward(request, response);
										}
										else
											if (request.getServletPath().equals("/ProfilClient.php")) {
												
												HttpSession session=request.getSession(); 
					    						if (session.getAttribute("nom")==null){
					    							response.sendRedirect("login.jsp");
					    						}
					    						else {
					    							user ur = (user) session.getAttribute("nom");
	    											request.setAttribute("num", ur.getNum_user());
	    											request.setAttribute("nom", ur.getNom_user());
	    											request.setAttribute("prenom", ur.getPrenom_user());
	    											request.setAttribute("email", ur.getEmail_user());
	    											request.setAttribute("tel", ur.getTel_user());
	    											request.setAttribute("mdp", ur.getMdp_user());
	    											request.setAttribute("urname", ur.getUsername());
	    											request.getRequestDispatcher("profilClient.jsp").forward(request, response);
												}
    											
											}
											else
												if (request.getServletPath().equals("/SuivreDossier.php")) {
													int ref1 = Integer.parseInt(request.getParameter("ref1"));
													List<tache> lt = metier2.listeTachesDossier(ref1);
													request.setAttribute("taskches", lt);
													dossier ds = metier.getDossier(ref1);
													request.setAttribute("percentage",ds.getProgression_doss());
													
													request.setAttribute("folder",ds);
													request.getRequestDispatcher("trackingPage.jsp").forward(request, response);
												}
												else
													if (request.getServletPath().equals("/ListeSuggestions.php")) {
														List<tache> lstt = metier2.getSuggestionsTaches();
														request.setAttribute("lstSugg", lstt);
														request.getRequestDispatcher("listeSuggestions.jsp").forward(request, response);
														
													}
					
	
	
	
	
	////////////////////// Traitement Via Une Action //////////////////////
	
	
	  
	if(action != null) {
		if(action.equals("confirmer")) {
			String nomD,etatD;
			int nbemp,emp;
			
			//Ajout de dossier
			nomD = request.getParameter("nomDoss");	
			emp = Integer.parseInt(request.getParameter("empinit"));
			String email = request.getParameter("email");
			List<tache> lstTaches = metier2.getTachesEmp(emp);
			request.setAttribute("taches", lstTaches);
	
			
			employe em = metier1.getEmploye(emp);
			dossier d = new dossier();
			d.setNom_doss(nomD);
			d.setEmpl_courant(em);
			d.setEtat_doss("Attente");
			String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			d.setDate_ajout(date);
			d.setProgression_doss(0);
			
			String[] empsinit = request.getParameterValues("empsdossier");
			nbemp = empsinit.length;
			d.setNbre_emp(nbemp);
			String names = new String("");;
			for(int i = 0 ; i < empsinit.length ; i++)
			{
				names = names + empsinit[i] + ";";
			}
			d.setListe_emp(names);
			tache t = metier2.getTache(1);
			d.setTache_courante(t);
			d.setEmail_cl(email);
			System.out.println("Noms: " + names);
			metier.addDossier(d);
			request.setAttribute("numeroDoss", model);
			
		}
		else if(action.equals("modifier"))
		{
			dossier = metier.listeDossiers();
			model.setDossier(dossier);
		}
		else
			if(action.equals("laSupprimer"))
			{
				int ref1 = Integer.parseInt(request.getParameter("ref1"));
				metier.deleteDossier(ref1);
				dossier = metier.listeDossiers();
				model.setDossier(dossier);
				request.setAttribute("primary", true);
			}
			else
				if(action.equals("alterDoss"))
				{
					String nomD,dateAj,etatD;
					int numD;
					
					numD = Integer.parseInt(request.getParameter("numDoss"));	
					nomD = request.getParameter("nomDoss");	
					dateAj = request.getParameter("dateAjout");
					etatD = request.getParameter("etatDoss");
					String emailCl = request.getParameter("emailCl");
					dossier d = metier.getDossier(numD);
					
					d.setNom_doss(nomD);
					d.setEtat_doss(etatD);
					d.setEmail_cl(emailCl);
					metier.updateDossier(d);
					dossier = metier.listeDossiers();
					model.setDossier(dossier);
					request.setAttribute("before", "Tous Les ");
					request.setAttribute("primary", true);
					request.getRequestDispatcher("listeDossiersAdmin.jsp").forward(request, response);
				}
			else
				if(action.equals("laModifier"))
				{
					int ref1 = Integer.parseInt(request.getParameter("ref1"));
					dossier temp = null;
					temp = metier.getDossier(ref1);
					request.setAttribute("numDoss", temp.getNum_doss());
					request.setAttribute("nameDoss", temp.getNom_doss());
					request.setAttribute("dateAdd", temp.getDate_ajout());
					request.setAttribute("etatDoss", temp.getEtat_doss());
					request.setAttribute("emailCl", temp.getEmail_cl());
					request.setAttribute("tracking", temp.getTracking_number());
					request.getRequestDispatcher("modifierDossier.jsp").forward(request, response);
				}
				else if(action.equals("ajouterEmploye"))
				{
					String nom,pre,add,email,cin,daten,tel;
					nom = request.getParameter("nomEmp");
					pre = request.getParameter("preEmp");
					add = request.getParameter("addEmp");
					email = request.getParameter("emailEmp");
					cin = request.getParameter("cinEmp");
					daten = request.getParameter("dateNaissE");
					tel = request.getParameter("telEmp");
					employe emp = new employe();
					emp.setNom_emp(nom);
					emp.setPrenom_emp(pre);
					emp.setAdd_emp(add);
					emp.setEmail_emp(email);
					emp.setCin_emp(cin);
					emp.setDatenai_emp(daten);
					emp.setTel_emp(tel);
					AES enc = new AES();
					String mdp = nom + pre;
					emp.setMdp_emp(enc.encrypt(mdp, "bachelorgenieinfo"));
					metier1.addEmploye(emp);
					request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
					envoyerEmail send = new envoyerEmail();
					String client = email;
					String sujet = "Compte Créé - TaskTracker"; 
					String contenu = "Bienvenue au sein de l'équipe Mr. "+ pre + " "+ nom +"!\r\n" + 
							"\r\n" + 
							"L’ajout de votre profil a effectué avec succès. Votre login et mot de passe :\r\n" + 
							"\r\n" + 
							"Login: "+email+"\r\n" + 
							"Mot De Passe: "+enc.encrypt(mdp, "bachelorgenieinfo")+"\r\n" + 
							"Site Web: www.tasktracker.ma/loginEmp\r\n" + 
							"\r\n" + 
							"Vous pouvez changer votre mot passe si vous le désirez.";
					send.sendEmail(client, contenu, sujet);
					System.out.println("Bonjour");
				}
				else
					if(action.equals("addEmpl"))
					{
						empl = metier1.listeEmployes();
						model.setEmp(empl);
					}
					else
						if(action.equals("confnum"))
						{
//							int num = Integer.parseInt(request.getParameter("numtrack"));
//							dossier d = metier.getDossier(num);
//							String stat = d.getEtat_doss();
//							int prog = d.getProgression_doss();
//							request.setAttribute("status", stat);
//							request.setAttribute("prog", prog);
							
							String numt = request.getParameter("numtrack");
							
							if(metier.getDossierTrack(numt) == null  ){
								request.getRequestDispatcher("errorpage.jsp").forward(request, response);
							}
							else
							{
								int num = metier.getDossierTrack(numt).getNum_doss();
								List<tache> lt = metier2.listeTachesDossier(num);
								request.setAttribute("taskches", lt);
								dossier ds = metier.getDossier(num);
								request.setAttribute("percentage",ds.getProgression_doss());
								
								request.setAttribute("folder",ds);
								request.getRequestDispatcher("trackingPage.jsp").forward(request, response);
							}
								
							
						}
						
						else
							if(action.equals("accessDossier"))
								{
									//Numéro Dossier
									int ref1 = Integer.parseInt(request.getParameter("ref1"));
									//Numéro Employé
									int ref2 = Integer.parseInt(request.getParameter("ref2"));
									dossier temp = null;
									temp = metier.getDossier(ref1);
									request.setAttribute("folder", temp);
									String name = temp.getEmpl_courant().getNom_emp() + " " + temp.getEmpl_courant().getPrenom_emp();
									request.setAttribute("name", name);
								}
								else
									if(action.equals("confEnd"))
									{
										int numemp = Integer.parseInt(request.getParameter("numempll"));
										int empsuiv = Integer.parseInt(request.getParameter("empsuiv"));
										int numdoss = Integer.parseInt(request.getParameter("numfolder"));
										tache ta = metier2.getTacheED(numdoss, numemp);
										System.out.println(ta.getNom_tache());
										DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss"); 
										LocalDateTime now = LocalDateTime.now();  
										String date = dtf.format(now);
										ta.setTemp_fin(date);
										dossier d = metier.getDossier(numdoss);
										d.setState(false);
										metier.updateDossier(d);
										metier2.updateTache(ta);
										metier.transferDossier(numdoss, metier1.getEmploye(empsuiv));
										dossier = metier.listeDossiersEmp(numemp);
										model.setDossier(dossier);
									}
									else
										if(action.equals("confirmer2"))
										{
											String etatD = request.getParameter("etatDoss");
											System.out.println(etatD + " YAAAy");
											dossier d = metier.getDernierDossier();
											Tracking t = new Tracking();
											String track = t.makeTracking(d.getNum_doss());
											d.setTracking_number(track);
											d.setEtat_doss(etatD);
										    metier.updateDossier(d);
											envoyerEmail send = new envoyerEmail();
											String sujet = "Numéro de suivi du dossier #" + d.getNum_doss();
											String contenu = "Bonjour,\r\n" + 
													"\r\n" + 
													"Nous vous informons que le traitement de votre dossier va commencer bientôt. L’ajout du dossier a bien été confirmé. Voici le détail de l’opération :\r\n" + 
													"\r\n" + 
 
													"Site web : http://www.tasktracker.ma\r\n" + 
													"\r\n" + 
													"Nom du dossier: " + d.getNom_doss() + " \r\n" + 
													"\r\n" + 
													"N° de suivi du dossier : " + d.getTracking_number() + "\r\n" + 
													"\r\n" + 
													"\r\n" + 
													"Vous pouvez suivre la progression de votre dossier sur notre site Web en utilisant le numéro de suivi ci-dessus.\r\n" + 
													"\r\n" + 
													"Pour plus d'informations, prière de nous envoyer un message via la section contact de notre site web.\r\n" + 
													"\r\n" + 
													"Task Tracker vous remercie.";
											request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
											send.sendEmail(d.getEmail_cl(), contenu, sujet);
										    
											
										}
										else
											if(action.equals("beginWork"))
											{
												  
												  tache t = new tache();
												  //Numéro Employé
												  int ref1 = Integer.parseInt(request.getParameter("ref1"));
												  //Nom Tache
												  String ref2 = request.getParameter("ref2");
												  //Numéro Dossier
												  int ref3 = Integer.parseInt(request.getParameter("ref3"));
												  
												  
												  List<tache> lstT = metier2.getTachesEmp(ref1);
												  request.setAttribute("tasks", lstT);
												  dossier temp = null;
												  temp = metier.getDossier(ref3);
												  request.setAttribute("folder", temp);
													
								    		}else
								    			if(action.equals("confirmTask"))
								    			{
								    				tache t = new tache();
								    				int numdoss = Integer.parseInt(request.getParameter("numfolder"));
								    				int numemp = Integer.parseInt(request.getParameter("numempll"));
								    				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
													LocalDateTime now = LocalDateTime.now();  
													String date = dtf.format(now);
												    t.setNom_tache(request.getParameter("tachenom"));
												    t.setNum_emp(numemp);
												    t.setNum_doss(numdoss);
												    t.setTemp_debut(date);
												    t.setTemp_fin("N/A");
													  dossier d = metier.getDossier(t.getNum_doss());
													  
													  if(d.getProgression_doss() == 0)
														  t.setOrdre(1);
													  else
													  {
														  t.setOrdre(metier2.getDernierePos(numdoss)+1);
														  System.out.println("Derniere Pos: " + metier2.getDernierePos(numdoss));
													  }
													  
													  metier2.addTache(t);
													  tache ta = metier2.getTacheND(t.getTemp_debut());
													  d.setTache_courante(ta);
													  d.setEtat_doss(t.getNom_tache());
													  d.setState(true);
													  metier.updateDossier(d);
													  boolean test = true;
													  request.setAttribute("myCondition", test);
													  
													  HttpSession session = request.getSession();
													  employe emplo = (employe) session.getAttribute("loggedOnEmp");
													  dossier = metier.listeDossiersEmp(emplo.getNum_emp());
													  model.setDossier(dossier);
								    			}
								    			else 
								    				if(action.equals("register"))
								    				{
								    					String username = request.getParameter("username");
								    					String name = request.getParameter("name");
								    					String lastname = request.getParameter("lastname");
								    					String email = request.getParameter("email");
								    					String gsm = request.getParameter("gsm");
								    	
								    					user u = new user();
								    					u.setUsername(username);
								    					u.setNom_user(name);
								    					u.setPrenom_user(lastname);
								    					u.setEmail_user(email);
								    					u.setTel_user(gsm);
								    					String mdp = cryptage.encrypt(request.getParameter("mdp"), key);
								    					
								    					u.setMdp_user(mdp);
								    					metier3.addUser(u);
								    					request.getRequestDispatcher("login.jsp").forward(request, response); 
								    				}
								    				else if(action.equals("login"))
								    				{
//								    					String username = request.getParameter("emailuser");
//								    					String mdp = AES.encrypt(request.getParameter("password"), key);
//								    					List<user> lstu = metier3.listeUsers();
//								    
//								    					int k = 0;
//								    					for(user us:lstu)
//								    					{
//								    						if(us.getUsername().equals(username) && us.getMdp_user().equals(mdp))
//								    							k++;
//								    					}
//								    					String err = "Login ou mot de passe incorrect";
//								    					if(k == 0)
//								    					{
//								    						request.setAttribute("erreur", err);
//								    						request.getRequestDispatcher("login.jsp").forward(request, response); 
//								    					}
								    						
//								    					else
//								    						if(k>0)
//								    						{
//								    							HttpSession session = request.getSession();
//								    							session.setAttribute("nom", username);
//								    							user u = metier3.getUserTwo(username,mdp);
//								    							model.setUr(u);
//								    							if(us.getUsername().contentEquals("admin") && us.getMdp_user().equals("123"))
//								    							response.sendRedirect("indexAdmin.jsp");
//								    							else
//								    								response.sendRedirect("empIndex.jsp");
//								    						}

								    				}
								    				else
								    					if(action.equals("loginEmp"))
								    					{

								    						String username = request.getParameter("email");
									    					String mdp = request.getParameter("password");
									    					List<employe> lsemp = metier1.listeEmployesLogin();
									    					System.out.println("Connexion Employe");
									    					int k = 0;
									    					for(employe em:lsemp)
									    					{
									    						if(em.getEmail_emp().equals(username) && em.getMdp_emp().equals(mdp))
									    							k++;
									    					}
									    					String err = "Login ou mot de passe incorrect";
									    					if(k == 0)
									    					{
									    						request.setAttribute("erreur", err);
									    						request.getRequestDispatcher("loginEmploye.jsp").forward(request, response); 
									    					}
									    						
									    					else
									    						if(k>0)
									    						{
									    							HttpSession session = request.getSession();
									    							employe e = metier1.getEmployeTwo(username, mdp);
									    							session.setAttribute("loggedOnEmp", e);
									    							model.setEm(e);
									    							if(e.getEmail_emp().equals("admin@admin.ma")==true && e.getMdp_emp().equals("123")==true)
									    							{
									    								response.sendRedirect("adminDashboard.jsp");
									    							}
									    							else
									    							{
									    								dossier = metier.listeDossiersEmp(e.getNum_emp());
																		model.setDossier(dossier);
																		String sessus = e.getPrenom_emp() + " " + e.getNom_emp();
																		request.setAttribute("user", sessus);
																		request.setAttribute("email", username);
																		System.out.println("Login: " + e.getNum_emp() + " & k = " +k);
																		request.getRequestDispatcher("indexEmploye.jsp").forward(request, response);

									    							}
									    							
										    						}
								    					}
								    					else if(action.equals("logout"))
								    					{

								    						HttpSession session=request.getSession(); 
								    						if (session.getAttribute("loggedOnEmp")==null){
								    							response.sendRedirect("loginEmploye.jsp");
								    						}
								    						else {
								    							session.invalidate();  
									    			            response.sendRedirect("loginEmploye.jsp");
															}
								    					}
								    					else
								    						if (action.equals("deconn")) {
								    							HttpSession session=request.getSession(); 
									    						if (session.getAttribute("nom")==null){
									    							response.sendRedirect("login.jsp");
									    						}
									    						else {
									    							session.invalidate();  
										    			            response.sendRedirect("login.jsp");
																}
															}
								    					else
								    						if(action.equals("listTasks"))
								    						{
								    							List<TacheCount> lts = metier2.listeTachesCount();
//								    							for(TacheCount r:lts)
//								    							{
//								    								System.out.println(r.getNum_emp() + " " + r.getNom_emp() + " " +r.getCount());
//								    							}
								    							model.setTachecount(lts);
								    						}
								    						else
								    							if(action.equals("tachefromList"))
								    							{
								    								int ref1 = Integer.parseInt(request.getParameter("ref1"));
								    								List<tache> lt = metier2.getTachesEmp(ref1);
								    								List<TacheCount> lts = metier2.listeTachesCount();
								    								model.setTaches(lt);
								    								model.setTachecount(lts);
								    								request.getRequestDispatcher("listeTaches.jsp").forward(request, response);
								    								
								    							}
								    							else
								    								if(action.equals("addtache"))
								    								{
								    									empl = metier1.listeEmployes();
								    									model.setEmp(empl);
								    									request.getRequestDispatcher("ajoutTache.jsp").forward(request, response); 	
								    								}
								    								else
								    									if(action.equals("ajoutertache"))
								    									{
								    										String nomtache = request.getParameter("nomtache");
										    								int numemp = Integer.parseInt(request.getParameter("emptache"));
										    								tache t = new tache();
										    								t.setNom_tache(nomtache);
										    								t.setNum_doss(1);
										    								t.setNum_emp(numemp);
										    								t.setTemp_debut("N/A");
										    								t.setTemp_fin("N/A");
										    								t.setOrdre(0);
										    								metier2.addTache(t);
										    								List<TacheCount> lts = metier2.listeTachesCount();
										    								model.setTachecount(lts);
										    								request.getRequestDispatcher("listeTaches.jsp").forward(request, response);
								    									}
								    									else
								    										if (action.equals("markFail")) {
																				
								    											HttpSession session = request.getSession();
								    											employe emplo = (employe) session.getAttribute("loggedOnEmp");
								    											int ref1 = Integer.parseInt(request.getParameter("ref1"));
								    											dossier d = metier.getDossier(ref1);
								    											request.setAttribute("emailc", d.getEmail_cl());
								    											request.setAttribute("numdoss", ref1);
								    											
								    											
//								    											if (d.getEtat_doss().equals("Attente")) {
//								    											tache t = new tache();
//								    											DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
//																				LocalDateTime now = LocalDateTime.now();  
//																				String date = dtf.format(now);
//																			    t.setNom_tache("Echec De Traitement");
//																			    t.setNum_emp(emplo.getNum_emp());
//																			    t.setNum_doss(ref1);
//																			    t.setTemp_debut(date);
//																			    t.setTemp_fin("N/A");
//																				  					  
//																				  if(d.getProgression_doss() == 0)
//																					  t.setOrdre(1);
//																				  else
//																				  {
//																					  t.setOrdre(metier2.getDernierePos(ref1)+1);
//																				  }
//																				  
//																				  metier2.addTache(t);
//								    											}
//								    											else {
//																					dossier doss  = metier.getDossier(ref1);
//																					System.out.println("Echec de traitement du dossier, la tache num: " + doss.getTache_courante().getNum_tache());
//																					tache tch = metier2.getTacheParNum(doss.getTache_courante().getNum_tache());
//																					tch.setNom_tache("Echec De Traitement");
//																					metier2.updateTache(tch);
//																				}
												    							dossier = metier.listeDossiersEmp(emplo.getNum_emp());
																				model.setDossier(dossier);
								    											
																				request.getRequestDispatcher("reponseClientEchec.jsp").forward(request, response); 	
																			}
								    										else
								    											if (action.equals("messageEchec")) {
								    												HttpSession session = request.getSession();
									    											employe emplo = (employe) session.getAttribute("loggedOnEmp");
									    											int ref1 = Integer.parseInt(request.getParameter("numdoss"));
									    											dossier d = metier.getDossier(ref1);
									    											String sujrep = request.getParameter("sujrep");
									    											String msgrep = request.getParameter("msgrep");
									    											envoyerEmail send = new envoyerEmail();
									    											send.sendEmail(d.getEmail_cl(), msgrep, sujrep);
									    											
								    												d.setEtat_doss("Echec De Traitement");
									    											metier.updateDossier(d);
													    							dossier = metier.listeDossiersEmp(emplo.getNum_emp());
																					model.setDossier(dossier);
																					request.getRequestDispatcher("indexEmploye.jsp").forward(request, response);
																				}
								    										else
								    											if (action.equals("supEmp")) {
								    												int ref1 = Integer.parseInt(request.getParameter("ref1"));
								    												metier1.deleteEmploye(ref1);
								    												empl = metier1.listeEmployes();
								    												model.setEmp(empl);
								    												request.getRequestDispatcher("listeEmployes.jsp").forward(request, response);
																				}
								    											else
								    												if (action.equals("dossCl")) {
								    													HttpSession session = request.getSession();
										    											user ur = (user) session.getAttribute("nom");
										    											if (session.getAttribute("nom")==null) {
										    												request.getRequestDispatcher("login.jsp").forward(request, response);
																						}
								    													dossier = metier.listeDossiersEmail(ur.getEmail_user());
								    													model.setDossier(dossier);
								    													request.getRequestDispatcher("dossiersClient.jsp").forward(request, response);
																					}
								    												else 
								    													if(action.equals("Envoyer Message"))
								    													{
								    														String nomc = request.getParameter("nomc");
								    														String emailc = request.getParameter("emailc");
								    														String sujetm = request.getParameter("sujetm");
								    														String message = request.getParameter("message");
								    														System.out
																									.println(message);
								    														contact c = new contact();
								    														c.setNom_contact(nomc);
								    														c.setEmail_contact(emailc);
								    														c.setSujet_contact(sujetm);
								    														c.setMessage_contact(message);
								    														metierC.initierContact(c);
								    														envoyerEmail send = new envoyerEmail();
								    														String msg = "Merci beaucoup pour votre message!\r\n" + 
								    																"\r\n" + 
								    																"Ceci est un accusé de réception de votre demande, elle sera traitée bientôt et vous receverez une réponse dans les 48 heures ouvrables après avoir envoyé votre message.\r\n" + 
								    																"Cordialement,\r\n" + 
								    																"\r\n" + 
								    																"Task Tracker"+ "\r\n\n" + " Votre Message: " + "\r\n" + message;
								    														System.out.println(msg);
								    														send.sendEmail(c.getEmail_contact(), msg, "Accusé De Réception - Task Tracker");
								    														request.getRequestDispatcher("indexClient.jsp").forward(request, response);
								    													}
								    													else
								    														if (action.equals("replyContactOne")) {
								    															int ref1 = Integer.parseInt(request.getParameter("ref1"));
								    															contact c = metierC.getContact(ref1);
								    															request.setAttribute("nomc", c.getNom_contact());
								    															request.setAttribute("emailc",c.getEmail_contact());
								    															request.setAttribute("sujetc", c.getSujet_contact());
								    															request.setAttribute("messagec", c.getMessage_contact());
								    															request.setAttribute("numcon", ref1);
								    															
								    														
								    															request.getRequestDispatcher("reponseClient.jsp").forward(request, response);
								    														
																							}
								    														else
								    															if (action.equals("replyContactTwo")) {
								    																String sujrep = request.getParameter("sujrep");
								    																String msgrep = request.getParameter("msgrep");
								    																String emailc = request.getParameter("emailc");
								    																int numcontact = Integer.parseInt(request.getParameter("numcontact"));
								    																envoyerEmail send = new envoyerEmail();
								    																send.sendEmail(emailc, msgrep, sujrep);
								    																contact c = metierC.getContact(numcontact);
								    																c.setEtat_contact(true);
								    																metierC.updateContact(c);
								    																List<contact> mess = metierC.listeContactDisplay();
								    																request.setAttribute("messages", mess);
								    																request.getRequestDispatcher("listeMessages.jsp").forward(request, response);
								    															}
								    															else 
								    																if (action.equals("Confirmer Changements")) {
								    																	int num = Integer.parseInt(request.getParameter("num_user"));
								    																	String nom = request.getParameter("nom_user");
											    														String prenom = request.getParameter("prenom_user");
											    														String email = request.getParameter("email_user");
											    														String gsm = request.getParameter("tel_user");
											    														String mdp = cryptage.encrypt(request.getParameter("mdp_user"), key);
											    														String usern = request.getParameter("username");
											    														user u = new user();
											    														u.setNum_user(num);
											    														u.setNom_user(nom);
											    														u.setPrenom_user(prenom);
											    														u.setEmail_user(email);
											    														u.setTel_user(gsm);
											    														u.setMdp_user(mdp);
											    														u.setUsername(usern);
											    														metier3.updateUser(u);
											    														HttpSession session=request.getSession();
																			    						session.invalidate();  
																			    			            response.sendRedirect("login.jsp");
											    														
																									}
								    																else
								    																	if (action.equals("clickModifEmp")) {
								    																		int ref1 = Integer.parseInt(request.getParameter("ref1"));
								    																		employe e = metier1.getEmploye(ref1);
								    																		request.setAttribute("adresse", e.getAdd_emp());
								    																		System.out
																													.println(e.getAdd_emp());
								    																		request.setAttribute("cin", e.getCin_emp());
								    																		request.setAttribute("birthday", e.getDatenai_emp());
								    																		request.setAttribute("email", e.getEmail_emp());
								    																		request.setAttribute("mdp", e.getMdp_emp());
								    																		request.setAttribute("nom", e.getNom_emp());
								    																		request.setAttribute("prenom", e.getPrenom_emp());
								    																		request.setAttribute("num", e.getNum_emp());
								    																		request.setAttribute("tel", e.getTel_emp());
								    																		request.getRequestDispatcher("modifierEmploye.jsp").forward(request, response);
																										}
								    																	else
								    																		if (action.equals("modifierEmploye")) {
																												
								    																			String nom,pre,add,email,cin,daten,tel;
								    																			int numemp = Integer.parseInt(request.getParameter("numEmp"));
								    																			nom = request.getParameter("nomEmp");
								    																			pre = request.getParameter("preEmp");
								    																			add = request.getParameter("addEmp");
								    																			email = request.getParameter("emailEmp");
								    																			cin = request.getParameter("cinEmp");
								    																			daten = request.getParameter("dateNaissE");
								    																			tel = request.getParameter("telEmp");
								    																			String mdp = request.getParameter("mdpEmp");
								    																			System.out
																														.println(mdp);
								    																			employe emp = new employe();
								    																			emp.setNom_emp(nom);
								    																			emp.setPrenom_emp(pre);
								    																			emp.setAdd_emp(add);
								    																			emp.setEmail_emp(email);
								    																			emp.setCin_emp(cin);
								    																			emp.setDatenai_emp(daten);
								    																			emp.setTel_emp(tel);
								    																			emp.setNum_emp(numemp);
								    																			emp.setMdp_emp(mdp);
								    																			metier1.updateEmploye(emp);
								    																			empl = metier1.listeEmployes();
								    																			model.setEmp(empl);
								    																			request.getRequestDispatcher("listeEmployes.jsp").forward(request, response);
																											}
								    																		else
								    																			if (action.equals("supTache")) {
								    																				int ref1 = Integer.parseInt(request.getParameter("ref1"));
																													metier2.deleteTache(ref1);
																													List<TacheCount> lts = metier2.listeTachesCount();
																					    							model.setTachecount(lts);
																					    							request.getRequestDispatcher("listeTaches.jsp").forward(request, response);
																												}
								    																			else
								    																				if (action.equals("modCordEmp")) {
								    																					String nom,pre,add,email,cin,daten,tel;
										    																			int numemp = Integer.parseInt(request.getParameter("numemp"));
										    																			nom = request.getParameter("nom");
										    																			pre = request.getParameter("prenom");
										    																			add = request.getParameter("addemp");
										    																			email = request.getParameter("email");
										    																			cin = request.getParameter("cin");
										    																			daten = request.getParameter("datenaiss");
										    																			tel = request.getParameter("gsm");
										    																			String mdp = request.getParameter("mdp");
										    																			System.out
																																.println(mdp);
										    																			employe emp = new employe();
										    																			emp.setNom_emp(nom);
										    																			emp.setPrenom_emp(pre);
										    																			emp.setAdd_emp(add);
										    																			emp.setEmail_emp(email);
										    																			emp.setCin_emp(cin);
										    																			emp.setDatenai_emp(daten);
										    																			emp.setTel_emp(tel);
										    																			emp.setNum_emp(numemp);
										    																			emp.setMdp_emp(mdp);
										    																			metier1.updateEmploye(emp);
										    																			HttpSession session=request.getSession(); 
										    												    						session.invalidate();  
										    													    			            response.sendRedirect("loginEmploye.jsp");
																													}
								    																				else
								    																					if (action.equals("suggestionTache2")) {
								    																						HttpSession session = request.getSession();
								    																						employe emplo = (employe) session.getAttribute("loggedOnEmp");
								    																						String nom = request.getParameter("nomTache");
								    																						tache t = new tache();
								    																						t.setNom_tache(nom);
								    																						t.setTemp_debut("N/A");
								    																						t.setTemp_fin(emplo.getNom_emp() + " " + emplo.getPrenom_emp());
								    																						t.setOrdre(0);
								    																						t.setNum_doss(1);
								    																						
								    																						  t.setNum_emp(emplo.getNum_emp());
								    																						  metier2.addSuggestionTache(t);
								    																						  response.sendRedirect("/Tracabilite_Projet/platformeEmploye.php");
								    																						  
								    																						
																														}
								    																					else
								    																						if (action.equals("supprSugg")) {
								    																							int ref1 = Integer.parseInt(request.getParameter("ref1"));
																																metier2.deleteTache(ref1);
																																List<tache> lts = metier2.getSuggestionsTaches();
																								    							request.setAttribute("lstSugg", lts);
																								    							request.getRequestDispatcher("listeSuggestions.jsp").forward(request, response);
																															}
								    																						else
								    																							if (action.equals("approveTache")) {
								    																								int ref1 = Integer.parseInt(request.getParameter("ref1"));
								    																								tache t = metier2.getTacheParNum(ref1);
								    																								t.setTemp_debut("N/A");
								    																								t.setTemp_fin("N/A");
								    																								metier2.updateTache(t);
								    																								List<tache> lts = metier2.getSuggestionsTaches();
																									    							request.setAttribute("lstSugg", lts);
																									    							request.getRequestDispatcher("listeSuggestions.jsp").forward(request, response);
																																}
								    																					
								    														
								    												
								    													
								    										
								    													 
										System.out.println("path is " + request.getServletPath());
		
		
			if(action.equals("modifier"))
			{
				request.setAttribute("before", "Tous Les ");
				request.setAttribute("primary", true);
				request.getRequestDispatcher("listeDossiersAdmin.jsp").forward(request, response);
			}
			else
				if(action.equals("addEmpl"))
				{
					request.getRequestDispatcher("ajoutDossier.jsp").forward(request, response);
				}
				else
					if(action.equals("platEmp"))
					{
						request.getRequestDispatcher("loginEmploye.jsp").forward(request, response);
					}
					else
						if(action.equals("accessDossier"))
						{
							request.getRequestDispatcher("afficherDossier.jsp").forward(request, response);
						}
						else
						if(action.equals("confEnd"))
						{
							request.getRequestDispatcher("indexEmploye.jsp").forward(request, response);
						}
						else
							if(action.equals("confirmer"))
							{
								request.getRequestDispatcher("status.jsp").forward(request, response);
							}
							else
								if(action.equals("beginWork"))
								{
									request.getRequestDispatcher("choixTache.jsp").forward(request, response);
								}
								else if(action.equals("confirmTask"))
								{
									request.getRequestDispatcher("indexEmploye.jsp").forward(request, response);
								}
								else if(action.equals("listTasks"))
								{
									request.getRequestDispatcher("listeTaches.jsp").forward(request, response);
								}
	}
		
	}
	

}
