package com.etudiants.formation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

public class ExoJDBC {
	public static void main(String[] args) {

		Connection cnx = null;
		Statement stmt = null;
		ResultSet rs = null;
		// Chargement pilote
		try {
			Class.forName("com.mysql.jdbc.Driver");

		} catch (ClassNotFoundException ex) {
			System.out.println("Echec chargement driver\nRaison invoquée\n" + ex.getClass().getSimpleName());

			System.exit(10);
		}
		// Creation et ouverture de connexion vers la base
		try {
			cnx = DriverManager.getConnection(
					"jdbc:mysql://localhost/world?user=utilisateur_sql&password=pwd_sql&useSSL=false");
		} catch (SQLException e) {
			System.out.println("Echec création connexion.\nException de type : " + e.getClass().getSimpleName()
					+ "\nMessage : " + e.getMessage());
			System.exit(20);
		}

		// Création d'un objet de classe Statement (cadre d'éxecution de
		// requete)

		try {
			stmt = cnx.createStatement();
		}

		catch (SQLException ex)

		{
			System.out.println(
					"Echec création connexion : " + ex.getClass().getSimpleName() + "\nMessage : " + ex.getMessage());
			System.exit(30);

		}

		// injection dans le statement d'une requete SQLet demande de son
		// execution
		String sql = null;

		// Selection de l'id, nom, prénom et pays
		sql = "select city.name, city.population, country.name, language from city, country, countrylanguage where city.countrycode = country.code and country.code = countrylanguage.countrycode;";
		System.out.println(sql);
		
		//select city.name, city.population, country.name, language from city, country, countrylanguage where city.countrycode = country.code and country.code = countrylanguage.countrycode;

		// Exercice 21 :
		// Selectionner le nom, prenom, salaire, Pays, date de naissance et nom
		// du reponsable des employes de la base etude_SQL
		// -Afficher leurs metadonnés

		try {
			rs = stmt.executeQuery(sql);
		} catch (SQLException ex) {
			System.out
					.println("Echec requete SQL : " + ex.getClass().getSimpleName() + "\nMessage : " + ex.getMessage());
			System.exit(40);
		}

		// Le result set obtenu contient :
		// -des meta données
		// -les données selectionnées

		// Recupération des métadonnnées
		// -les bases, tables, colonnes d'où viennent les colonnes
		// -le nombre de colonnes
		// -nom, type de chaque colonne
/*
		try {
			ResultSetMetaData rsmd = rs.getMetaData();
			int nbColonnes = rsmd.getColumnCount();
			System.out.println("Nombre de colonnes selectionnées : " + nbColonnes);

			//
			for (int i = 1; i <= nbColonnes; i++) {
				System.out.println("Colone " + i + " : " + "\n\tBase : " + rsmd.getCatalogName(i) + "\n\tTable : "
						+ rsmd.getTableName(i) + "\n\tColonne : " + rsmd.getColumnName(i) + "\n\tLibélé colonne : "
						+ rsmd.getColumnLabel(i) + "\n\tType colonne : " + rsmd.getColumnTypeName(i)
						+ "\n\tTaille colonne : " + rsmd.getColumnDisplaySize(i) + "\n\tTaille décimales : "
						+ rsmd.getPrecision(i) + "\n\tNullable ? : " + (rsmd.isNullable(i) == 0 ? "Non" : "Oui")
						+ "\n\tAuto increment ? : " + (rsmd.isAutoIncrement(i) ? "Oui" : "Non")

				);
			}

		} catch (SQLException e) {
			System.out.println("Echec recupération ResultSet meta données : " + e.getClass().getSimpleName()
					+ "\nMessage : " + e.getMessage());
			System.exit(50);
		}

		// Récupération des données selectionnées
		// Remarque : L'objet result set ne contient pas les données, il peut
		// être vu comme un cursor SQL
		// qui accède aux données ligne par ligne et qui doit être deplacé de
		// ligne en ligne
		// Où pointe l'objet ResultSet juste après sa création ?
		// Réponse : son pointeur de lecture est avant la premiere ligne donc je
		// dois le positioner explicitement sur la première ligne
		// Quand la dernière ligne est atteinte, l'objet resultSet retourne
		// false
*/
		try {
			while (rs.next()) {
				//L'objet rs contient 1 tuple de données
				
				//int id = rs.getInt(1);
				String nomPays = rs.getString("name");
				/*String prenomEmploye = rs.getString("Prenom");
				String pays = rs.getString("pays");
				Date dateNaissance = rs.getDate("dateNaissance");
				float salaire = rs.getFloat("salaireMensuel");
				float salaireAnnuel = rs.getFloat("SalaireAnnuel");
				String nomResponsable = rs.getString("Responsable");
				*/
	
				System.out.println("Nom : " +nomPays +"\n\t"); 
				
				/*+"Prénom " + prenomEmploye+"\n\t"  
				+"Pays : " + pays+"\n\t"  
				+"Date de naissance : " +dateNaissance+"\n\t"  
				+"Salaire : " +salaire +"\n\t" 
				+"Salaire annuel : " +salaireAnnuel+"\n\t"  
				+"Nom responsable : " +nomResponsable );*/
				
				
			} //Fin du while re.next

			
			
		} catch (SQLException e) {
			System.out.println("Echec lecture données ResultSet : " + e.getClass().getSimpleName() + "\nMessage : "
					+ e.getMessage());
			System.exit(60);
		}
		
		finally{
			try {rs.close();} catch (SQLException e) {}
		}
		System.out.println("OK");
	} // Fin methode main


}
