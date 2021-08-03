<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Banking-Portal/Transaction Status</title>
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
            width: 1024px;
            height: 222px;
            border: 2px solid black;
            margin: 110px auto;
            line-height: 6px;
            padding: 10px 0px;
   
    }
         .button {
            height: 36px;
            width: 156px;
            box-sizing: border-box;
            background-color: #0A76EA;
           display: block;
            margin: 10px auto;
            text-align: center;

        }
          .button a {
            height: 36px;
            width: 156px;
            display: block;
            box-sizing: border-box;
            text-decoration: none;
            padding: 14px;
            color: white;
            font-size: 14px;
        }

        .button a:hover {
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
        #status{
        color:white;
        }
        .error{
              margin-top:-10px;
              text-align: center;
              padding: 2px;
              width: 1020px;
              background-color:${color};
              border:none;
              outline:none;
              font-size:20px;
    
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
                        <li><a href=transfer.jsp>Transfer</a></li>
                        <li><a href=delete.jsp>Close A/C</a></li>
                        <li><a href=transaction.jsp>Transaction-History</a></li>
                        <li><a href=balance.jsp>Balance</a></li>

                       
                    </ul>
        
                </nav>
            </header>
            <div class="info">
                 
              <div class="error" id="error"><p id="status">${status}</p>
              <p id="status">As on ${dtime}</p>
              </div>
                  
              <hr>
             
               <p align="center">Your account balance is</p>
              <h2 align="center">Rs. ${nbal}</h2><br>
              
               <div class="button"><a href="${srcpage}">Done</a></div>
               
           </div>

    </div>

 <script>
 var srcpage='${srcpage}';
 if(srcpage=="deposit.jsp"){
	 alert("Amount Rs.${amt} is deposited to your account "); 
 }
 else if(srcpage=="withdraw.jsp"){
	 var state='${status1}';
	 if(state=="true"){
		 alert("Amount Rs.${amt} is withdrawn from your account "); 
	 }
	 else{
		 alert("Insufficient Funds"); 
	 }
} else if(srcpage=="transfer.jsp"){
	 var state='${status1}';
	 var accnof='${accnof}';
	 var accnot='${accnot}';
	 if(state=="true"){
		 alert("Amount Rs.${amt} is transfered from your account "+accnof+
				 " to account "+accnot); 
	 }
	 else{
		 alert("Insufficient Funds"); 
	 }
}
 
</script>
    
</body>
</html>