package com.etudiant.servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/compterendu.do")
public class ServletCompteRendu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServletCompteRendu() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession s = request.getSession();
		String html = "<html><body><h3>Compte rendu</h3>";
		html += "Utilisateur : " + s.getAttribute("user") + "<br>";
		html += "Civilite : " + s.getAttribute("civilite") + "<br>";
		
		//Affichage d'informations statistiques concernant la session
		//ID, temps maximal d'inactivit�, heure de cr�ation, dernier acc�s
		html += "<br> Identifiant de la session :" +s.getId();
		html += "<br> Intervalle maximal d'inactivit� :" +s.getMaxInactiveInterval() + "s";
		
		//R�cup�ration de la date de cr�ation de la session
		
		//Cr�ation d'une instance de date contenant la date courante.
		
		Date date = new Date();
		//Injection dans la date de la date de cr�ation 
		date.setTime(s.getCreationTime());
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
		html += "<br>Date de cr�ation de la session : " + sdf.format(date);
		
		date.setTime(s.getLastAccessedTime());
		html += "<br>Date du dernier acc�s � la session : " + sdf.format(date);

		html += "<br> <br> <a href='"+response.encodeRedirectURL("/08_ReecritureURL/ServletFormulaire")+"'>Premiere page</a>";
		
		html += "<br> <br> <a href='/08_ReecritureURL/ServletFormulaire'>Premiere page</a>";
		html += "</body></html>";
		
		
		
		response.getWriter().println(html);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
