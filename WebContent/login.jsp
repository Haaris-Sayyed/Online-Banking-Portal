<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js" 
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<script type="text/javascript"
    src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>
    <script type="text/javascript">
 
    $(document).ready(function() {
        $("#loginForm").validate({
            rules: {
                username: {
                    required: true,
                    un1: true
                },
         
                password: "required",
            },
             
            messages: {
                username: {
                    required: "Please enter username",
                    un1: "Please enter a valid username"
                },
                 
                password: "Please enter password"
            }
        });
 
    });
</script>
<meta charset="ISO-8859-1">
<title>Banking-Portal/login</title>
 <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans&display=swap" rel="stylesheet">
    <style>
         body {
            font-family: 'Noto Sans', sans-serif;
            background: url(images/gradient.png);
            margin: 0;
        }

        .element {
            height: 40px;
            width: 250px;
            margin: 0px 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            border: 2px solid grey;
            border-left: 10px solid purple;          

        }
       
        .element p {
            font-weight: 30px;
            font-weight: bold;
        }
        #even{
            margin-left: 280px;
        }
        #first{
            margin-top: 64px;
        }
         #text{
          color: red;
          margin: 35px auto;
          font-size: 18px;
          font-weight: bold;
          width: 98%;
        }
        .heading {
            color: white;
            font-size: 55px;
            font-weight: bold;
            margin: 0;
            color: #5950BD;
            padding: 0px 4px;
            margin-left: 15px;
        }

        .left {

            background-color: #FCB22D;
            width: 200px;
            height: 200px;
            position: absolute;
            border-bottom-right-radius: 90%;
            left: 0;
            top: 0;
        }

        .right {

            background-color: #FCB22D;
            width: 200px;
            height: 200px;
            position: absolute;
            border-top-left-radius: 90%;
            bottom: 0;
            right: 0;

        }

        .container {
            height: 525px;
            width: 1255px;
            background-color: white;
            box-shadow: 5px 10px 18px #aaaaaa;
            border-radius: 4px;
            position: relative;
            margin-left: 50px;
            margin-top: 50px;
            z-index: 1;
        }
        

        .login-box {

            box-sizing: border-box;
            width: 450px;
            height: 350px;
            background-color: white;
            margin: 100px auto;
            display: flex;
            position:absolute;
            right:50px;
           bottom:-14px;
           border:1px solid black;
        }

        .box1 {
            width: 150px;
            height: 348px;
            border-right: 1px solid black;
            display: flex;
            flex-direction: column;
            background-color: purple;

        }

        .box2 {
            width: 300px;
            height: 350px;


        }

        .logo {
            height: 80px;
            width: 80px;
            margin: 15px auto;
            background: url(images/bank-building.png);
            background-repeat: no-repeat;

        }

        .button {
            height: 28px;
            width: 114px;
            box-sizing: border-box;
            background-color: #0A76EA;
            border-radius: 20px;
            display: block;
            margin: 10px auto;
            text-align: center;

        }

        .logbutton {
            height: 28px;
            width: 114px;
            background-color: #0A76EA;
            border-radius: 20px;
            border: none;
            margin-left: 30px;
            margin-top: 42px;
            position:absolute;
        }

        .logbutton:hover {
            background-color: black;
            color: white;
        }

        .button a {
            height: 28px;
            width: 114px;
            display: block;
            box-sizing: border-box;
            text-decoration: none;
            border-radius: 20px;
            padding: 4px;
            color: white;
            font-size: 14px;
        }

        .button a:hover {
            background-color: black;
            color: white;

        }

        .avator {
            background: url(images/user.png);
            background-repeat: no-repeat;
            margin: 15px 114px;
            height: 100px;
            width: 100px;


        }

        #button1 {
            margin-top: 168px;
        }

        .credentials {
            margin: 10px 70px;
            line-height: 4px;
        }
        .error{
        line-height:35px;
        color:red;
        position:absolute;
        }
    </style>

</head>
<body>
 <div class="left"></div>
    <div class="right"></div>
    <div class="container">
        <p class="heading">ONLINE</p>
    <p class="heading">BANKING</p>
    <div class="element" id="first"><p>Safe & Secure</p></div>
    <div class="element" id="even"><p>Faster Transactions</p></div>
    <div class="element"><p>Money Transfer</p></div>
    <div class="element" id="even"><p>Easy To Use</p></div>
    <div class="element"><p>24x7 Accessible</p></div>
    <div  id="text">
        <marquee scrollamount="10">Welcome To Online Banking Portal.</marquee>    
    </div>
    <div class="login-box">
        <div class="box1">
            <div class="logo"></div>
            <div class="button" id="button1"><a href="reg.jsp">Register User</a></div>

        </div>
        <div class="box2">
            <div class="avator"></div>
            <div class="credentials">
                <form action="./Logdata" method="post"  autocomplete="off">
                    <p>User Name:</p>
                    <input type="text" name="username" required id="user">
                    <p>Password:</p>
                    <input type="password" name="password" required>
                    <small class="error">${message}</small>
                   
               <input type="submit" value="Login" class="logbutton" >
              </form>
            </div>
            
        </div>
          
         
    </div>
    
          </div>

 

</body>
</html>
