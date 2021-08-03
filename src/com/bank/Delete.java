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
 * Servlet implementation class Delete
 */
@WebServlet("/Delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete() {
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
try {
		    
            Connection conn = null;
            PreparedStatement stmt = null;
            PreparedStatement stmt1 = null;
            PreparedStatement stmt2 = null;
            String dtime="";
            String dstpage="";
            String errmsg="";
            conn=DBConnector.getConnection();
            stmt=conn.prepareStatement("select * from tbl_users where accno=? and transpin=?");
            stmt.setString(1, request.getParameter("accno"));
            stmt.setString(2, request.getParameter("transpin"));
            ResultSet rs=stmt.executeQuery();
            if(rs.next()) {
            	 
                 stmt1=conn.prepareStatement("delete from tbl_users where accno=? and transpin=?");
                 stmt1.setString(1,request.getParameter("accno"));
                 stmt1.setString(2,request.getParameter("transpin"));
                 stmt1.executeUpdate();
                 stmt2=conn.prepareStatement("delete from tbl_transactions where accno=?");
                 stmt2.setString(1,request.getParameter("accno"));
                 stmt2.executeUpdate();
                 dstpage="dstatus.jsp";
                 
            }
            else {
            	 dstpage="delete.jsp";
            	 errmsg="Account does not Exist";
            }
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            dtime=dtf.format(now);
            request.setAttribute("dtime",dtime);
            request.setAttribute("accno",request.getParameter("accno"));
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
