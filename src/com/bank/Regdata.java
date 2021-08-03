package com.bank;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class Regdata
 */
@WebServlet("/Regdata")
public class Regdata extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Regdata() {
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
		try {
	    
            Connection conn = null;
            PreparedStatement stmt = null;
            PreparedStatement stmt1 = null;
    
           conn=DBConnector.getConnection();
           String accno="";
           stmt1=conn.prepareStatement("SELECT * FROM tbl_users ORDER BY accno DESC LIMIT 1");
           ResultSet rs=stmt1.executeQuery();
           if(rs.next()) {
        	   //accno="222100";
        	   accno=String.valueOf(Integer.parseInt(rs.getString(10))+1);
           }else {
        	   accno="222100";
           }
                     
           System.out.println("Inserting records into the table...");
           
           stmt = conn.prepareStatement("insert into tbl_users values(?,?,?,?,?,?,?,?,?,?,0)");
           stmt.setString(1, request.getParameter("name"));
           stmt.setString(2, request.getParameter("email"));
           stmt.setString(3, request.getParameter("address"));
           stmt.setString(4,request.getParameter("dob"));
           stmt.setString(5,request.getParameter("username"));
           stmt.setString(6,request.getParameter("transpin"));
           stmt.setString(7,request.getParameter("mno"));
           stmt.setString(8,request.getParameter("brname"));
           stmt.setString(9,request.getParameter("password"));
           stmt.setString(10,accno);
                   
      
           stmt.executeUpdate();
           System.out.println("Inserted records into the table...");
           request.getRequestDispatcher("accstatus.jsp").forward(request, response);
          
	    	
	   }
	    catch(Exception e)
	    {
	      System.out.println("Something went wrong............");
	      e.printStackTrace();
	  
	    }
	}
}


