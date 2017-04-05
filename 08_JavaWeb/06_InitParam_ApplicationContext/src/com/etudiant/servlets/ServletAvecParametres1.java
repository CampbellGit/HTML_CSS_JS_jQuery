package com.etudiant.servlets;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ServletAvecParametres1")
public class ServletAvecParametres1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServletAvecParametres1() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// R�cupration des parametres d'initialisation (init-param) personnalis�s
		//Ces parametres ne se trouvent pas dans le contexte, mais dans la configuration de la servlet
		
		//Recuperation de la configuration de la servlet
		ServletConfig configurationServlet = getServletConfig();
		String codeSecret = configurationServlet.getInitParameter("codeSecret");
		String couleur = configurationServlet.getInitParameter("couleur");
		
		//R�cup�ration des valeurs d'initialisation d�finies pour toutes les servlets
		
		
		//R�cup�ration du contexte
		ServletContext contexte = getServletContext();
		
		String urlBase = contexte.getInitParameter("urlDb");
		String vMaxAutoroute = contexte.getInitParameter("vMax");
		
		// Si on veut d�poser et r�cuperer ensuite nos propres bin�mes cl�s/valeurs
		//dans le contexte (pour les rendre disponibles partout et pour tous les utilisateurs)
		//il faut utiliser les attributs du contexte
		
		//Mise en place de la m�canique n�c�ssaire afin de connaitre le nombre total de visites sur toutes les pages de l'application
		Integer obj = (Integer)contexte.getAttribute("nbTotalAcces");
		int nb;
		if(obj == null)
			//il s'agit d'un attribut qui n'a pas encore �t� ins�r� dans le contexte, je l'ins�re pour la premi�re fois
		{
			nb = 1;
		}
		else{
			nb = obj.intValue() + 1;

		}
		contexte.setAttribute("nbTotalAcces", nb);
		
		//Affichage des diff�rentes valeurs r�cup�r�es dans la vue
		String chaine = "<html><body><br>";
		chaine += "Code secret : " + codeSecret + "<br>";
		chaine += "Couleur : " + couleur + "<br>";
		chaine += "Vitesse max autoroute : " + vMaxAutoroute + "<br>";
		chaine += "URL base de donn�es : " + urlBase + "<br>";
		chaine += "Nombre total d'acces : " + nb + "<br>";
		
		chaine += "</body></html>";
		
		response.getWriter().println(chaine);
		
	}//Fin doGet


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		doGet(request, response);
	}

}
