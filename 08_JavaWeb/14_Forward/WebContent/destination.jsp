<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Destination forward JSP</title>
</head>
<body>

<%
	//r�cup�ration du param�tre d�fini par le formulaire
	String couleur = request.getParameter("txtCouleur");

	//R�cup�ration des param�tres suppl�mentaires inject�s lors du transfert
	String utilisateur = request.getParameter("utilisateur");
	String motDePasse = request.getParameter("motDePasse");
%>

</body>
<p>Utilisateur : <%=utilisateur %></p>
<p>Mot de passe : <%=motDePasse %></p>
<p>Couleur pr�f�r�e : <%=couleur %></p>

</html>