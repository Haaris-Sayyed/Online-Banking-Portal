<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Banking-Portal/Transaction History</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans&display=swap" rel="stylesheet">

    <style>
        * {
            box-sizing: border-box;
            font-family: 'Noto Sans', sans-serif;

        }

        body {

             background: url(images/gradient.png);

        }

        .container {
            background-color: white;
            border: 0.5px solid black;
            margin: 20px auto;
            width: 1215px;
            height: 580px;
            border-radius: 20px;

        }


        .avator {
            height: 40px;
            width: 40px;
        }

        .container h1 {
            margin-left: 12px;
        }

        .navbar {
            background-color: black;
            padding: 0px;
        }

        .navbar ul {
            overflow: auto;
            margin: -6px;
        }

        .navbar li {
            float: left;
            list-style: none;
            margin: 13px 20px;
        }

        .navbar li a {
            padding: 3px 3px;
            text-decoration: none;
            color: white;
            font-size: 19px;
        }

        #active {
            color: chartreuse;
        }



        .navbar li a:hover,
        #active:hover {
            color: red;
        }

        .transactions {

            height: 375px;
            width: 1192px;
            border: 1px solid black;
            /*position: absolute;
            right: 90px;
            top: 195px;*/
            margin: 2px 10px;
            overflow: scroll;
            padding: 5px 10px;  /* 5px 25px */

        }

        table {

            border-collapse: collapse;
            width: 100%;
        }

        td,
        th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color:#9B59B6;         
            color: white;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }

        caption h2 {
            margin: 5px 0px;
        }

        .container input,
        p {

            margin-left: 25px;
            font-weight: bold;

        }

        .container p {
            line-height: 10px;
        }
        .logbutton {
            height: 30px;
            width: 114px;
            background-color: #0A76EA;
            border-radius: 20px;
            border: none;
            margin-left: 15px;
            margin-top: 14px;
            font-weight: bold;
            color: white;
        }

        .logbutton:hover {
            background-color: black;
            color: white;
        }
         .logout{
           
            display: flex;
            align-items: center;
            padding: 0px;
            margin: 0px;
        }
        .logout p{
           margin-right: 14px;
           margin-left: 524px;
          
        }
         .button1 {
            height: 36px;
            width: 156px;
            color:black;
            cursor:pointer;
            box-sizing: border-box;
            background-color:#0A76EA;
            display:block;
            margin-top:6px;
            left:570px;
            position:absolute;
            text-align: center;
            border:none;

        }
          .button1:hover {
            background-color:  #2ecc71;
            color: white;

        }
    </style>
</head>
<body>
 <div class="container" id="contain">
         <div class="logout">
            <h1>Welcome To Online Banking Portal</h1>
            <p>Hi, <b style="color:red">${user.username}</b></p>
            <a href="login.jsp"><img src="images/avator.png" class="avator"></a>
        </div>
        <header>
            <nav class="navbar">
                <ul>
                    <li><a href=home.jsp>Dashboard</a></li>
                    <li><a href=deposit.jsp>Deposit</a></li>
                    <li><a href=withdraw.jsp>Withdraw</a></li>
                    <li><a href=transfer.jsp>Transfer</a></li>
                    <li><a href=delete.jsp>Close A/C</a></li>
                    <li><a href=transaction.jsp id="active">Transaction-History</a></li>
                    <li><a href=balance.jsp>Balance</a></li>


                </ul>

            </nav>
        </header>
       <br>
       
      
       <div class="transactions">
                <%try {
        			
        			response.setContentType("text/html");
        			//PrintWriter out= response.getWriter();
        			Connection con=null;
        			PreparedStatement stmt=null;
        			con=DBConnector.getConnection();
        			stmt=con.prepareStatement("select * from tbl_transactions where accno=?");
        			stmt.setString(1,DBConnector.accno);
        			ResultSet rs=stmt.executeQuery();
        			ResultSetMetaData rsmd=(ResultSetMetaData) rs.getMetaData();
        			
        		    out.print(" <table>");      
        		    out.print("<caption>"); 
        		    out.print("<h2>Transaction History</h2>"); 
        		    out.print("<hr>"); 
        		    out.print(" </caption>"); 
                        
                        
                   
        			out.print("<tr>");
        			out.print("<th>Transaction Id</th>");
        			out.print("<th>"+rsmd.getColumnName(1)+"</th>");
        			out.print("<th>"+rsmd.getColumnName(2)+"</th>");
        			out.print("<th>"+rsmd.getColumnName(3)+"</th>");
        			out.print("<th>"+rsmd.getColumnName(4)+"</th>");
        			out.print("<th>"+rsmd.getColumnName(5)+"</th></tr>");
        			int i=0;
        			while(rs.next()) {
        				out.print("<tr><td>"+String.valueOf(++i)+"</td>");
        				out.print("<td>"+rs.getString(1)+"</td>");
        				out.print("<td>"+rs.getString(2)+"</td>");
        				out.print("<td>"+rs.getString(3)+"</td>");
        				out.print("<td>"+rs.getString(4)+"</td>");
        				out.print("<td>"+rs.getString(5)+"</td></tr>");
        			}
        			out.print("</table>");
        			
        				
        		}catch(Exception e) {
        			e.printStackTrace();
        		} %>
               
         
     </div>
      <form action="./Pdfgen" method="get" target="_blank">
      <input type="submit" value="Generate Report" class="button1">
      </form>
        
  </div>
</body>
</html>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.io.IOException"%>
<%@ page import="com.bank.*" %>
