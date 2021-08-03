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

import com.lowagie.text.Document;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfWriter;


/**
 * Servlet implementation class Pdfgen
 */
@WebServlet("/Pdfgen")
public class Pdfgen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Pdfgen() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String str="pdf";
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		try {
			Document document =new Document();
			if(str.equals("pdf")) {
				response.setContentType("application/pdf");
				PdfWriter.getInstance(document,response.getOutputStream());
				conn=DBConnector.getConnection();
				stmt=conn.prepareStatement("select * from tbl_transactions where accno=?");
				stmt.setString(1,DBConnector.accno);
				rs=stmt.executeQuery();
				
				document.open();
				document.add(new Paragraph("---------------------------------------   BANK STATEMENT   --------------------------------------- "));
				document.add(new Paragraph("                                                                                               "));
				document.add(new Paragraph("--------------------------------------------------------------------------------------------------------------\n\n "));
				document.addCreationDate();
				
				
				document.add(new Paragraph(" Id    Transaction Type     Amount             Date-Time                 Status         AvailableBalance\n"));
				
				int i=0;
				while(rs.next()) {
					   document.add(new Paragraph("\t"+(++i)+"            "+rs.getString(1)+"             "+rs.getInt(2)+"         "+rs.getString(3)+"      "+rs.getString(4)+"            "+rs.getInt(5)+"\n"));
					}
				document.add(new Paragraph("\n\n-------------------------------------------------  PAGE NO :  "+document.getPageNumber()+"  --------------------------------------"));
				document.close();
				conn.close();
			}
			
		}
		catch(Exception de) {
			de.printStackTrace();
			System.err.println("document :"+de.getMessage());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
