<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
    <title>Add a movie</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<style>
span{
color:red;
}
</style>
</head>
<body>
<div class="container py-5">
    <div class="row">
        <div class="col-lg-7 mx-auto">
            <div class="bg-white rounded-lg shadow-lg rounded-3 p-5">
                <div class="tab-content">
                    <div id="nav-tab-card" class="tab-pane fade show active">
                            <h3 class="display-4 text-center text-primary">Add a movie</h3>
                            <br>
                            <div class="mb-3">
                                <label for="title" class="h5"><span>*</span> Movie title</label>
                                <input type="text" id="title" placeholder="Enter title" 
                                            class="form-control" />
                            </div>
                           
                             <div class="mb-3">
                                <label for="language" class="h5"><span>*</span> Language</label>
                                <input type="text" id="language" placeholder="Enter language" 
                                            class="form-control" />
                            </div>
                             <div class="mb-3">
                                <label for="releasedate" class="h5"><span>*</span> Movie release date</label>
                                <input type="date" id="releasedate"  
                                            class="form-control" />
                            </div>
                             <div class="mb-3">
                                <label for="duration" class="h5"><span>*</span> Movie duration</label>
                                <input type="text" id="duration" placeholder="Enter duration" 
                                            class="form-control" />
                            </div>
                            <div class="mb-3">
                                <label for="director" class="h5"><span>*</span> Director</label>
                                <input type="text" id="director" placeholder="Enter director name" 
                                            class="form-control" />
                            </div>
                            <div class="mb-3">
                                <label for="producer" class="h5"><span>*</span> Producer</label>
                                <input type="text" id="producer" placeholder="Enter producer name" 
                                            class="form-control" />
                            </div>
                            <div class="mb-3">
                                <label for="cast" class="h5"><span>*</span> Cast</label>
                                <input type="text" id="cast" placeholder="Enter movie cast" 
                                            class="form-control" />
                            </div>
                            <div class="mb-3">
                                <label for="synopsis" class="h5"><span>*</span> Synopsis</label>
                                <textarea id="synopsis" 
                                            class="form-control"></textarea>
                            </div>
                             <div class="mb-3">
                                <label for="category" class="h5"><span>*</span> Category</label>
                                <select class="form-control" id="category">
                                <option value="" selected disabled>Choose category</option>
                                
                                <option value="Action">Action</option>
                                <option value="Horror">Horror</option>
                              <option value="Thriller">Thriller</option>
                                
                                <option value="Comedy">Comedy</option>
                                <option value="Romance">Romance</option>
                                
                                
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="review" class="h5"><span>*</span> Choose review</label>
                                <select class="form-control" id="review">
                                  <option value="" selected disabled>Enter review out of 4</option>
                                
                                <option value="1">1</option>
                                <option value="1.5">1.5</option>
                                <option value="2">2</option>
                                <option value="2.5">2.5</option>
                                                                <option value="3">3</option>
                                                                <option value="3.5">3.5</option>
                                                                
                                
                                
                                
                                </select>
                            </div>
                             <div class="mb-3">
                                <label for="rating" class="h5"><span>*</span> Choose MPAA-US film rating</label>
                                <select class="form-control" id="rating">
                                                                <option value="" selected disabled>Choose rating</option>
                                 <option value="R">R</option>
                                <option value="X">X</option>
                                <option value="G">G</option>
                                <option value="M">M</option>
                               
                                                               
                                
                                
                                
                                </select>
                            </div>
                             <div class="mb-3">
                                <label for="picture" class="h5"><span>*</span> Upload movie picture</label>
                                <input type=file id="picture"  
                                            class="form-control" />
                            </div>
                            <div class="mb-3">
                                <label for="trailer" class="h5"><span>*</span> Movie Trailer </label>
                                <input type="text" id="trailer" placeholder="Provide movie trailer" 
                                            class="form-control" />
                            </div>
                           
                            <br>
                            <div>
                                <button class="btn btn-success btn-lg" type="button" onclick="addMovie()">Add Movie
                                </button>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <script>
  
  /* if("${Error}" != ""){
	  alert("${Error}");
  } */
  function login(){
		window.location.href="login";
	}
  function admin(){
		window.location.href="admin";
	}
  function uploadpic(){
	var image;
	
  }
  
  function addMovie(){
		var title = $("#title").val();
		var category = $("#category").val();
		var language = $("#language").val();
		var releasedate = $("#releasedate").val();
		var duration = $("#duration").val();

		var director = $("#director").val();
		var producer = $("#producer").val();
		var cast = $("#cast").val();
		var synopsis = $("#synopsis").val();
		var review = $("#review").val();
		var rating = $("#rating").val();
		var trailer = $("#trailer").val();
		var picture = $("#picture").val();
		picture = picture.split("\\")[2];

		
		 if(title != "" && category != "" && director != "" && producer != "" && category != "" && synopsis != "" 
				 && review != "" && rating != "" && trailer != "" && picture != "" 
				 && language != "" && releasedate != "" && duration != ""){
			
			$.ajax({
				type:"POST",
				url:"addMovie",
				data:{
					title:title,
					category:category,
					director:director,
					producer:producer,
					cast:cast,
					synopsis:synopsis,
					review:review,
					rating:rating,
					trailer:trailer,
					picture:picture,
					language:language,
					releasedate:releasedate,
					duration:duration
				},
				async:false,
				success:function(data){
					if(data != null){
						var res = $.parseJSON(data);
						if(res.hasOwnProperty("success")){
							alert(res.success);
				           /*  $("#title").val("");
				        	$("#category").val("");
				        	$("#director").val("");
				        	$("#producer").val("");
				        	$("#cast").val("");
				        	$("#synopsis").val("");
				        	$("#review").val("");
				        	$("#rating").val("");
				        	$("#trailer").val("");
				        	$("#picture").val("");
				        	$("#language").val("");
				        	$("#releasedate").val("");
				        	$("#duration").val(""); */
							window.location.href="addmovies";


						}
						

					}
				}
			});
		}
		else{
			alert("Please provide all details.");
		}
	 	
	}

/*   function addmovie(){
	  var title = $("#title").val();
		 var genre = $("#genre").val();
		 var cast = $("#cast").val();
		 var synopsis = $("#synopsis").val();
		 var director = $("#director").val();
		 var producer = $("#producer").val();
		 var rating = $("#rating").val();

		 //var myfile = $("#myfile").val();
		 
		   if( genre !="" && title != "" && cast != "" && synopsis !="" && director != "" && producer!="" && rating!="" ){
			
		         
		 
			   $.ajax({
				 type:"POST",
				 url:"addmovie",
				 data:{
					 title:title,
					 genre:genre,
					 cast:cast,
					 synopsis:synopsis,
					 director:director,
					 producer:producer,
					 rating:rating
					 
				 },
				 async:false,
				 success:function(data){
					 if(data != null){
						 var response = $.parseJSON(data);
						 if(response.hasOwnProperty("success")){
							 alert(response.success);
								window.location.href="addmovies";
							
						 }
						 else{
							 alert(response.error);
						 }
					 }
					 
				 }
			 });
			 
			  
		 }
		  else{
			 alert("Enter all the Values ");
		 }
		 
		 
		
  }  */
  
  </script>
</body>
<html>
