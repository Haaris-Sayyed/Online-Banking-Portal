<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Banking-Portal/DashBoard</title>
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
        .container h1{
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
            margin: 13px  20px;
        }

        .navbar li a {
            padding: 3px 3px;
            text-decoration: none;
            color: white;
            font-size: 19px;
        }

        #active{
            color: chartreuse;
        }
        

       
        .navbar li a:hover ,#active:hover{
            color:red ;
        }
        .theme{
            position: absolute;
            top: 192px;
            right: 90px;
        }
        .info{
            width: 500px;
            height: 320px;
            /* border: 1px solid black; */
            margin: 50px 60px;
           
        }
        .info p{
            padding: 3px 18px;
            font-size: 18px;
            font-weight: bold;
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
       
      
    </style>
</head>
<body>
<% response.setHeader("Cache-control","no-cache,no-store,must-revalidate");%>
<% response.setHeader("Program","no-cache");%>
<%response.setHeader("Expires","0");%>

 
   <div class="container" id="contain">
        <div class="logout">
            <h1>Welcome To Online Banking Portal</h1>
            <p>Hi, <b style="color:red">${user.username}</b></p>
            <a href="login.jsp"><img src="images/avator.png" class="avator"></a>
        </div>
      
       
       
           
            <header>
                <nav class="navbar">
                    <ul>
                        <li><a href=home.jsp id="active">Dashboard</a></li>
                        <li><a href=deposit.jsp>Deposit</a></li>
                        <li><a href=withdraw.jsp>Withdraw</a></li>
                        <li><a href=transfer.jsp>Transfer</a></li>
                        <li><a href=delete.jsp >Close A/C</a></li>
                        <li><a href=transaction.jsp >Transaction-History</a></li>
                        <li><a href=balance.jsp >Balance</a></li>

                       
                    </ul>
        
                </nav>
            </header>
          
           <div class="info">  
           <%Connection conn=null; 
            conn=DBConnector.getConnection();
           
			response.setContentType("text/html");
			
			PreparedStatement stmt=null;
			
		   
			stmt=conn.prepareStatement("select * from tbl_users where username= ?");
			stmt.setString(1,request.getParameter("username"));
			DBConnector.cuser=request.getParameter("username");
			ResultSet rs=stmt.executeQuery();
			 
			while(rs.next()){
				DBConnector.cuser=rs.getString(5);
				DBConnector.accholder=rs.getString(1);
				DBConnector.accno=rs.getString(10);
				DBConnector.email=rs.getString(2);
				DBConnector.mno=rs.getString(7);
				DBConnector.brname=rs.getString(8);
				DBConnector.transpin=rs.getString(6);
			}	
			
			out.print(
	                "<h2>User Info</h2><hr>"+
					" <p>Account Holder : "+DBConnector.accholder +"</p>"+
	               " <p>Account Number : "+DBConnector.accno+"</p>"+
	               " <p>Account Type : Savings</p>" +
                   "<p>Email : "+DBConnector.email+"</p>"+		               
	                " <p>Registered Mobile No. : "+DBConnector.mno+"</p>"+
	               " <p>Branch Name : "+DBConnector.brname+"</p>"
	               
	              
	           );
			
		     %>
		     
           
               </div> 
              
           
           
       <img src="images/theme.png" alt="theme image" class="theme">
    </div>
   
 
   
</body>
</html>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.io.IOException"%>
<%@ page import="com.bank.*" %>


