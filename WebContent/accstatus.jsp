<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Banking-Portal/Account Status</title>
 <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans&display=swap" rel="stylesheet">

    <style>
        *{
            box-sizing: border-box;
            font-family: 'Noto Sans', sans-serif;
        }
        body{
            background-color: #0A76EA;        
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0px;
            min-height: 100vh;
        }
        .container{
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
            overflow: hidden;
            width: 42%;
            max-width: 100%;
            height: 330px;
            margin: 10px;
            text-align: center;
         }
          .button {
            height: 36px;
            width: 90%;
            box-sizing: border-box;
            background-color: #2ecc71;
           display: block;
            margin: 10px auto;
            

        }
          .button a {
            height: 36px;
            width: 100%;
            text-align: center;
            display: block;
            box-sizing: border-box;
            text-decoration: none;
            padding: 8px 0px;
            color: white;
            font-size: 16px;
        }

        .button a:hover {
            background-color: #0A76EA;
            color: white;

        }
        .container h2{
            color:#2ecc71;
        }
         #note{
            color: #e74c3c;
        }
        
    </style>
</head>
<body>

<div class="container">
         <h2>User Created Successfully</h2>
         <p>Your request to open an account in the bank is accepted.</p>
          <%try {
        			
        			response.setContentType("text/html");
        			Connection con=null;
        			PreparedStatement stmt=null;
        			con=DBConnector.getConnection();
        			stmt=con.prepareStatement("select * from tbl_users where username=?");
        			stmt.setString(1,request.getParameter("username"));
        			ResultSet rs=stmt.executeQuery();
        			while(rs.next()){
        				out.print("<p>Your username is :<b> "+ rs.getString(5)+"</b></p>");
        				 out.print("<p>Your A/C Number is : <b>"+ rs.getString(10)+"</b></p>");
        		         out.print("<p>Your Transaction Pin is : <b>"+ rs.getString(6)+"</b></p>");
        			}
        			
        			
        				
        		}catch(Exception e) {
        			e.printStackTrace();
        		} %>
         <p id="note" ><b>Note: Do not share your Transaction Pin with anyone.</b></p>
       <div class="button"><a href=login.jsp>Login</a></div>
    </div>
 <script>
function change(url)
{
	window.navigate(url);
	
}
</script>
</body>
</html>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.io.IOException"%>
<%@ page import="com.bank.*" %>