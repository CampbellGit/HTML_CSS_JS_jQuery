package exo;

import java.util.ArrayList;
import java.util.List;

public class Cote implements Statisticable {
	
	public String courseName;
	public float cote;
	
    public void setCourseName( String courseName ) {
        this.courseName = courseName;
    }

    public String getCourseName () {
        return courseName;
    }
    
    public void setCote( int cote ) {
        this.cote = cote;
    }

    public float getCote () {
        return cote;
	

    }
	public boolean equals (Cote o) {
		if (super.equals(o)){
			return true;
		}
		Cote cotes = (Cote)o;
		if (cotes == null){
			return false;
		}
		return this.getCourseName().equals(cotes.getCourseName());
	}
	
	public float getValue() {

		return this.getCote();
	}
}



