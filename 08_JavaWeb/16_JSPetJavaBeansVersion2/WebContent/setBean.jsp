<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Set Bean</title>
</head>
<body>

	<!-- Utilisation d'un java bean pour stocker les données saisies
	L'action standard jsp:useBean est utilisée
	Cette balise va créer le bean s'il n'existe pas encore dans le scope (le conteneur) précisé (ici, le scope précisé est 'request')
	 -->
	<jsp:useBean id="utilisateur" class="com.etudiant.modele.Utilisateur" scope="request"/>
	
	<%-- Dans le projet précédent, la récupération de chaque paramètre de l'objet a été utilisée explicitement pour l'inection dans le javaBean :
	value='<%=request.getParameter("idSaisie") %>
	
	Une autre solution est possible : je peux "lier" une propriété du JavaBean à un paramètre de l'objet request  
	--%>
	<jsp:setProperty property="id" name="utilisateur" param="idSaisie"/>
	<jsp:setProperty property="mdp" name="utilisateur" param="mdpSaisie"/>
	<jsp:setProperty property="civilite" name="utilisateur" param="civiliteSaisie"/>
	
	<!-- Envoi des données vers la page useBean.jsp -->
	<jsp:forward page="useBean.jsp"/>
</body>
</html>