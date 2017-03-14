package exo;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


public class Etudiant implements Statisticable {
	
	private String matricule;
	private String nom;
	private Float valeur;
	private List<Cote> cotes = new ArrayList<Cote>();
	private List<Float> valeurs = new ArrayList<Float>();
	
	
    public void setMatricule( String matricule ) {
        this.matricule = matricule;
    }

    public String getMatricule (String matricule) {
        return matricule;
    }
    
    public void setNom( String nom ) {
        this.nom = nom;
    }

    public String getNom (String nom) {
        return nom;
    }


    public Object getCote (ArrayList<Cote> Cote) {
        return Cote;
    }
    
	public void addCote (Cote cote) {
		// check Cote name
		if (this.cotes.contains(cote)) {
			System.out.println("Cet intitulé existe déjà.");
		}
		else
		this.cotes.add(cote);
		
	}
	
	public float getValue() {
		Stats stats = new Stats();
		return stats.average( this.cotes );
	}
	
	public float getMinimum(){
		Stats stats = new Stats();
		return stats.minimum (this.cotes)
	}
}
	
	

	

    

