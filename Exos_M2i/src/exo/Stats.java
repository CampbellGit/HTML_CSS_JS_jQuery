package exo;

import java.util.List;

public class Stats {
	
//	  List<Float> cote = new ArrayList();

	  public float average(List<Cote> marks) {
		  float sum =0;
		  float n=0;
		  for (Cote cote : marks){
			  sum+=cote.getCote();
			  n++;
		  }
		    
		  return sum/n;
		}

	public float getMinimum(List<Cote> marks) {
		
	}
	
	}
