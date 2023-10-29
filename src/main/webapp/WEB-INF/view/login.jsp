<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>login</title>
    <style>
       body {
    background-image: url('logimage.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
    background-size: cover;
    
}
.box{
margin-top:200px;
    margin-left: 450px;
    }
label{
    color: rgb(12, 2, 2);
}
    </style>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<%
  response.addHeader("Pragma", "no-cache");
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.addHeader("Cache-Control", "pre-check=0, post-check=0");
  response.setDateHeader("Expires", 0);
%>

<div style="background-color:rgb(244, 242, 242);width:650px;height:400px;" class="box">
            <center>
                <br>
    <h4 style="color:rgb(10, 2, 2)"> LOGIN</h4>
    <br>
    <label>Username : </label>   
            <input type="text" placeholder="Enter Username" id="username1" required>  
            <br><br><br>
            <label>Password : </label>   
            <input type="password" placeholder="Enter Password" id="password1" required>  
            <br> <br><br> 
            <input type="button" onclick="doLogin()" value="Login">
            <br><br>
            <a href="#" style ="color:rgb(17, 5, 5)" onclick="forgotpass()">Forgot Password</a>
            <br><br>
            
            <input type="button" onclick="signup()" value="SIGN UP">
             <input type="button" onclick="guestuser()" value="GUEST USER"> 
            
        </center>
        </div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

 <script>
 function doLogin(){
	 var username = $("#username1").val();
	 var password = $("#password1").val();
	 if(username != "" && password != ""){
		 $.ajax({
			 type:"POST",
			 url:"login",
			 data:{
				 un:username,
				 pwd:password
			 },
			 async:false,
			 success:function(data){
				 if(data != null){
					 var response = $.parseJSON(data);
					 if(response.hasOwnProperty("Success")){
						 if(response.role == 1){
							 window.location.href="admin";
							 
						 }
						 else{
							 window.location.href="home";
 
						 }
					 }
					 else{
						 alert(response.Error);
					 }
				 }
				 
			 }
		 });
	 }
	 else{
		 alert("Please enter credentials");
	 }
 }
function signup(){
	window.location.href="signup";
	
}	
function guestuser(){
	window.location.href="home";
}
function forgotpass(){
	window.location.href="forgotpass";
}
	
</script>


</body>
</html>
