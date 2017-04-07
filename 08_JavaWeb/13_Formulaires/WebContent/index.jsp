<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Formulaire commande</title>
</head>
<body>
<%
	String utilisateur = "";
	String platSaisi = "";
	String quantiteSaisie = "";
	String[] tbAssaisonements = null;
	String moyPaiement = "";
	
	String htmlErreur = "";
	String remarques = "";
	boolean isParmesan = false;
	boolean isHuile = false;
	boolean isOlives = false;
	

	
	//Est-ce que le bouton 'envoyer' a été cliqué ?
	if (request.getParameter("btnEnvoyer") != null)
	{
		utilisateur = request.getParameter("nomUtilisateur").trim();
		if (utilisateur.length() == 0)
		{
			htmlErreur += "<li>Veuillez indiquer votre nom.</li>";
		}
		platSaisi = request.getParameter("listePlats");
		if (platSaisi.length() == 0){
		htmlErreur += "<li>Veuillez choisir un plat.</li>";
		}
		int quantite = -1;
		quantiteSaisie = request.getParameter("quantite").trim();
		if (quantiteSaisie.length() == 0){
		htmlErreur += "<li>Veuillez indiquer une quantité.</li>";
		}
		else{
		
			try{
				quantite = Integer.parseInt(quantiteSaisie);			
			

			
				if(quantite < 1){
					htmlErreur += "<li>Quantité saisie trop petite.</li>";
					quantite = -1;
				}
				else if(quantite > 100){
					htmlErreur += "<li>Quantité saisie trop grande.</li>";
					quantite = -1;
				}
			}
			catch (Exception ex)
			{
				htmlErreur += "<li>Quantité saisie incorrecte.</li>";
			}
			
		} //Fin validation quantité
		
		//Récupération des assaisonements
		tbAssaisonements = request.getParameterValues("assaisonements");
		
		//Récupération du moyen de paiement
		moyPaiement = request.getParameter("moyPaiement");
		if (moyPaiement == null){
			htmlErreur += "<li>Un moyen de paiement doit être indiqué.</li>";
		}

		//Récupération des remarques
		
		remarques = request.getParameter("remarques");
		
			if(htmlErreur.length() > 0)
			{
				out.println("<div style='display: table; color:red; margin:auto;'><ul>"+htmlErreur+"</ul></div>");
			}
			else{
				//La saisie est correcte
				//Je dépose les valeurs dans la session
				session.setAttribute("client", utilisateur);
				session.setAttribute("plat", platSaisi);
				session.setAttribute("qte", quantite);
				
				session.setAttribute("assaisonements", tbAssaisonements);
				session.setAttribute("paiement", moyPaiement);
				session.setAttribute("remarques", remarques);
				
				//Envoi de l'utilisateur vers la page de compte-rendu
				response.sendRedirect("compteRendu.jsp");
			}
		
	} //Fin (request.getParameter("btnEnvoyer") != null)
	else if (request.getParameter("btnRAZ") != null)
	{
		//Rien à faire
	}
	else
	{
		//Premier affichage de la page
		if (session.getAttribute("client") != null) {
			utilisateur = (String)session.getAttribute("client");
			}
		if (session.getAttribute("plat") != null){
			platSaisi = (String)session.getAttribute("plat");
		}
		if (session.getAttribute("qte") != null){
			quantiteSaisie = "" + ((Integer)session.getAttribute("qte")).intValue();
			}
		if (session.getAttribute("assaisonements") != null)
		{
			tbAssaisonements = (String[])session.getAttribute("assaisonements");
		}
		if (session.getAttribute("moyPaiement") != null){
			moyPaiement = (String)session.getAttribute("moyPaiement");
		}
	}
		if (tbAssaisonements != null){
			for (String item : tbAssaisonements){
				if (item.equals("huile"))
					{
						isHuile = true;
					}
				else if (item.equals("parmesan"))
					{
						isParmesan = true;
					}
				else if (item.equals("olives"))
					{
						isOlives = true;
					}
			}

	}

	
%>
<h3>Formulaire de commande</h3>
<form>
	<label>Nom : </label>
	<input type='text' name='nomUtilisateur' placeholder='Veuillez saisir votre nom' value='<%= utilisateur %>'/>
	
	<br><br>
	<label>Plat à commander : </label>
	<select name='listePlats'>
		<option value=''>Choisissez une option</option>
		<option value='pizza' <%=platSaisi.equals("pizza") ? "selected" : "" %>>Pizza</option>
		<option value='spaghetti' <%=platSaisi.equals("spaghetti") ? "selected" : "" %>>Spaghetti</option>
		
	</select>
	
	<br><br>
	<label>Quantité :</label>
	<input type='text' name='quantite' value='<%= quantiteSaisie %>' placeholder='Veuillez indiquer la quantité'/>
	<br><br>
	<label>Assaisonement :</label>
	<br>
	<input type='checkbox' name='assaisonements' value='huile' <%=isHuile ? "checked" : "" %>/>Huile piquante
	<br>
	<input type='checkbox' name='assaisonements' value='parmesan' <%=isParmesan ? "checked" : "" %>/>Parmesan
	<br>
	<input type='checkbox' name='assaisonements' value='olives' <%=isOlives ? "checked" : "" %>/>Olives
	
	<br><br>
	<label>Moyen de paiement :</label>
	<br>
	<input type='radio' name='moyPaiement' value='CB'<%= moyPaiement.equals("CB") ? "checked" : "" %>/>Carte bancaire
	<br>	
	<input type='radio' name='moyPaiement' value='CHK'<%= moyPaiement.equals("CHK") ? "checked" : "" %>/>Chèque
	<br>	
	<input type='radio' name='moyPaiement' value='Cash'<%= moyPaiement.equals("Cash") ? "checked" : "" %>/>Espèces
	
	<br><br>
	<label>Remarques : </label>
	<textarea name='remarques' placeholder='Lâche tes comms !'></textarea>
	<br><br>
	<input type='submit' name='btnEnvoyer' value='Envoyer'/>
	<input type='reset' name='btnRAZ' value='Réinitialiser'/>
	
</form>
</body>
</html>