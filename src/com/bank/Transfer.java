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
 * Servlet implementation class Transfer
 */
@WebServlet("/Transfer")
public class Transfer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Transfer() {
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
            PreparedStatement stmt3 = null;
            PreparedStatement stmt4 = null;
            String status="";
            String color="";
            String dtime="";
            String status1="";
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            dtime=dtf.format(now);
           
            conn=DBConnector.getConnection();
            stmt=conn.prepareStatement("select * from tbl_users where accno=? and transpin=?");
            stmt.setString(1, request.getParameter("accnof"));
            stmt.setString(2, request.getParameter("transpin"));
            stmt1=conn.prepareStatement("select * from tbl_users where accno=?");
            stmt1.setString(1, request.getParameter("accnot"));
            ResultSet rs=stmt.executeQuery();
            ResultSet rs1=stmt1.executeQuery();
            String dstpage="";
            String errmsg="";
            String tstate="";
            if(rs.next() && rs1.next()) {
            	int amt=Integer.parseInt( request.getParameter("amt"));
            	int fbal=rs.getInt(11);
            	int tbal=rs1.getInt(11);
            	
            	if(fbal-amt>=0) {
            		 System.out.println("Updating............");
            		 fbal=fbal-amt;
            		 tbal=tbal+amt;
                     stmt2=conn.prepareStatement("update tbl_users set bal=? where accno=? and transpin=?");
                     stmt2.setInt(1,fbal);
                     stmt2.setString(2, request.getParameter("accnof"));
                     stmt2.setString(3, request.getParameter("transpin"));
                     stmt2.executeUpdate();
                     stmt3=conn.prepareStatement("update tbl_users set bal=? where accno=?");
                     stmt3.setInt(1,tbal);
                     stmt3.setString(2, request.getParameter("accnot"));
                     stmt3.executeUpdate();
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
            	stmt4=conn.prepareStatement("insert into tbl_transactions values('Transfer',?,?,?,?,?)");
                stmt4.setInt(1,Integer.parseInt( request.getParameter("amt")));
                stmt4.setString(2, dtime);
                stmt4.setString(3, tstate);
                stmt4.setInt(4,fbal);
                stmt4.setString(5,request.getParameter("accnof"));
                stmt4.executeUpdate();
            	 dstpage="status.jsp";
            	 request.setAttribute("nbal",String.valueOf(fbal));
            	
            }
            else {
            	dstpage="transfer.jsp";      
            	errmsg="Invalid A/C numbers or Transaction pin";
            }
            
            request.setAttribute("status",status);
            request.setAttribute("color",color);
            request.setAttribute("dtime",dtime);
            request.setAttribute("amt",request.getParameter("amt"));
            request.setAttribute("srcpage","transfer.jsp");
            request.setAttribute("status1",status1);
            request.setAttribute("accnot",request.getParameter("accnot"));
            request.setAttribute("accnof",request.getParameter("accnof"));
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
