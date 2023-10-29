<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang=”en” manifest="/cache.appcache">
<head>
<title>changepwd</title>
<meta charset="utf-8">
<link rel="stylesheet" rel="noopener" target="_blank" href="bootstrap/css/bootstrap.min.css"> <!-- This link is only necessary if you’re using an external stylesheet -->
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
<u style="color:rgb(245, 240, 240)"><h1 style="crgb(248, 243, 243)7, 7)">Change your Password</h1></u>
<br>
<div style="background-color: rgb(244, 244, 246);
border: 15px rgb(10, 5, 5);
padding: 50px;
margin: 20px">


<label>Old Password : </label>   
        <input type="password"  id="opwd" required>  
        <br><br><br>
        <label>New Password : </label>   
        <input type="password"  id="npwd" required>  
        <br><br> <br>
        <label>Confirm new password: </label>   
        <input type="password"  id="cpwd" required>  
        <br><br> <br>
        
        
        <button type="button" onclick="changepasswd()" >Change</button>
        
         

    </div>   
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <script>
    function changepasswd(){
    	//alert("called");
    	var user_id = "${sessionScope.userid}";
	 var opwd = $("#opwd").val();
	 var npwd = $("#npwd").val();
	 var cpwd = $("#cpwd").val();
	 
	 user_id=parseInt(user_id);
	 
	 if(  opwd != "" && npwd != "" && cpwd != ""){
		 let pattern1 = /[a-z]/;
         let pattern2 = /[A-Z]/;
         let pattern3 = /[0-9]/;
         let pattern4 = /[`!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?~]/;
         
         
         
         if (!(pattern1.test(npwd) && pattern2.test(npwd) && pattern3.test(npwd) && pattern4.test(npwd))) {
         alert('Password must have atleast one lowercase letter, uppercase letter, number and special character');
           return;
         }
		 if(npwd == cpwd){
			 $.ajax({
				 type:"POST",
				 url:"changepass",
				 data:{
					 uid:user_id,
					 oldpwd:opwd,
					 newpwd:npwd,
					 
				 },
				 async:false,
				 success:function(data){
					 if(data != null){
						 var response = $.parseJSON(data);
						 if(response.hasOwnProperty("Success")){
							 alert(response.Success);

							
						 }
						 else{
							 alert(response.Error);
						 }
					 }
					 
				 }
		 
		 
		 
		 });
		 }
	 
	 else{
		 alert("New password and confirm password are not same");
	 }
	 }
	 
	 else{
		 alert("Enter all values");
	 }
 }
    function changepwd(){
    	window.location.href="changepwd";
    }
	function changepwd(){
		
	}
</script>
</body>
</html>