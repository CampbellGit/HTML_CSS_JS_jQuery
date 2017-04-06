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
			
		}
			if(htmlErreur.length() > 0)
			{
				out.println("<div style='display: table; color:red; margin:auto;'><ul>"+htmlErreur+"</ul></div>");
			}
		
		
	}
	
%>
<h3>Formulaire de commande</h3>
<form>
	<label>Nom : </label>
	<input type='text' name='nomUtilisateur' placeholder='Veuillez saisir votre nom'/>
	
	<br><br>
	<label>Plat à commander : </label>
	<select name='listePlats'>
		<option value=''>Choisir une option</option>
		<option value='pizza'>Pizza</option>
		<option value='spaghetti'>Spaghetti</option>
		
	</select>
	
	<br><br>
	<label>Quantité :</label>
	<input type='text' name='quantite' placeholder='Veuillez indiquer la quantité'/>
	<br><br>
	<label>Assaisonement :</label>
	<br>
	<input type='checkbox' name='assaisonements' value='huile'/>Huile piquante
	<br>
	<input type='checkbox' name='assaisonements' value='parmesan'/>Parmesan
	<br>
	<input type='checkbox' name='assaisonements' value='olives'/>Olives
	
	<br><br>
	<label>Moyen de paiement :</label>
	<br>
	<input type='radio' name='moyPaiement' value='CB'/>Carte bancaire
	<br>	
	<input type='radio' name='moyPaiement' value='CHK'/>Chèque
	<br>	
	<input type='radio' name='moyPaiement' value='Cash'/>Espèces
	
	<br><br>
	<label>Remarques : </label>
	<textarea name='remarques' placeholder='Lâche tes comms !'></textarea>
	<br><br>
	<input type='submit' name='btnEnvoyer' value='Envoyer'/>
	<input type='reset' value='Réinitialiser'/>
	
</form>
</body>
</html>