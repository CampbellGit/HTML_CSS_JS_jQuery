package com.etudiant.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/adaptateur.do")
public class ServletAdaptateur extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServletAdaptateur() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//Récupération des données saisies
		String client = request.getParameter("idSaisie");
		String motdepasse = request.getParameter("mdpSaisie");
		
		//L'adaptateur peut également analyser et modifier les données avant l'envoi
		String message = null;
		if(client.equalsIgnoreCase("chirac")){
			message = "Vous n'avez pas le droit de vous connecter";
		}


		//Le bean attend aussi les une valeur pour sa propriété civilité
		//Je vais 'fabriquer' ce binome clé/valeur
		String civiliteBidon = "Cette information est indisponible";
		
		String queryString = "id=" + response.encodeURL(client) + "&mdp=" + response.encodeURL(motdepasse) + "&civilite=" + response.encodeURL(civiliteBidon) ;
		
		if (message != null){
			request.setAttribute("message", message);
		}
		
		request.getRequestDispatcher("setBean.jsp?" + queryString).forward(request, response);
		
	}

}
