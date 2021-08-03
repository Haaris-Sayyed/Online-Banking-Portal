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
 * Servlet implementation class Withdraw
 */
@WebServlet("/Withdraw")
public class Withdraw extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Withdraw() {
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
            String status="";
            String color="";
            String dtime="";
            String status1="";
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            dtime=dtf.format(now);
           
            conn=DBConnector.getConnection();
            stmt=conn.prepareStatement("select * from tbl_users where accno=? and transpin=?");
            stmt.setString(1, request.getParameter("accno"));
            stmt.setString(2, request.getParameter("transpin"));
            ResultSet rs=stmt.executeQuery();
            String dstpage="";
            String errmsg="";
            String tstate="";
           
            if(rs.next()) {
            	int amt=Integer.parseInt( request.getParameter("amt"));
            	int bal=rs.getInt(11);
            	
            	if(bal-amt>=0) {
            		 System.out.println("Updating............");
            		 bal=bal-amt;
                     stmt1=conn.prepareStatement("update tbl_users set bal=? where accno=? and transpin=?");
                     stmt1.setInt(1,bal);
                     stmt1.setString(2, request.getParameter("accno"));
                     stmt1.setString(3, request.getParameter("transpin"));
                     stmt1.executeUpdate();
                     status="TRANSACTION SUCCESSFUL";
                     tstate="SUCCESS";
                     color="green";
                     status1="true";
                     
            	}
            	else {
            		 status="TRANSACTION FAILED";
            		 tstate="FAILED";
                 	 color="red";
                 	 status1="false";
            	}
            	
            	stmt2=conn.prepareStatement("insert into tbl_transactions values('Withdraw',?,?,?,?,?)");
                stmt2.setInt(1,Integer.parseInt( request.getParameter("amt")));
                stmt2.setString(2, dtime);
                stmt2.setString(3, tstate);
                stmt2.setInt(4,bal);
                stmt2.setString(5,request.getParameter("accno"));
                stmt2.executeUpdate();
            	dstpage="status.jsp";
            	request.setAttribute("nbal",String.valueOf(bal));
            	
            }
            else {
            	dstpage="withdraw.jsp";
            	errmsg="Invalid A/C No. or Transaction pin";
            }
            
            request.setAttribute("status",status);
            request.setAttribute("color",color);
            request.setAttribute("dtime",dtime);
            request.setAttribute("amt",request.getParameter("amt"));
            request.setAttribute("srcpage","withdraw.jsp");
            request.setAttribute("status1",status1);
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
