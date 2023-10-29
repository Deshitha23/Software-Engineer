<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang=”en” manifest="/cache.appcache">
<head>
<title>adminportal</title>
<link rel="stylesheet" rel="noopener" target="_blank" href="bootstrap/css/bootstrap.min.css"> <!-- This link is only necessary if you’re using an external stylesheet -->
<style>
/* These style tags are only necessary if you’re adding internal CSS */
body {
    background-image: url('adminimg.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
    margin-top: 100px;
    margin-left: 100px;
}
label{
    color: white;
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
    <div style="background-color:rgb(249, 247, 246);width:1300px;height:800px;">
        <br>
        <h2>&nbsp;&nbsp;&nbsp;<b>Hello Admin!!!</b> <div style="text-align:right"><a href="logout"  "  > Logout</a></div>       
        </h2>
        <hr size="6" noshade>
        <br>
        <br>
        <br>
        <div style="margin-left:400px;">
            
            <a href="#" onclick="Managepromotions()"><img src="manageprom.jpg" width="200" height="200"></a>&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;
            <a href="#" onclick="Managemovies()"><img src="managemovies.png" width="200" height="200"></a>&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;
            <br>
            <br>
            
            <h3><b >Manage promotions</b>&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;
            <b>Manage Movies</b></h3>
            
            <br><br>
            &numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;
            <a href="#" onclick="manageusers()"><img src="manage_users.jpg" width="200" height="200"></a>&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;
            <br>&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;
            <h3>            &numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;&numsp;
            <b>Manage Users</b></h3>
            
        </div>
        


    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <script>
 function Managemovies(){
		window.location.href="Managemovies";
		
	}
 function Managepromotions(){
		window.location.href="promoslist";
		
  }
 
 function manageusers(){
		window.location.href="manageusers";
		
}
 
 
 </script>
</body>
</html> 