package com.bank;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Logdata
 */
@WebServlet("/Logdata")
public class Logdata extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Logdata() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    String username = request.getParameter("username");
	        String password = request.getParameter("password");
	         
	        ValidateUser validuser = new ValidateUser();
	         
	        try {
	            User user = validuser.checkLogin(username, password);
	            String destPage="login.jsp";
	             
	            if (user != null) {
	                HttpSession session = request.getSession();
	                session.setAttribute("user", user);
	                destPage = "home.jsp";
	                
	            } else {
	                String message = "Invalid Credentials";
	                request.setAttribute("message", message);
	            }
	             
	            RequestDispatcher dispatcher = 
	            		request.getRequestDispatcher(destPage);
	            dispatcher.forward(request, response);
	        
	             
	        } catch (SQLException | ClassNotFoundException ex) {
	            throw new ServletException(ex);
	    }
	
	}

}
