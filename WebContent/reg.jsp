<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Banking-Portal/Create Account</title>
  <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css">
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
            width: 50%;
            max-width: 100%;
            /* height: 700px; */
            margin: 10px;

        }
        .header{
            background-color: #f7f7f7;
            border-bottom: 1px solid #f0f0f0;
            padding: 20px 40px;
        }
        .header h2{
            margin: 0;
        }
        .form{
            padding: 30px 40px;
        }
        .form-control{
            margin-bottom: 10px;
            padding-bottom: 20px;
            position: relative;
        }
        .form-control label{
            display: inline-block;
            margin-bottom: 5px;
        }
        .form-control input{
            border: 2px solid #f0f0f0;
            border-radius: 4px;
            display: block;
            font-size: 14px;
            width: 100%;
            padding:10px;
            font-family: inherit;
        }
        .form-control.success input{
            border-color: #2ecc71;
        }
        .form-control.error input{
            border-color: #e74c3c;
        }
        .form-control.success i.fa-check-circle{
            visibility: visible;
            color: #2ecc71;
        }
        .form-control.error i.fa-exclamation-circle{
            visibility: visible;
            color: #e74c3c;
        }
        .form-control.error small{
            color: #e74c3c;
            visibility: visible;
        }
        .form-control i{
            position: absolute;
            top: 40px;
            right: 10px;
            visibility: hidden;
        }
        .form-control small{
            position: absolute;
            bottom: 0;
            left: 0;
            visibility: hidden;
        }
        .form input[type='submit']{
            background-color: #0A76EA;
            border: 2px solid #0A76EA;
            border-radius: 4px;
            color: white;
            display: block;
            padding: 10px;
            font-family: inherit;
            font-size: 16px;
            width: 100%;
        }
        .form input[type='submit']:hover{
           color:white;
           background:#2ecc71;
           border:2px solid #2ecc71;
           cursor:pointer;
        }
      
        
    </style>
    
</head>
<body>
 <div class="container">
        <div class="header">
            <h2>Create Account</h2>
        </div>
        <form class="form" id="form" action="./Regdata" method="post"  autocomplete="off">
            <div class="form-control">
                <label for="">Your Name (Start with surname)</label>
                <input type="text" name="name" id="name" placeholder="abc">
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small>Error Message</small>
            </div>
            <div class="form-control ">
                <label for="">Your Email</label>
                <input type="text" name="email" id="email" placeholder="abc@gmail.com">
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small>Error Message</small>
            </div>
            <div class="form-control ">
                <label for="">Your Address</label>
                <input type="text" name="address" id="address" placeholder="177A bleecker street">
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small>Error Message</small>
            </div>
            <div class="form-control ">
                <label for="">Date Of Birth</label>
                <input type="date" name="dob" id="dob">
                <small>Error Message</small>
            </div>
            <div class="form-control">
                <label for="">Username (Max. 6 charecters)</label>
                <input type="text" name="username" id="username" placeholder="abc123" maxlength="6">
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small>Error Message</small>
            </div>
            <div class="form-control">
                <label for="">Transaction Pin (Max. 4 digits)</label>
                <input type="password" name="transpin" id="transpin" placeholder="1234" onkeypress="return onlyNumberKey(event)"  maxlength="4">
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small>Error Message</small>
            </div>
            <div class="form-control">
                <label for="">Confirm Transaction Pin</label>
                <input type="password"  id="transpin2" placeholder="1234" onkeypress="return onlyNumberKey(event)" maxlength="4">
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small>Error Message</small>
            </div>
            <div class="form-control">
                <label for="">Mobile Number</label>
                <input type="tel" name="mno" id="mno" placeholder="9000114507" onkeypress="return onlyNumberKey(event)" maxlength="10">
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small>Error Message</small>
            </div>
            <div class="form-control">
                <label for="">Branch Name</label>
                <input type="text" name="brname" id="brname" placeholder="Latur">
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small>Error Message</small>
            </div>
            <div class="form-control">
                <label for="">Password</label>
                <input type="password" name="password" id="password" placeholder="Pass123">
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small>Error Message</small>
            </div>
            <div class="form-control">
                <label for="">Confirm Password</label>
                <input type="password" id="password2" placeholder="Pass123">
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small>Error Message</small>
            </div>
            <input type="submit" value="Submit">
           </form>
    </div>
<%
Connection conn = null;
PreparedStatement stmt = null;
conn=DBConnector.getConnection();
stmt=conn.prepareStatement("SELECT * FROM tbl_users where username=?");
stmt.setString(1,request.getParameter("username"));
ResultSet rs=stmt.executeQuery();
if(rs.next()) {
	request.setAttribute("userstate","true"); 
}
else{
	request.setAttribute("userstate","false"); 
}

