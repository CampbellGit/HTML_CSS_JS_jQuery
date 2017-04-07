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
	- Si le nombre de champs du formulaire est égal au nombre de propriétés du javaBean
	- Si les noms des champs du formulaire sont les mêmes que les noms des propriétés du JavaBean, on peut utiliser une liaison (binding)
	plus concise.
	 -->
	<jsp:useBean id="utilisateur" class="com.etudiant.modele.Utilisateur" scope="request"/>
	
	<!-- Le binding special utilisable dans ce cas, le caractère * précise que toutes les propriétés du bean sont liées au champ du même nom du formulaire -->
	<jsp:setProperty property="*" name="utilisateur"/>
	
	
	
	<!-- Envoi des données vers la page useBean.jsp -->
	<jsp:forward page="useBean.jsp"/>
</body>
</html>