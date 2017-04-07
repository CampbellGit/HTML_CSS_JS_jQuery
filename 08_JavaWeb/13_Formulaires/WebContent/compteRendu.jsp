<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Recap commande</title>
</head>
<body>

	<h3>Récapitulatif de commande</h3>
	
	<br>
	Votre nom : <%= session.getAttribute("client") %>
	<br>	
	Plat commandé : <%= session.getAttribute("plat") %>
	<br>	
	Quantité commandée : <%= ((Integer)session.getAttribute("qte")).intValue() %>
	<br>	
	Assaisonements :<br>
	<%
	String[] tb = (String[])session.getAttribute("assaisonements");
	for (String item : tb)
		out.println(item + "<br>");
	
	
	
	%>
	<br>	
	Moyen de paiement : <%= session.getAttribute("paiement") %>
	<br>	
	Remarques : <%= session.getAttribute("remarques") %>	
	<br><br><br>
	<a href='index.jsp'>Retour première page</a>

</body>
</html>