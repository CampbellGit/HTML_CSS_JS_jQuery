package com.etudiant.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/ServletFormulaire")
public class ServletFormulaire extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServletFormulaire() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost( request,  response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// La session est un conteneur associatif qui est spécifique pour chaque
		// utilisateur
		// (il est partagé par toutes les pages de l'application accèdées par le
		// même utilisateur
		// Utilisateur = navigateur
		// La session a un temps de vie limité en fonction de l'activité de
		// l'utilisateur
		// Si l'utilisateur ne se manifeste pas après un certain intervalle de
		// temps (30 ou 60 minutes)
		// sa session est détruite
		// Cet intervalle d'inactivité peut être modifié par l'application
		// Une session peut aussi être détruite explicitement. Une nouvelle
		// session sera créée automatiquement lors de la prochaine requete vers
		// le serveur

		HttpSession session = request.getSession();
		String messageErreur = "";
		String utilisateur = "";
		String civilite = "";

		// ...
		// Je veux récupérer les données saisies s'il ne s'agit pas d'un premier
		// affichage de la page
		// je récupère la saisie si le bouton btnEnvoyer a été cliqué
		// Je teste a présence de la clé btnEnvoyer dans le conteneur/objet
		// request

		if (request.getParameter("btnEnvoyer") != null) {

			// System.out.println("Reaffichage de la page");
			// Le formulaire a été submit, je peux récupérer la saisie
			utilisateur = request.getParameter("utilisateur");
			// Analyse de la conformité de la saisie du nom de l'utilisateur
			// avec le cahier des charges de l'application
			if (utilisateur.length() <= 2 || utilisateur.length() >= 20)
				messageErreur += "<li>Le nom doit contenir entre 2 et 20 caractères</li>";
			if (utilisateur.toLowerCase().contains("sex") || utilisateur.toLowerCase().contains("drogue")
					|| utilisateur.toLowerCase().contains("delete"))
				messageErreur += "<li>Nom incorrect</li>";

				// Le nom est valide, on le dépose dans la séssion
				if (messageErreur.length()==0)
				session.setAttribute("user", utilisateur);

			// Récupération de la civilité de l'utilisateur

			civilite = request.getParameter("civilite");

			if (civilite.equals("*")) {
				messageErreur += "<li>Aucune civilité n'a été sélectionnée</li>";
			} else
				session.setAttribute("civilite", civilite);

			response.sendRedirect("/07_Session/compterendu.do");
			return;
			
		}//Si la page est réaffichée
		/*
		 * else{
		 * System.out.println("Affichage de la page pour la premiere fois"); }
		 */
		
		
		else if (request.getParameter("btnSupprimerSession") != null)
		{
			//La suppréssion de la session a été demandée
			session.invalidate();
			
			//Attention, après l'appel de cette méthode, la session n'existe plus
			//donc je ne peux pas utiliser des instructions comme session.getAttribute("user") ou setAtribute etc.
			
			//Une nouvelle session sera créée quand une nouvelle requete sera envoyée par le client
			response.sendRedirect("/07_Session/compterendu.do");
			return;
		}
		else if (request.getParameter("btn10SecInactivite") != null)
		{
			//Definition de l'inactivite maximale à dix secondes
			session.setMaxInactiveInterval(10);

			response.sendRedirect("/07_Session/compterendu.do");
			return;
		}
		
		else // il s'agit du premier passage
		{
			// j'essaie de récupérer les données nécéssaires à partir de la
			// session
			if (session.getAttribute("user") != null)
				utilisateur = (String) session.getAttribute("user");

			if (session.getAttribute("civilite") != null)
				civilite = (String) session.getAttribute("civilite");

		}
		
		
		String html = "<html><body><h3>Etude session</h3>\n";
		
		// si la validation n'a pas réussie, affichage du message d'érreur
		if (messageErreur != null)
		{
			html += "<div style='color: red; font-family: sans-serif; font-weight: bold; font-size:12px; '>"
					+ "<ul>"
					+messageErreur+ "</ul></div>\n";
			
		}
		html += "<form method='post'>\n";
		
		html += "<label>Utilisateur</label>\n";
		html += "<input type='text' name='utilisateur' value='"
				+utilisateur+"'/><br>\n";
		
		html += "<label>Civilité</label>\n";
		
		html += "<select name='civilite'>\n";
		
			html += "<option value='*'>Selectionnez une civilité</option>\n";
			html += "<option value='M' "
					+(civilite.equals("M") ? "selected" :"")+">Monsieur</option>\n";
			html += "<option value='Mme' "
					+(civilite.equals("Mme") ? "selected" :"")+">Madame</option>\n";
			html += "<option value='Autre' "
					+(civilite.equals("Autre") ? "selected" :"")+">Autre</option>\n";
		
		html += "</select><br><br>\n";
		html += "<input type='submit' name='btnEnvoyer' value='envoyer'/>\n";
		html += "<input type='submit' name='btnSupprimerSession' value='Supprimer session'/>\n";
		html += "<input type='submit' name='btn10SecInactivite' value='Definir inactivite max a 10 secondes'/>\n";
		
		
		html += "</form>\n";
		
		html += "<br><br>La session est nouvelle : " + (session.isNew()? "OUI" : "NON");
		
		
		html += "</body></html>\n";
		response.getWriter().println(html);

	}//Fin doPost

}
