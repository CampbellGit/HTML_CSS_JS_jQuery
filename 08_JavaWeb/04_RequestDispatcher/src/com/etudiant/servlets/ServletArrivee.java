package com.etudiant.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletArrivee
 */
@WebServlet("/collectionservlets/pagearrivee.do")
public class ServletArrivee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServletArrivee() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//Recupération des données envoyées par la servletStart dans l'objet request
		String cours = (String)request.getAttribute("nomCours");
		//int duree = (Integer)request.getAttribute("durée");
		int duree = 0;
		if (request.getAttribute("durée") != null)
			duree = (Integer)request.getAttribute("durée");
		
		response.setContentType("text/html");
		response.getWriter().println(
				/*
				"<html><body><h2>Servlet arrivée</h2>"
				+ "<a href='/03_SendRedirect/pagestart.do'>Page 1</a>"

				+ "</body></html>")
				;
				*/
				"<html><body><h2>Servlet arrivée</h2>"
				+ "Nom du cours : " + (cours != null ? cours : "inconnu") + "<br>"
				+ "Durée : " +(duree == 0 ? "inconnue" : duree) + "<br><br>"
				+ "<form action='/04_RequestDispatcher/pagestart.do' method='post'><input type='submit' value='Page 1'/></form>"
				+ "</body></html>"
				);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
