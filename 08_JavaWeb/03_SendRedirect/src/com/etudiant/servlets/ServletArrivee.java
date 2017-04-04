package com.etudiant.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletArrivee
 */
@WebServlet("/collectionservlets/pagearrivee.do")
public class ServletArrivee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServletArrivee() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		response.getWriter().println(
				/*
				"<html><body><h2>Servlet arrivée</h2>"
				+ "<a href='/03_SendRedirect/pagestart.do'>Page 1</a>"

				+ "</body></html>")
				;
				*/
				"<html><body><h2>Servlet arrivée</h2>"
				+ "<form action='/03_SendRedirect/pagestart.do' method='post'><input type='submit' value='Page 1'/></form>"
				+ "</body></html>"
				);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
