package com.etudiant.servlets;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etudiants.modele.Employe;


@WebServlet("/ServletSourceDonnees")
public class ServletSourceDonnees extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServletSourceDonnees() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String societe = request.getParameter("nomSociete");
		
		if (societe == null || societe.trim().length() == 0){
			response.getWriter().println("<br>Veuillez donner un nom valide.");
			return;
			
		}
		String NbEmployes = request.getParameter("nbEmployes");
				if (NbEmployes == null){
					response.getWriter().println("<br>NbEmploye non trouve.");	
					return;
				}
				int nb = -1;
				try{
					nb = Integer.parseInt(NbEmployes);
					
					if (nb < 1){
							throw new Exception();
					}
				}
				catch (Exception ex){
					response.getWriter().println("<br>Le nombre d'employes n'est pas correct.");
					return;
				}
				
				//Création de la liste qui contiendra les employés 
				List<Employe> listeEmployes = new ArrayList<>();
				
				//Population de la liste d'employes
				for(int i=1; i<= nb; i++){
					listeEmployes.add(new Employe("N" + i, "p" + i));
				}
				
				//Construction du code HTML et envoi au client
				String html = "";
				if(societe.equalsIgnoreCase("Quadra"))
					html += "<img src=ProjetSourceDonnees/images/Capturequadra.JPG/>";
				
				html += "<table>";
				
				for (Employe emp : listeEmployes)
						{
					html += "<tr>";
					html += "<td>" + emp.getNom() + "</td>";
					html += "<td>" + emp.getPrenom() + "</td>";
					html += "</tr>";
						}
				html += "<table>";
				response.setContentType("text/html");
				response.getWriter().println(html);
	}
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doGet(request, response);
			}

}
