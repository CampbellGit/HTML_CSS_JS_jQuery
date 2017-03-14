package exo;

import java.util.ArrayList;
import java.util.Scanner;

public class Main {
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		// variables

	ArrayList<Etudiant> db = new ArrayList<Etudiant>();
	int reponse, salairenew ;		
	Scanner sc = new Scanner(System.in);
	String nomnew, del;
	
	Etudiant m1 = new Etudiant();
	m1.setNom("Penelope");
	m1.setMatricule("1001");

	Cote c1 = new Cote();
	c1.setCourseName("math");
	c1.setCote(10);
	m1.addCote(c1);
	Cote c2 = new Cote();
	c2.setCourseName("philo");
	c2.setCote(1);
	m1.addCote(c2);
	Cote c3 = new Cote();
	c3.setCourseName("geo");
	c3.setCote(20);
	m1.addCote(c3);
	Cote c4 = new Cote();
	c4.setCourseName("bio");
	c4.setCote(15);
	m1.addCote(c4);
	
	db.add(m1);
	m1.getValue();
	
	
	System.out.println(	m1.getValue());
	
	
	Etudiant m2 = new Etudiant();
	m2.setNom("Michel");
	m2.setMatricule("1002");
	Cote c5 = new Cote();
	c5.setCourseName("pipo");
	c5.setCote(3);

	db.add(m2);
}
}

