package metier;

import java.util.List;

public interface ITache {
	
	public void addTache(tache t);
	public tache getTache(int num_dossier);
	public List<tache> listeTaches();
	public List<tache> getTachesEmp(int nume_emp);
	public int getDernierePos(int num_doss);
	public void updateTache(tache t);
	public tache getTacheED(int num_doss, int num_emp);
	public tache getTacheParNum(int num_tache);
	public List<tache> listeTachesDossier(int num_dossier);
	public List<TacheCount> listeTachesCount();
	public tache getTacheND(String tmp_debut);
	void deleteTache(int num_tache);
	void  addSuggestionTache(tache t);
	List<tache> getSuggestionsTaches();

}
