<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Set Bean</title>
</head>
<body>

	<!-- Utilisation d'un java bean pour stocker les donn�es saisies
	L'action standard jsp:useBean est utilis�e
	Cette balise va cr�er le bean s'il n'existe pas encore dans le scope (le conteneur) pr�cis� (ici, le scope pr�cis� est 'request')
	 -->
	<jsp:useBean id="utilisateur" class="com.etudiant.modele.Utilisateur" scope="request"/>
	
	<%-- Dans le projet pr�c�dent, la r�cup�ration de chaque param�tre de l'objet a �t� utilis�e explicitement pour l'inection dans le javaBean :
	value='<%=request.getParameter("idSaisie") %>
	
	Une autre solution est possible : je peux "lier" une propri�t� du JavaBean � un param�tre de l'objet request  
	--%>
	<jsp:setProperty property="id" name="utilisateur" param="idSaisie"/>
	<jsp:setProperty property="mdp" name="utilisateur" param="mdpSaisie"/>
	<jsp:setProperty property="civilite" name="utilisateur" param="civiliteSaisie"/>
	
	<!-- Envoi des donn�es vers la page useBean.jsp -->
	<jsp:forward page="useBean.jsp"/>
</body>
</html>