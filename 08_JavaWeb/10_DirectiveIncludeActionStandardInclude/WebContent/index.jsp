<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Directive Include - Entrée</title>
</head>
<body>

	<!-- Inclusion d'un fichier entete.jsp en utilisant une directive qui définit un header -->
	<%@ include file="entete.jsp" %>
	
	<table style='width:98%;'>
		<tr>
			<td width='150'>
				<%@ include file="barreNavigation.jsp" %>
			</td>
			<td>
				<h1>Ceci est le contenu de ma page d'accueil</h1>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum pellentesque cursus urna, quis tincidunt purus varius ut. Etiam rutrum ligula eu turpis volutpat bibendum. Donec posuere mauris nec pharetra porta.</p>
			</td>		
		</tr>
	
	
	</table>
	
	
	<!-- Integration d'un pied de page en utilisant non pas include mais l'action standard include -->
	<jsp:include page="pieddepage.jsp"/>
</body>
</html>