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
	
	<!-- Stockage des données saisies (récupérées à partir du request) dans le bean 'utilisateur'
	Pour cela, j'utilise les propriétés du bean
	-->
	<jsp:setProperty property="id" name="utilisateur" value='<%=request.getParameter("idSaisie") %>'/>
	<jsp:setProperty property="mdp" name="utilisateur" value='<%=request.getParameter("mdpSaisie") %>'/>
	<jsp:setProperty property="civilite" name="utilisateur" value='<%=request.getParameter("civiliteSaisie") %>'/>
	
	<!-- Envoi des données vers la page useBean.jsp -->
	<jsp:forward page="useBean.jsp"/>
</body>
</html>