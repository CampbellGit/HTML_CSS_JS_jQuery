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

	// D�finition d'une propri�t� en lecture/ecriture nomm�e 'id'
	// La d�finition d'un propri�t� est r�alis�e par la definition de getters et
	// setters
	// Ces deux accesseurs d�finissent une propri�t� � l'aide du mot get ou set
	// suivi par le nom de la propri�t� commen�ant par une majuscule

	public String getId() {
		return _id;
	}

	public void setId(String valeur) {
		_id = valeur;
	}

	// D�finition de la propri�t� 'mdp' en lecture/ecriture

	public String getMdp() {
		return _mdp;
	}

	public void setMdp(String valeur) {
		_mdp = valeur;
	}
	
	//D�finition de la propri�t� civilite :
	
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
