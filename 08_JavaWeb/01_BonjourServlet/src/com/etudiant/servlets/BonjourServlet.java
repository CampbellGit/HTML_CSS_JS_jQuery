package com.etudiant.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/BonjourServlet")
public class BonjourServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public BonjourServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//Creation dynamique du code HTML qui sera envoyé au client
		String html = "<html>\n";
		html += "<head><title>Ma première page dynamique !</title></head>\n";
		html += "<body>\n";
		html += "<h3>Cette page vous a été envoyé par le serveur de Domhnall</h3>\n";
		
		Calendar dateCourante = Calendar.getInstance();
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
		
		html += "<p style='color:green;font-family:sans-serif;font-weight:bold;'>" 
				+sdf.format(dateCourante.getTime())
				+"</p>";
		
		Random rnd = new Random();
		int v;
		double racine = Math.sqrt(v = rnd.nextInt(101));
		
		html += "<br>\n";
		html += "<p style='color:magenta;font-family:Comic Sans MS;'>"
				+"v = " +v+" Racine = "+racine+
				"</p>\n";
		html += "</body></html>";
		
		//En option, préciser le type MIME du contenu qui sera envoyé
		response.setContentType("text/html");
		
		//Récupération du flux de sortie vers le client
		PrintWriter sortie = response.getWriter();
		
		sortie.println(html);
		
		//Optionellement, on peut flush (vider/fermer) la sortie
		sortie.flush();
		sortie.close();
		
		System.out.println("La servlet a envoyé le code html vers le client et l'execution continue");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
