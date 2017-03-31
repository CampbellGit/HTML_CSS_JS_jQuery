package com.etudiants.modele;

public class Employe 
{
	private String leNom, lePrenom;

	public String getNom() {
		return leNom;
	}

	public void setNom(String leNom) {
		this.leNom = leNom;
	}

	public String getPrenom() {
		return lePrenom;
	}

	public void setPrenom(String lePrenom) {
		this.lePrenom = lePrenom;
	}

	public Employe(String leNom, String lePrenom) {
		super();
		this.leNom = leNom;
		this.lePrenom = lePrenom;
	}
 

		
		
	
}
