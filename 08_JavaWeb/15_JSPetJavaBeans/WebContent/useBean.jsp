<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<!-- R�cup�ration du bean � partir du scope o� il a �t� d�pos� -->
	<jsp:useBean id="utilisateur" class="com.etudiant.modele.Utilisateur" scope="request"/>
	
	<p>Informations contenues dans le JavaBean Utilisateur<br>
	Proprit�t� ID : 
	<jsp:getProperty property="id" name="utilisateur"/><br>
	Propri�t� mot de passe :
	<jsp:getProperty property="mdp" name="utilisateur"/><br>
	Proprit�t� civilit� : 
	<jsp:getProperty property="civilite" name="utilisateur"/><br>
	</p>
</body>
</html>