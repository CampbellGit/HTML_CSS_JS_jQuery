<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
isErrorPage="true"
import="java.util.Date"
    pageEncoding="ISO-8859-1"%>
    
 <%-- 
 Pour que cette page soit prise en compte comme étant une page d'erreur, il faut utiliser l'attribut isErrorPage en true
  --%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Page d'erreur</title>
</head>
<body>
<h3>Page d'erreur !</h3>

<br>

<%=new Date() %>
<br>
L'erreur suivante a été rencontrée : 
<br>
<%=exception %>

</body>
</html>