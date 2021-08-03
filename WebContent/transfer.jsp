<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Banking-Portal/Transfer</title>
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
            width: 465px;   
            height: 384px;  
            border: 2px solid black;
            margin: 50px 60px;
            line-height: 4px;
            padding: 10px 40px;
            font-weight: bold;
            font-size: 16px;
         }
         .logbutton {
            height: 30px;
            width: 114px;
            background-color: #0A76EA;
            border-radius: 20px;
            border: none;
            margin-left: 0px;
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
         .errortxt{
        line-height:35px;
        color:red;
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
                        <li><a href=home.jsp >Dashboard</a></li>
                        <li><a href=deposit.jsp>Deposit</a></li>
                        <li><a href=withdraw.jsp >Withdraw</a></li>
                        <li><a href=transfer.jsp id="active">Transfer</a></li>
                        <li><a href=delete.jsp>Close A/C</a></li>
                        <li><a href=transaction.jsp>Transaction-History</a></li>
                        <li><a href=balance.jsp>Balance</a></li>

                       
                    </ul>
        
                </nav>
            </header>
            <div class="info">
               
                <h1 align="center">Transfer Amount</h1><hr>
                <form action="./Transfer" method="post" onsubmit="myFunction()"  autocomplete="off">
                <p>Transfer From- Account Number:</p><input type="text" name="accnof" required>
                <p>Transfer To- Account Number:</p><input type="text" name="accnot" required>
                <p>Transaction Pin :</p><input type="password" name="transpin" required >
                <p>Amount :</p><input type="text" name="amt" required ><br>
               
                <input type="submit" value="Transfer" class="logbutton">
                </form>
                <span class="errortxt">${message}</span>
            </div>
          <img src="images/theme.png" alt="theme image" class="theme">
    </div>
<script>
 function myFunction(){
	 alert("Your Transaction is processing......");
 }
 </script>
</body>
</html>