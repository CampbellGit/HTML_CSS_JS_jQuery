package com.etudiants.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TraitementMenuPrincipal")
public class TraitementMenuPrincipal extends HttpServlet {

	private static final long serialVersionUID = 1L;
       
    public TraitementMenuPrincipal() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		 * Recuperation des donnees envoyees par le client. Pour cela on récupère les parametres.
		 * Parametre : binome clé/valeur
		 * Les param. sont injectés dans l'objet 'request' par le conteneur
		 * On peut seulement les récuperer, mais pas les définir
		 * 
		 * Les données saisies dans le formulaire du client sont attachees a des cles.
		 * Les cles sont les noms des controles de saisies du formulaire
		 * Ces clés deviennent les noms des parametres de l'objet 'request'
		 */
		
		// Recuperation donnée select
		String choixUtilisateur = request.getParameter("menuChoisir");

		/* 
		 * Recuperation donnée checkbox
		 * Si rien de choché : on récupère 'null',
		 * Sinon on obtient un tableau ( de 1 à n éléments) 
		 */
		String[] optionsUtilisateur = request.getParameterValues("optionsAdmin");
		
		// Recuperation donnée radio		
		String optionRadio = request.getParameter("groupeRadio");
		
		// Creer le queryString qui contient les données à envoyer vers un autre vue/controller
		StringBuilder queryString = new StringBuilder("");

		if (optionsUtilisateur != null) {
			for (int i=0; i < optionsUtilisateur.length; i++) {
				
				if (queryString.length() > 0) {
					queryString.append("&");						
				}
				
				if (optionsUtilisateur[i].equalsIgnoreCase("utiliserDB")) {
					queryString.append("db=oui");
				} else if (optionsUtilisateur[i].equalsIgnoreCase("envoyerEmail")) {
					queryString.append("email=1");					
				}
			}
		}
		
		if (optionRadio != null) {
			if (queryString.length() > 0) {
				queryString.append("&");						
			}
			
			queryString.append("optionRadio=" + optionRadio);
		}

		System.out.println(queryString);
		
		// On envoie les données du form
		switch (choixUtilisateur) {
		/*
		 * Je veux aller sur la page capable d'afficher les villes. Je veux aussi passer les données récupérés
		 * Possibilités :
		 * 	- passer les données dans l'objet request. Contrainte : il faut utliser la methode forward()
		 * 	- sendRedirect() vers une url contenant les données passées dans une queryString
		 * 	- passer les données par la session
		 * 
		 * Ici on va passer par un queryString
		 * 
		 */
			case "1":
				if(queryString.length() == 0 ) {
					response.sendRedirect("/05_ParametresRequest/afficherVilles.do");
				} else {
					response.sendRedirect("/05_ParametresRequest/afficherVilles.do" + "?" + queryString);
				}
				break;
			case "2":
				break;
			case "3":
				break;
			default:
				response.getWriter().println("<html><body><p>Please use page : <a href=\"index.html\">index page</a></p></body></html>");
		}
	}

}
