<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inscription</title>
</head>
<body>
	<form method="post" action="setBean.jsp">
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
			<td>Civilité : </td>
			<td>
			<select name='civiliteSaisie' style="width:255px;">
			<option value='M.'>Monsieur</option>
			<option value='Mme'>Madame</option>
			<option value='Autre'>Autre</option>
			</select>
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