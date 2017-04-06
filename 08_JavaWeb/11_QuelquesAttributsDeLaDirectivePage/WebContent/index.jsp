<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
import="java.util.*, java.text.*"
errorPage="maPageErreur.jsp"
    pageEncoding="ISO-8859-1"%>
    
    <%--
    L'attribut 'import' permet d'utiliser des classes qui se trouvent dans les packages précisés
    L'attribut errorPage permet de définir une page d'erreur qui sera automatiquement affichée si une execption est rencontrée sur la page courante.
    L'exeption rencontrée est transferée vers la page d'erreur (qui peut l'analyser)
    
     --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	//récupération et affichage de la date courante
	GregorianCalendar date = new GregorianCalendar();
	SimpleDateFormat sdf = new SimpleDateFormat("dd:MM:yyyy hh:mm:ss");
	String dateTxt = sdf.format(date.getTime());
	

%>

	<p>La date courante est : <b><jsp:expression>dateTxt</jsp:expression></b></p>
	
	<p>1.4 - 1.3 = <jsp:expression>1.4 - 1.3</jsp:expression> </p>
	<p>4 / 0 = <jsp:expression> 4 / 0</jsp:expression> </p>


</body>
</html>