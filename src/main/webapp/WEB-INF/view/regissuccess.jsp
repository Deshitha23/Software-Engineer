<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang=”en” manifest="/cache.appcache">
<head>
<title>Registration successful</title>
<meta charset="utf-8">
<link rel="stylesheet" rel="noopener" target="_blank" href="bootstrap/css/bootstrap.min.css"> <!-- This link is only necessary if you’re using an external stylesheet -->
<style>
/* These style tags are only necessary if you’re adding internal CSS */
body {
    background-image: url('people celebration.png');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
.box{
    margin-top:200px;
    margin-left: 550px;
    }
label{
    color: rgb(16, 7, 7);
}
</style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>
<%
  response.addHeader("Pragma", "no-cache");
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.addHeader("Cache-Control", "pre-check=0, post-check=0");
  response.setDateHeader("Expires", 0);
%>
    
        <div style="width:400px;height:400px;" class="box">
            <center>

            <br><br><br>
            <img src="tickimage.png" style="margin-top:100; margin-left:100;">
                <br><br>
    <h4 style="color:rgb(7, 0, 0)" > Thank you For Your Registration</h4>
    <h2><a type="text" onclick="login()"> Ready to Login?</a></h2>
    
    
    
           
            
            
        </center>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        
    <script>
    function login(){
		window.location.href="login";
	}
    </script>
    
</body>
</html>