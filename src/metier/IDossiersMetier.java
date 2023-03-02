package metier;

import java.util.List;

public interface IDossiersMetier {
		
	public int addDossier(dossier d);
	public List<dossier> listeDossiers();
	public dossier getDossier(int num_doss);
	public void updateDossier(dossier d);
	public void deleteDossier(int num_doss);
	public void transferDossier(int num_doss, employe next_emp);
	public dossier getDernierDossier();
	public List<dossier> listeDossiersEmp(int num_emp);
	public dossier getDossierTrack(String tracking_number);
	public List<dossier> listeDossiersEmail(String emailcl);
	public List<dossier> listeDossiersNonTraites();
	public List<dossier> listeDossiersTraites();
	public List<dossier> listeDossiersEnCours();
	public List<dossier> listeDossiersEmpArchive(int num_emp);
}
