package com.etudiant.modele;

import java.io.Serializable;

public class Utilisateur implements Serializable
{
	private String _id;
	private String _mdp;
	private String _civilite;

	private static final long serialVersionUID = 1L;

	public Utilisateur() {
	}

	// Définition d'une propriété en lecture/ecriture nommée 'id'
	// La définition d'un propriété est réalisée par la definition de getters et
	// setters
	// Ces deux accesseurs définissent une propriété à l'aide du mot get ou set
	// suivi par le nom de la propriété commençant par une majuscule

	public String getId() {
		return _id;
	}

	public void setId(String valeur) {
		_id = valeur;
	}

	// Définition de la propriété 'mdp' en lecture/ecriture

	public String getMdp() {
		return _mdp;
	}

	public void setMdp(String valeur) {
		_mdp = valeur;
	}
	
	//Définition de la propriété civilite :
	
	public String getCivilite() {
		return _civilite;
	}

	public void setCivilite(String valeur) {
		_civilite = valeur;
	}
	
	@Override
	public String toString() {
		return "Utilisateur [_id=" + _id + ", _mdp=" + _mdp + ", _civilite=" + _civilite + "]";
	}

}
