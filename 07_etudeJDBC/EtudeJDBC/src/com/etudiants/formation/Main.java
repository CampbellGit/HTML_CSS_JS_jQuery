package com.etudiants.formation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

public class Main {

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
					"jdbc:mysql://localhost/etude_sql?user=utilisateur_sql&password=pwd_sql&useSSL=false");
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
		sql = "select E.idEmploye, E.Nom, E.Prenom, P.Pays, E.DateNaissance, E.salaireMensuel, E.salaireMensuel * 12 as 'SalaireAnnuel', concat (R.Nom, ' ', R.Prenom) as 'Responsable' "
				+ "from employes E, pays P, employes R "
				+ "where E.idPays = P.idPays and  E.idResponsable = R.idEmploye;";
		System.out.println(sql);

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

		try {
			while (rs.next()) {
				//L'objet rs contient 1 tuple de données
				
				int id = rs.getInt(1);
				String nomEmploye = rs.getString("Nom");
				String prenomEmploye = rs.getString("Prenom");
				String pays = rs.getString("pays");
				Date dateNaissance = rs.getDate("dateNaissance");
				float salaire = rs.getFloat("salaireMensuel");
				float salaireAnnuel = rs.getFloat("SalaireAnnuel");
				String nomResponsable = rs.getString("Responsable");
				System.out.println("ID : " +id +"\n\t" 
				+ "Nom : " +nomEmploye +"\n\t" 
				+"Prénom " + prenomEmploye+"\n\t"  
				+"Pays : " + pays+"\n\t"  
				+"Date de naissance : " +dateNaissance+"\n\t"  
				+"Salaire : " +salaire +"\n\t" 
				+"Salaire annuel : " +salaireAnnuel+"\n\t"  
				+"Nom responsable : " +nomResponsable );
				
				
			} //Fin du while re.next

			
			
		} catch (SQLException e) {
			System.out.println("Echec lecture données ResultSet : " + e.getClass().getSimpleName() + "\nMessage : "
					+ e.getMessage());
			System.exit(60);
		}
		
		finally{
			try {rs.close();} catch (SQLException e) {}
		}

		//C.R.U.D. - Create, Read, Update, Delete
		//Suppression
		sql = "delete from employes where nom like 'LeNom%'; ";
		try {
			int nb= stmt.executeUpdate(sql);
			System.out.println("Nombre de lignes supprimées : "+nb);

		} catch (SQLException e) {
			System.out
			.println("Echec suppression données : " + e.getClass().getSimpleName() + "\nMessage : " + e.getMessage());
	System.exit(80);
		}
		
		
		//Insertions
		sql = "insert into employes(Nom, prenom, dateNaissance, salaireMensuel, idResponsable, idPays, idSociete) "
				+"values "
				+"('LeNom1', 'LePrenom1', '1993-10-09', '1200', '3','1', 'soc3'), " 
				+"('LeNom2', 'LePrenom2', '1993-07-14', '1800', '2','3', 'soc2');"; 
		System.out.println(sql);
		try {
			int nb= stmt.executeUpdate(sql);
			System.out.println("Nombre de lignes Inserées : "+nb);
		} catch (SQLException e) {
			System.out
			.println("Echec insertion/creation SQL : " + e.getClass().getSimpleName() + "\nMessage : " + e.getMessage());
	System.exit(70);
		}
		
		//Update
		String suffix =  "" + (new Date()).getTime(); 
		suffix = suffix.substring(suffix.length()-4);
		sql = "update employes " +
		"set " +
		"nom = concat(nom, '"+suffix+ "'), prenom=concat(prenom, '"+suffix+ "')"
				+ "where nom like 'LeNom%' and prenom like 'LePrenom%'";
		
		try {
			int nb = stmt.executeUpdate(sql);
			System.out.println("Nombre de lignes modifiées : "+nb);
		} catch (SQLException e1) {
			System.out
			.println("Echec mise à jour SQL : " + e1.getClass().getSimpleName() + "\nMessage : " + e1.getMessage());
	System.exit(80);
		}
		
		//A part l'interface statement il en existe une autre, preparedStatement, qui permet d'executer des requetes paramétrées
		
		
		//Fermeture des ressources
		try {
			stmt.close();
		} catch (SQLException e) {}
		try {
			cnx.close();
		} catch (SQLException e) {}
		
		System.out.println("OK");
	} // Fin methode main

}
