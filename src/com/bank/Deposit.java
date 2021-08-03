package com.bank;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Deposit
 */
@WebServlet("/Deposit")
public class Deposit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Deposit() {
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
	 * @throws IOException 
	 * @throws ServletException 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		    
            Connection conn = null;
            PreparedStatement stmt = null;
            PreparedStatement stmt1 = null;
            PreparedStatement stmt2 = null;
            String status="";
            String color="";
            String dtime="";
            String dstpage="";
            String errmsg="";
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            dtime=dtf.format(now);
            conn=DBConnector.getConnection();
            stmt=conn.prepareStatement("select * from tbl_users where accno=? and transpin=?");
            stmt.setString(1, request.getParameter("accno"));
            stmt.setString(2, request.getParameter("transpin"));
            ResultSet rs=stmt.executeQuery();
            if(rs.next()) {
            	 
            	 System.out.println("Updating............");
            	int bal=rs.getInt(11)+Integer.parseInt( request.getParameter("amt"));
            	 
                 stmt1=conn.prepareStatement("update tbl_users set bal=? where accno=? and transpin=?");
                 stmt1.setInt(1,bal);
                 stmt1.setString(2,request.getParameter("accno"));
                 stmt1.setString(3,request.getParameter("transpin"));
                 stmt1.executeUpdate();
                 status="TRANSACTION SUCCESSFUL ";
                 color="green";
                 dstpage="status.jsp";
                
                 request.setAttribute("nbal",String.valueOf(bal));
                 stmt2=conn.prepareStatement("insert into tbl_transactions values('Deposit',?,?,'SUCCESS',?,?)");
                 stmt2.setInt(1,Integer.parseInt( request.getParameter("amt")));
                 stmt2.setString(2, dtime);
                 stmt2.setInt(3,bal);
                 stmt2.setString(4,request.getParameter("accno"));
                 stmt2.executeUpdate();
            }
            else {
            	 dstpage="deposit.jsp";
            	 errmsg="Invalid A/C No. or Transaction pin";
            }
           
            request.setAttribute("status",status);
            request.setAttribute("color",color);
            request.setAttribute("dtime",dtime);
            request.setAttribute("amt",request.getParameter("amt"));
            request.setAttribute("srcpage","deposit.jsp");
            request.setAttribute("message",errmsg);
            RequestDispatcher dispatcher = request.getRequestDispatcher(dstpage);
            dispatcher.forward(request, response);
	}
    catch(Exception e)
	    {
    	  System.out.println(".....Wrong.....");
	  	  e.printStackTrace();
	  	
	    }
		
	}
}
