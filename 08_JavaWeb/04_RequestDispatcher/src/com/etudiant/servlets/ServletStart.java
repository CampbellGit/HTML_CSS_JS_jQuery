package com.etudiant.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/pagestart.do")
public class ServletStart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServletStart() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.getWriter().println("<html><body><h2>Servlet start (" +
				getServletName()
				+")</h2></body></html>");
		
		//Redirection du client vers une autre servlet
		RequestDispatcher dispatcher = request.getRequestDispatcher("/collectionservlets/pagearrivee.do");
		dispatcher.forward(request, response);
		
		System.out.println("L'execution de la servlet start continue après forward");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		response.getWriter().println(
				
				"<html><body><h2>Servlet arrivée</h2>"
				+ "<a href='/04_RequestDispatcher/collectionservlets/pagearrivee.do'>Page 2</a>"

				+ "</body></html>")
				;
	}

}
