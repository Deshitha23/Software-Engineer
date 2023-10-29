<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang=”en” manifest="/cache.appcache">
<head>
<title>Movie info</title>
<link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    /><style>
 h3{
 color:blue;
 }
 p,span{
 font-style: italic;
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



<div class="container py-4">
    <div class="row bg-secondary pt-5 pb-5">
        <div class="col-4 text-center">
            <img src="" id="picture" class="img-fluid rounded " height="400px" width="400px">
        </div>
        
        <div class="col-4 pt-5">
            <h1 class="text-white" id="title"></h1><br>
            <p class="text-white" id="category"></p>
            <p class="text-white" id="review"></p>
            <p class="text-white" id="rating"></p>
            <span id="details" class="text-white"></span><br><br>
            <button class="btn btn-lg btn-outline-light" id="cinema" onclick="showTrailer(this)">Play trailer</button><br><br>
            
            <button class="btn btn-lg btn-light" id="bookticket" style="display:none;" onclick="bookTickets(this)">Book Tickets</button>

        </div>
        <div class="col-4 text-center">
        </div>
        
    </div>
    <br>
    <div class="row">
    <h3>Director</h3>
    <p id="director"></p>

    </div>
    <div class="row">
    <h3>Producer</h3>
    <p id="producer"></p>

    </div>
    
    <div class="row">
    <h3>Synopsis</h3>
    <p id="synopsis"></p>

    </div>
    <div class="row">
        <h3>Cast</h3>
        <p id="cast"></p>
    </div>
    </div>

<div class="modal fade" id="playvideo" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content ">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Watch Trailer</h5>
        
      </div>
      <div class="modal-body">
        <iframe width="420" height="345" id="trailer" src=""></iframe>
      </div>
      
    </div>
  </div>
</div>
        
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 
<script>

function showTrailer(p){
	//alert(pointer.getAttribute("name"));
		$("#trailer").attr("src",p.getAttribute("name"));

	$("#playvideo").modal("show");
}



var moviedata = '${movie}';
var response = $.parseJSON(moviedata);
$("#cinema").attr("name",response.trailer);
$("#bookticket").attr("name",response.mid);

$("#director").text(response.director);
$("#producer").text(response.producer);
$("#synopsis").text(response.synopsis);
$("#cast").text(response.cast);
$("#picture").attr("src",response.image);
$("#title").text(response.title);
$("#category").text("Genre: " + response.category);
$("#review").text("Review: " + response.review + "/5");
$("#rating").text("MPAA-US film rating code: " + response.rating);
$("#details").html(response.language + " <b>.</b> " + response.duration + " <b>.</b> " + response.releasedate);

if(response.status == 1){
document.getElementById("bookticket").style.display = "";
}

function bookTickets(pointer){
	window.location.href = "booktickets?movieid=" + pointer.getAttribute("name") + "&" + "title=" + response.title;
}
</script>
</body>
</html> 