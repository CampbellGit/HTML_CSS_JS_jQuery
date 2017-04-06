<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
import="java.util.*, java.io.*, java.text.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Conteneurs</title>
</head>
<body>
	<a href="autrePage.jsp">Page 2</a>
	<br>
	<h3>Etude des conteneurs les plus importants</h3>
	
	<br>
	<label>Param�tres envoy�s � la page : </label><br>
	<%=recupererParametres(pageContext)%>
	
	<br>
	<b>Informations diverses extraites � partir des objets pr�d�finis 'application' et 'request'</b>
	
	<br>
	<font face="Comic Sans MS" size='2'>
		<b>URL de la page : </b>
		<%=request.getServletPath() %>
		
		<br>
		<b>Repertoire racine du serveur : </b>
		<%=application.getRealPath("/") %>
		
		<br>
		<b>Nom complet de la page : </b>
		<%=application.getRealPath(request.getServletPath()) %>
		<br>
		<!-- R�cup�ration de la date de la derni�re modification de la page -->
		<%
			String nomFichier = application.getRealPath(request.getServletPath());
			File file = new File(nomFichier);
			Date derniereModification = new Date(file.lastModified());
			SimpleDateFormat sdf = new SimpleDateFormat("dd:MM:yyyy");
			out.println("<b>Date de la derni�re modification de la page : </b>"+sdf.format(derniereModification));
		%>
		<br>
		<b>Cette page vous a �t� envoy�e par : </b>
		<%=request.getServerName() %>
		
		<br>
		<b>Port du serveur : </b>
		<%=request.getServerPort() %>
		
		<br>
		<b>Nom de l'application serveur : </b>
		<%=application.getServerInfo() %>
		
		<br>
		<b>Protocole utiliser</b>
		<%=request.getProtocol() %>		
		
		<br>
		<b>Utilisateur :</b>
		<%= request.getRemoteUser() %>
		
		<br>
		<b>IP du client :</b>
		<%= request.getRemoteAddr() %>
		
		<br>
		<b>Nom de l'ordinateur du client :</b>
		<%= request.getRemoteHost() %>
		
		<br>
		<b>Port du client :</b>
		<%= request.getRemotePort() %>
		
		<br>
		<b>Locale du client :</b>
		<%= request.getLocale() %>
		
		<br>
		<b>Navigateur utilis� :</b>
		<%= request.getHeader("USER-AGENT") %>
		
		<%-- Affichage du nombre total d'acc�s, de tous les utilisateurs, � cette page --%>
		<br>
		<b>Nombre d'acc�s � cette page par tous les utilisateurs : </b>
		<%= ++nbAccesTousUtilisateurs%>
		
		<%--M�me chose mais pour toutes les pages de l'application --%>
		<br>
		<b>Nombre d'acc�s de tous les utilisateurs � toutes les pages : </b>
		<%
		if (application.getAttribute("nbTotalAcces") == null){
			//La cl� nbTotalAcces n'a pas encore �t� ins�r�e :
				application.setAttribute("nbTotalAcces", 1);	
				out.println(1);
		}
		
		else{
			int n = ((Integer)application.getAttribute("nbTotalAcces")).intValue() + 1;
			//D�p�t de la nouvelle valeur
			application.setAttribute("nbTotalAcces", n);
			out.println(n);
		}
		;
		%>
		
		<br>
		<b>Nombre total d'acc�s � toutes les pages de l'application par l'utilisateur courant : </b>
		<%
		if (session.getAttribute("nbTotalAccesUnique") == null){
			//La cl� nbTotalAcces n'a pas encore �t� ins�r�e :
				session.setAttribute("nbTotalAccesUnique", 1);	
				out.println(1);
		}
		
		else{
			int n = ((Integer)session.getAttribute("nbTotalAccesUnique")).intValue() + 1;
			//D�p�t de la nouvelle valeur
			session.setAttribute("nbTotalAccesUnique", n);
			out.println(n);
		}
		;
		%>
		
	</font>
	
</body>
</html>

<%!

private static int nbAccesTousUtilisateurs = 0;
//private - permet � cette variable d'�tre acc�ssible seulement � partir de cette page

String recupererParametres(PageContext pageContext){
	//Cette m�thode doit r�cuperer les valeurs des parametres envoy�s par le client
	//Ces parametres sont contenus dans l'objet pr�d�fini 'request'
	
	//Je dois donc r�cup�rer l'objet 'request' � partir du conteneur englobant tous les autres : pageContext
	//Ce pageContext a �t� pass� en parametre (sinon on ne peut pas l'avoir dans une scriptlet de declaration)
	
	ServletRequest request = pageContext.getRequest();

	String txt = "";

	Enumeration<String> cles = request.getParameterNames();
	String clef, valeur;
	
	while(cles.hasMoreElements())
	{
		//R�cup�ration de la cl� courante
		clef = cles.nextElement();
		
		//R�cup�ration de la valeur attach�e � la cl� courante
		valeur = request.getParameter(clef);
		
		//Ajout de la cl� et de la valeur attach�es � la chaine � retourner
		txt += clef + " : " + valeur + "<br>";
	}

	return txt;
}

%>