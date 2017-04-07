<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Set Bean</title>
</head>
<body>

	<!-- 
	- Si le nombre de champs du formulaire est �gal au nombre de propri�t�s du javaBean
	- Si les noms des champs du formulaire sont les m�mes que les noms des propri�t�s du JavaBean, on peut utiliser une liaison (binding)
	plus concise.
	 -->
	<jsp:useBean id="utilisateur" class="com.etudiant.modele.Utilisateur" scope="request"/>
	
	<!-- Le binding special utilisable dans ce cas, le caract�re * pr�cise que toutes les propri�t�s du bean sont li�es au champ du m�me nom du formulaire -->
	<jsp:setProperty property="*" name="utilisateur"/>
	
	
	
	<!-- Envoi des donn�es vers la page useBean.jsp -->
	<jsp:forward page="useBean.jsp"/>
</body>
</html>