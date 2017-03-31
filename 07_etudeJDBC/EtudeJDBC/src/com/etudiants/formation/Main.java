package com.etudiants.formation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Main {

	public static void main(String[] args) {

		Connection cnx;
			//Chargement pilote
		try{
			Class.forName("com.mysql.jdbc.Driver");
					
		}
		catch (ClassNotFoundException ex)
		{
			System.out.println("Echec chargement driver\nRaison invoquée\n"+
			ex.getClass().getSimpleName());
			
			System.exit(10);
		}
		// Creation et ouverture de connexion vers la base
		try 
		{
			DriverManager.getConnection(
					"jdbc:mysql://localhost/etude_sql?user=utilisateur_sql&password=pwd_sql&useSSL=false");
		} 
		catch (SQLException e) 
		{
			System.out.println("Echec création connexion.\nException de type : "+
					e.getClass().getSimpleName() + "\nMessage : " +
					e.getMessage());
			System.exit(20);
		}
		
		System.out.println("OK");
	} // Fin methode main
	

}
