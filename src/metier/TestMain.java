package metier;

import java.util.List;


public class TestMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		 IDossiersMetier metier;
		 metier = new DossiersMetierImp();
		 Iemploye metier1;
		 ITache  metier2;
			metier1 = new EmployeMetierImp();
			metier2 = new TacheMetierImp();
		 
		 List<dossier> doss = metier.listeDossiers();
		 
		 List<employe> emp = metier1.listeEmployes();
		 
		 List<tache> taches = metier2.getTachesEmp(4);
		 
//		 for(tache re:taches) {
//			 System.out.println(re.getNom_tache());
//		 }
		 
//		 tache t = metier2.getTache(3);
//		 t.setTemp_fin("2019/12/24 01:42:27");
//		 metier2.updateTache(t);
		 
//		 tache t2 = metier2.getTacheED(3, 1);
//		 System.out.println(t2.getTemp_fin());
//		 System.out.println(t2.getNom_tache());
//		 employe e = metier1.getEmploye(3);
//		 System.out.println(e.getNom_emp());
//		 metier.transferDossier(2, e);
//		 tache t = metier2.getTache(21);
//		 String[] heure = t.getTemp_debut().split(" ");
//		 
//		 for(int i = 0 ; i < 2 ; i++) {
//			 System.out.println(heure[i]);
//		 }
		 AES encryption = null;
		 String key = "bachelorgenieinfo";
		 System.out.println(encryption.decrypt("ST2Eh1m1NHg8963TynAFiw==", key));
		 
//		 envoyerEmail ee = new envoyerEmail();
//		 String client = "maskayoub@gmail.com";
//		 String message = "Khedama a sat";
//		 
//		 ee.sendEmail(client, message, "Testing This Stuff");
		 
//		 Tracking t = new Tracking();
//		 
//		 System.out.println(t.makeTracking(334));
		 
		 String ch1 = "2019/12/30 22:17:33";
		 String ch2 = "2019/12/30 23:18:30";
		 
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
		 int min = (time%3600)/60;
		 int s = time%3600%60;
		 int a = Integer.parseInt(tabTwo3[0]) - Integer.parseInt(tabTwo1[0]);
		 int m = Integer.parseInt(tabTwo3[1]) - Integer.parseInt(tabTwo1[1]);
		 int j = Integer.parseInt(tabTwo3[2]) - Integer.parseInt(tabTwo1[2]);
		 String duree ="";
		 if (a != 0)
			 duree =  + a + " An(s), ";
		 if (m != 0)
			 duree = duree + m + " Mois, ";
		 if (j != 0)
			 duree = duree + j + " Jour(s), ";
		 if (h != 0)
			 duree = duree + h + " Heure(s), ";
		 if (min != 0)
			 duree =duree +min + " Minute(s), ";
		 if (s != 0)
			 duree = duree + s + " Seconde(s), ";
				 
		 
		 System.out.println( duree);
				 
		 
		 
		 
	}

}