%>
    <script>
        const form=document.getElementById('form');
        const name=document.getElementById('name');
        const email=document.getElementById('email');
        const address=document.getElementById('address');
        const dob=document.getElementById('dob');
        const username=document.getElementById('username');
        const transpin=document.getElementById('transpin');
        const transpin2=document.getElementById('transpin2');
        const mno=document.getElementById('mno');
        const brname=document.getElementById('brname');
        const password=document.getElementById('password');
        const password2=document.getElementById('password2');
        form.addEventListener('submit',(e) => {
            e.preventDefault();
            checkInputs();
       });
        function checkInputs(){
           const nameValue = name.value.trim();
           const emailValue = email.value.trim();
           const addressValue = address.value.trim();
           const dobValue = dob.value.trim();
           const usernameValue = username.value.trim();
           const transpinValue = transpin.value.trim();
           const transpin2Value = transpin2.value.trim();
           const mnoValue = mno.value.trim();
           const brnameValue = brname.value.trim();
           const passwordValue = password.value.trim();
           const password2Value = password2.value.trim();
         
          
           if(nameValue === ''){
               setErrorFor(name,'Name cannot be empty!');
           }else{
              setSuccessFor(name);
           }
           if(emailValue === ''){
               setErrorFor(email,'Email cannot be empty!');
           }else if(!isEmail(emailValue)){
            setErrorFor(email,'Email is not valid!');
           }
           else{
              setSuccessFor(email);
           }
           if(addressValue === ''){
               setErrorFor(address,'Address cannot be empty!');
           }else{
              setSuccessFor(address);
           }
           if(dobValue === ''){
            setErrorFor(dob,'Date Of Birth not selected!');
           }else{
              setSuccessFor(dob);
           }
           if(usernameValue === ''){
               setErrorFor(username,'Username cannot be empty!');
           }else{
              setSuccessFor(username);
           }
           if(transpinValue === ''){
               setErrorFor(transpin,'Transaction pin cannot be empty!');
           }else{
              setSuccessFor(transpin);
           }
           if(transpin2Value === ''){
               setErrorFor(transpin2,'Confirm Transaction cannot be empty!');
           }else if(transpinValue!=transpin2Value){
            setErrorFor(transpin2,'Transaction pin does not match!');
           }else{
              setSuccessFor(transpin2);
           }
           if(mnoValue === ''){
               setErrorFor(mno,'Mobile Number cannot be empty!');
           }else{
              setSuccessFor(mno);
           }
           if(brnameValue === ''){
               setErrorFor(brname,'Branch name cannot be empty!');
           }else{
              setSuccessFor(brname);
           }
           if(passwordValue === ''){
               setErrorFor(password,'Password cannot be empty!');
           }else{
              setSuccessFor(password);
           }
           if(password2Value === ''){
               setErrorFor(password2,'Confirm password cannot be empty!');
           }else if(passwordValue!=password2Value){
            setErrorFor(password2,'password does not match with password!');
           }else{
              setSuccessFor(password2);
           }
           
          doSubmit();

        }
        function setErrorFor(input,message){
            const formControl=input.parentElement;
            const small=formControl.querySelector('small');
            small.innerText=message;
            formControl.className='form-control error';
        }
        function setSuccessFor(input){
            const formControl=input.parentElement;
            formControl.className='form-control success';
        }
        function isEmail(email){
            return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
        }
        function onlyNumberKey(evt) {
         var ASCIICode = (evt.which) ? evt.which : evt.keyCode
         if (ASCIICode > 31 && (ASCIICode < 48 || ASCIICode > 57))
             return false;
         return true;
     }
      
     function doSubmit(){
    	 const nameValue = name.value.trim();
         const emailValue = email.value.trim();
         const addressValue = address.value.trim();
         const dobValue = dob.value.trim();
         const usernameValue = username.value.trim();
         const transpinValue = transpin.value.trim();
         const transpin2Value = transpin2.value.trim();
         const mnoValue = mno.value.trim();
         const brnameValue = brname.value.trim();
         const passwordValue = password.value.trim();
         const password2Value = password2.value.trim();
    	 if((nameValue ==='') || (emailValue ==='') || (addressValue ==='') || (dobValue ==='') || (usernameValue ==='') || (transpinValue ==='') || (transpin2Value ==='') || (mnoValue ==='') ||
          		 (transpinValue !== transpin2Value) || (mnoValue ==='') || (brname ==='') || (passwordValue ==='') || (password2Value ==='') || (passwordValue !== password2Value)){
          	 alert('Form cannot be submitted.\nCheck your details again !');
           }
    	 else{
    		 form.submit();
    	 }
     }
    </script>
</body>
</html>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.io.IOException"%>
<%@ page import="com.bank.*" %>
