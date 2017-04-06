<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<a href="index.jsp">Page 1</a>
	<br>
	<h3>Page 2</h3>
	
	
		<%--Même chose mais pour toutes les pages de l'application --%>
		<br>
		<b>Nombre d'accès de tous les utilisateurs à toutes les pages : </b>
		<%
		if (application.getAttribute("nbTotalAcces") == null){
			//La clé nbTotalAcces n'a pas encore été insérée :
				application.setAttribute("nbTotalAcces", 1);
				out.println(1);
		}
		
		else{
			int n = ((Integer)application.getAttribute("nbTotalAcces")).intValue() + 1;
			//Dépôt de la nouvelle valeur
			application.setAttribute("nbTotalAcces", n);
			out.println(n);
		}
		;
		%>
				<br>
				<b>Nombre total d'accès à toutes les pages de l'application par l'utilisateur courant : </b>
		<%
		if (session.getAttribute("nbTotalAccesUnique") == null){
			//La clé nbTotalAcces n'a pas encore été insérée :
				session.setAttribute("nbTotalAccesUnique", 1);	
				out.println(1);
		}
		
		else{
			int n = ((Integer)session.getAttribute("nbTotalAccesUnique")).intValue() + 1;
			//Dépôt de la nouvelle valeur
			session.setAttribute("nbTotalAccesUnique", n);
			out.println(n);
		}
		;%>
</body>
</html>