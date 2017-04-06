<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%-- Commentaire JSP
    Java Server Pages
    
    Elements d'une page JSP :
    -Du code HTML
    -Directives
    	Une directive est une instruction non-executable qui contient des informations
    	Format : <%@ typeDirective (page ici) ... %>
    	Types de directives 
    		directive page
    				  include
    				  tag library
    				  
    -Scriplets
    	Blocs de code Java qui assurent des traitements
    	Format : <% ... %>
    	
    -Scriplets de declaration
    	Contiennent des déclarations de variables et des methodes "globales" 
    	Format : <%! ... %>
    	
    -Scriplets d'expression
    	Rôle : sortir dans le code HTML la valeur d'une expression, d'un appel de methode, d'une variable, etc. (une sorte de println)
    	format : <%= ... %>
    	
    -Objets implicites prédéfinis (fournis automatiquement par la page)
    	Objets implicites :
    		-request
    		-response
    		-session
    		-application
    		-config
    		-pageContext
    		-page
    		-out (equivalent de response.getWriter())
    		
    -Une page JSP peut contenir des actions standard
    	Une action standard est une balise ayant un nom prédéfini
    	Exemple :
    		 <jsp:include ... >
    		 <jsp:forward ... >
    		 <jsp:useBean ... >
    		 <jsp:setPrperty ... >
    		 <jsp:getProperty ... >
    		 
    		 
    -Une page JSP peut avoir des EL (expressions de langage)
     	Une EL a la forme
     	${ ... }
     	
     	
    -Une page JSP peut contenir des balises en provenance de bibliotheques externes
    	Elles doivent utiliser un prefixe lié à la bibliotheque :
    	<%@ nomBibliotheque prefixe = "nomPrefixe" url="lien etc." %>
    	On peut ensuite utiliser les balises de cette bibliotheque externe comme suit :
    	<nomPrefixe:nomBalise> ... </nomPrefixe:nomBalise>
    		 
    		
    	
    
     --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		//scriplet
		int compteur;
		for  (compteur = 1; compteur <= 6; compteur++){
			
		
	%>

	<h<%=compteur %>>Bonjour JSP (<%=chaine %>)</h<%=compteur %>>
	2 * <%=compteur %> = <%= 2 * compteur %>
	<br>
	<span style='color:<%=tbCouleurs[compteur-1] %>;'>2 * compteur = <%=multiplier(2, compteur) %></span>
	
	<%
		}
	%>
	
	<%!
		//Scriplet de déclaration
		String chaine = "Java Server Pages";
		String[] tbCouleurs = {"red", "blue", "orange", "green", "magenta", "teal"};
		
		float multiplier (float a, float b){
			return a * b;
		}
	
	%>


</body>
</html>