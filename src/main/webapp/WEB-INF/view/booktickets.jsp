<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Book movie tickets</title>
    <style>
    

th, td {
  padding-top: 30px !important;
  padding-bottom: 30px !important;
 }
     </style>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" integrity="sha512-vKMx8UnXk60zUwyUnUPM3HbQo8QfmNx7+ltw8Pm5zLusl1XIfwcxo8DbWCqMGKaWeNxWA8yrx5v3SaVpMvR3CA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body class='bg-secondary'>
<%
  response.addHeader("Pragma", "no-cache");
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.addHeader("Cache-Control", "pre-check=0, post-check=0");
  response.setDateHeader("Expires", 0);
%>



<div class="container py-5">
    <div class="card">
  <div class="card-header">  <h2 class="text-dark" id="title"></h2>
</div>
  <div class="card-body">
  <div class="row">
  <div class="btn-group btn-group-lg text-center" role="group" aria-label="Basic example" id="dates">
 

</div>
</div>

<div class="row py-5">

      
  <table class="table table-lg table-bordered" id="movieshows">
    <thead>
      <tr>
        <th>Screen</th>
        <th>Show Timings</th>
      </tr>
    </thead>
    <tbody id="tablebody">
    
      
    </tbody>
  </table>
</div>
</div>
</div>

  
</div>


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 
<script>


var dates = '${showdates}';
var response = $.parseJSON(dates);
$("#title").text(response.title);
var array = response.showdates;
$("#dates").html("");
for(var i=0;i<array.length;i++){
	$("#dates").append("<button class='btn btn-outline-primary' onclick='getScreens(this)'>" + array[i] + "</button>");
}

function getScreens(p){
	var showdate = p.innerHTML;
	var movieid = response.movieid;
	$.ajax({
		type:"GET",
		url:"getshows",
		data:{
			movieid:movieid,
			showdate:showdate
		},
		async:false,
		success:function(data){
			if(data != null){
				var response = $.parseJSON(data);
				
				$("#tablebody").html("");
				var screen = 0;
				var tableBody = "";
				for(var i=0;i<response.length;i++){
					if(response[i].screen != screen){
					screen = response[i].screen;
					tableBody += "<tr><td>" + response[i].screen + "</td><td><btn class='btn btn-sm btn-outline-secondary' name='" + showdate + "'onclick='seats(this)'>" + response[i].showtime + "</btn>&nbsp;&nbsp";
					for(var j=i+1;j<response.length;j++){
						if(response[j].screen == screen){
							tableBody += "<btn class='btn btn-sm btn-outline-secondary' name='" + showdate + "' onclick='seats(this)'>" + response[j].showtime + "</btn>&nbsp;&nbsp";
						}
					}
					tableBody += "</td></tr>";
					}
			        
				}
				$("#tablebody").html(tableBody);
			}
		}
	})
}

function seats(t){
	var mid = response.movieid;
	var mname = response.title;
	var showdate = t.getAttribute("name");
	var showtime = t.innerHTML;
	var screen = t.parentElement.parentElement.children[0].innerHTML;
	window.location.href = "seats?mid=" + mid + "&" + "mname=" + mname + "&" + "showdate=" + showdate + "&" + "showtime=" + showtime + "&" + "screen=" + screen;

	
	
}
</script>
</body>
</html>