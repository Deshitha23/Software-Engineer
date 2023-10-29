<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang=”en” manifest="/cache.appcache">
<head>
<title>search</title>
<link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    /><style>
</style>
</head>
<body>

    <div >
        <br><div style="text-align:center;">
    <input  class="" id="searchid" type="text" placeholder="Search by title or category" name="search2">
    <button  onclick="search()" class=" btn btn-sm btn-success" type="button">search</button>
</div>
                         
        <br>
        <hr size="3" noshade>
        <br>
        <br>
        <div class="container">
        <div class="" style="display:none;" id="nowshowing">
        <h2 class="text-primary">Now Showing</h2>
         <table class="table">
                <tr>
                                        <th id="" style="display:none;">Movie Id</th>
                    
                    <th id="">Poster</th>
                    <th id="" >Title</th>
                                        <th id="">MPAA-US Film Rating</th>
                                        <th id="">Trailer</th>
                    
                    
                </tr>
                <tbody id="nsmovies">
                
                </tbody>

                
                 

                
            </table>
		</div>
		
		 <div class="" style="display:none;" id="comingsoon">
        <h2 class="text-primary">Coming soon</h2>
         <table class="table">
                <tr>
                                        <th id="" style="display:none;">Movie Id</th>
                    
                    <th id="">Poster</th>
                    <th id="" >Title</th>
                                        <th id="">MPAA-US Film Rating</th>
                                        <th id="">Trailer</th>
                    
                    
                </tr>
                <tbody id="csmovies">
                
                </tbody>

                
                 

                
            </table>
		</div>
		</div>

    </div>
    
        <div class="modal fade" id="pt" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header border-bottom-0">
        <h5 class="modal-title" id="exampleModalLabel">Play trailer</h5>
          
      </div>
        <div class="modal-body">
         <iframe width="450" height="350" src="" id="video"></iframe>
        </div>
       
    </div>
  </div>
</div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <script>
  function search(){

		

	 var search = $("#searchid").val();
	 if(search != "" ){
		 $.ajax({
			 type:"POST",
			 url:"search",
			 data:{
				 search:search
				 
			 },
			 async:false,
			 success:function(data){
				 if(data != null){
					 //alert(data);
						var result = $.parseJSON(data);
						var nsbody="";

						var csbody="";
						if(result.length != 0){
						for(var i=0;i<result.length;i++)
							{
							
							if(result[i].status == 1){
								 nsbody += "<tr><td style='display:none;'>" + result[i].movieid + "</td><td><img height='100px' width='100px' src='" + result[i].picture + "'></td><td><a href='moviepage?movie=" + result[i].movieid + "'>" + result[i].title + "</a></td><td>" + result[i].rating + "</td><td><button name='" + result[i].trailer + "' onclick='playTrailer(this)'>Play trailer</button></td></tr>"; 
							}
							else{
								 csbody += "<tr><td style='display:none;'>" + result[i].movieid + "</td><td><img height='100px' width='100px' src='" + result[i].picture + "'></td><td><a href='moviepage?movie=" + result[i].movieid + "'>" + result[i].title + "</a></td><td>" + result[i].rating + "</td><td><button name='" + result[i].trailer + "' onclick='playTrailer(this)'>Play trailer</button></td></tr>"; 
							}
							}
						if(nsbody != "" && csbody != ""){
							$("#nsmovies").html(nsbody);
							document.getElementById("nowshowing").style.display = "";
							$("#csmovies").html(csbody);
							document.getElementById("comingsoon").style.display = "";
						}
						else if(csbody != "" && nsbody == ""){
							$("#nsmovies").html("");
							document.getElementById("nowshowing").style.display = "none";
							$("#csmovies").html(csbody);
							document.getElementById("comingsoon").style.display = "";

						}
						else{
							$("#nsmovies").html(nsbody);
							document.getElementById("nowshowing").style.display = "";
							$("#csmovies").html("");
							document.getElementById("comingsoon").style.display = "none";
						}

				 }
						else{
							alert("No movies found");
							document.getElementById("nowshowing").style.display = "none";
							document.getElementById("comingsoon").style.display = "none";

						}
				 
				 
			 }
		 }
	 });
	 
	}
	 else{
		 alert("Please type something");
	 }
		
  }
 function playTrailer(p){
			$("#pt").modal("show");
			$("#video").attr("src",p.getAttribute("name"));
}
 function Managepromotions(){
		window.location.href="Managepromotions";
		
  }
 
 function manageusers(){
		window.location.href="manageusers";
		
}
 
 
 </script>
</body>
</html> 