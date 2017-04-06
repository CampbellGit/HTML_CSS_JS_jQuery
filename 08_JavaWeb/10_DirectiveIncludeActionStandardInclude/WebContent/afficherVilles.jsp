<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style>
	.cellule
	{
		padding: 3px 10px;
	}

</style>
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
				<h1>Liste des villes</h1>
				<table>
					<tr>
						<td class="cellule">ID</td>
						<td class="cellule">Ville</td>
						<td class="cellule">Population</td>	
						<td colspan="3">&nbsp;</td>																	
					</tr>
					
					<tr>
						<td class="cellule">100</td>
						<td class="cellule">Morlaix</td>
						<td class="cellule">300 000</td>	
						<td class="cellule"><a href="afficherDetails.jsp?id=100">détails</a></td>
						<td class="cellule"><a href="modifier.jsp?id=100">modifier</a></td>
						<td class="cellule"><a href="supprimer.jsp?id=100">supprimer</a></td>																	
					</tr>
					
					<tr>
						<td class="cellule">110</td>
						<td class="cellule">Lamballe</td>
						<td class="cellule">50 000</td>	
						<td class="cellule"><a href="afficherDetails.jsp?id=110">détails</a></td>
						<td class="cellule"><a href="modifier.jsp?id=110">modifier</a></td>
						<td class="cellule"><a href="supprimer.jsp?id=110">supprimer</a></td>																	
					</tr>
				</table>
				
			</td>		
		</tr>
	
	
	</table>
	<!-- Exercice 26
			Créer le contenu de cette page dynamiquement en utilisant jdbc et la base SQL world
	
	
	 -->
	
	<!-- Integration d'un pied de page en utilisant non pas include mais l'action standard include -->
	<jsp:include page="pieddepage.jsp"/>
</body>
</html>