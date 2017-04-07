<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inscription</title>
</head>
<body>

<%--

Le formulaire suivant n'a pas les mêmes noms des champs que les
noms des propriétés du javabean (attendus par la page setBean.jsp où on utilise 
property="*"

Afin d'accorder le formulaire avec les propriétés du JavaBean, je dois utiliser un adaptateur

 --%>
	<form method="post" action="adaptateur.do">
		<table style="width:600px; border: 1px solid magenta; padding: 10px 20px; margin: auto; margin-top: 50px;">
		<tr>
			<td>Utilisateur : </td>
			<td>
			<input type='text' name='idSaisie' style="width:250px;" placeholder='Veuillez indiquer votre identifiant' />
			</td>
		</tr>
		<tr>
			<td>Mot de passe : </td>
			<td>
			<input type='text' name='mdpSaisie' style="width:250px;" placeholder='Veuillez indiquer votre mot de passe' />
			</td>
		</tr>
		
		<tr>
			<td>No Téléphone : </td>
			<td>
			<input type='text' name='telSaisie' style="width:250px;" placeholder='Veuillez indiquer votre 06' />
			</td>
		</tr>
		
		<tr>
			<td>E-mail : </td>
			<td>
			<input type='email' name='emailSaisie' style="width:250px;" placeholder='Veuillez indiquer votre e-mail' />
			</td>
		</tr>
		
		<tr>
			<td colspan='2' align='center'>
			<input type="submit" value="Se connecter" style="width:130px;"/>
			</td>
		</tr>
		</table>
	</form>

</body>
</html>