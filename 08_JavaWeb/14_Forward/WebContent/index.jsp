<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JSP Forward</title>
</head>
<body>
	<h3>Action standard forward</h3>
	
	<%
		//Je veux envoyer l'utilisateur sur une page si le bouton submit a été cliqué
		if (request.getParameter("btnSubmit") != null)
		{		
	%>
	
		<!-- 
	Cette action standard jsp:forward est l'équivalent de l'instruction suivante utilisée pour les servlet
	request.getRequestDispatcher().forward("destination.jsp");
	Je peux ajouter des paramètres supplémentaires qui seront transmis par l'objet request
	 -->
	
	<jsp:forward page="destination.jsp">

		<jsp:param value="Pierre" name="utilisateur"/>
		<jsp:param value="caillou" name="motDePasse"/>
	</jsp:forward>
	
	<%
	}
	%>
	<form>
	Couleur préférée :
	<input type="text" name="txtCouleur" />
		<input type="submit" value="Envoyer" name="btnSubmit"/>
		
	</form>

</body>
</html>