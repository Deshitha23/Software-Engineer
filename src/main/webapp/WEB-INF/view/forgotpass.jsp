<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>forgot password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<style>
/* These style tags are only necessary if you’re adding internal CSS */
body{
    background-color:rgb(15, 7, 6);
    margin-top: 50px;
    margin-left: 100px;
}
label{
    color:rgb(12, 1, 1)
}
</style>
</head>
<body>
<%
  response.addHeader("Pragma", "no-cache");
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.addHeader("Cache-Control", "pre-check=0, post-check=0");
  response.setDateHeader("Expires", 0);
%>
<div width:650px;height:400px;">
        
            <br>
<u style="color:rgb(245, 240, 240)"><h1 style="crgb(248, 243, 243)7, 7)">Forgot Password</h1></u>
<br>
<div style="background-color: rgb(244, 244, 246);
border: 15px rgb(10, 5, 5);
padding: 50px;
margin: 20px">


        <label>Username </label>   
        <input type="text" placeholder="Enter user name" id="username" required>  
        <br><br> <br>
        <div style="display:none;" id="otparea">
        <label>OTP : </label>   
        <input type="text" placeholder="Enter OTP" id="OTP"  >  
        </div>
        <br><br> <br>
                <div style="display:none;" id="newpasswordarea">
        
        <label>New Password : </label> 
        <input type="text" placeholder="New Password" id="newpass" > 
        
        <label>Confirm Password : </label> 
        <input type="text" placeholder="Confirm Password" id="confirmpass" >   
        </div>
        <br> <br><br>
        
        <input type="button" onclick="submit()" value="Submit">
         

    </div>   
    </div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
function submit(){
	
	var username = $("#username").val();
	var otp = $("#OTP").val();
	var newpassword = $("#newpass").val();
	var confirmpassword = $("#confirmpass").val();

		
	if(username != "" && otp == "" && newpassword == "" && confirmpassword == ""){
		
			$.ajax({
				type:"POST",
				url:"testUser",
				data:{
					un:username
				},
				async:false,
				success:function(data){
					var res = $.parseJSON(data);
					if(res.hasOwnProperty("Success")){
						document.getElementById("otparea").style.display = "";
					}
					else{
						alert("Invalid username");
					}
				}
			});
	}
	
	
	else if(username != "" && otp != "" && newpassword == "" && confirmpassword == ""){
		
	
			$.ajax({
				type:"POST",
				url:"verifycode",
				data:{
					un:username,
					code:otp
				},
				async:false,
				success:function(data){
					var res = $.parseJSON(data);
					if(res.hasOwnProperty("Success")){
						//alert(data);
						document.getElementById("newpasswordarea").style.display = "";

					}
					else{
						alert(res.Error);
					}
				}
			});	
		
		
	}
	else if(username != "" && otp != "" && newpassword != "" && confirmpassword != ""){
		if(newpassword == confirmpassword){
		$.ajax({
			type:"POST",
			url:"resetPassword",
			data:{
				un:username,
				pass:newpassword
			},
			async:false,
			success:function(data){
				var res = $.parseJSON(data);
				if(res.hasOwnProperty("Success")){
					alert(res.Success);
					window.location.href = "login";
				}
				else{
					alert(res.Error);
				}
			}
		});
		}
		else{
			alert("both passwords are not same");
		}
	}
	else{
		alert("Enter all values");
	}
	
}
</script>
</body>
</html>