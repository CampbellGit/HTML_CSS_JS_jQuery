package com.etudiants.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/afficherVilles.do")
public class AfficherVilles extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Recuperer les données transmises
		String utiliserDB = request.getParameter("db");
		String envoiEmail = request.getParameter("email");
		String radio = request.getParameter("optionRadio");
		
		String html = "";
		if (utiliserDB != null && utiliserDB.equalsIgnoreCase("oui")) {
			html = "<html><body><p>Exercice</p><p>Utiliser jdbc et la base world pour afficher les villes</p></body></html>";
			response.getWriter().println(html);
			return;
		} else {
			html = "<html><body><p>Liste ville</p><ul>";
			
			for (int i = 1; i <= 5; i++ ) {
				html += "<li>Ville " + i + "</li>";
			}
					
			html += "<ul></body></html>";
			response.getWriter().println(html);
			return;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
