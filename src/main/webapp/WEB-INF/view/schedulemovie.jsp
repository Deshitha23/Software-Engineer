<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
    <title>schedule</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body>

<div class="container py-5">
    <div class="row">
        <div class="col-lg-7 mx-auto">
            <div class="bg-white rounded-lg shadow-lg rounded-3 p-5">
                <div class="tab-content">
                    <div id="nav-tab-card" class="tab-pane fade show active">
                            <h3 class="display-4 text-center text-primary">Schedule a movie</h3>
                            <br>
                            
                             <div class="mb-3">
                                <label for="showdate" class="h5"><span>*</span> Choose date</label>
                                <input type="date" id="showdate"  
                                            class="form-control" />
                            </div>
                             
                             <div class="mb-3">
                                <label for="screen" class="h5"><span>*</span> Choose screen</label>
                                <select class="form-control" id="screen">
                                <option value="" selected disabled>Choose screen</option>
                                
                                <option value="1">1</option>
                                <option value="2">2</option>
                              <option value="3">3</option>
                                
                              
                                
                                
                                </select>
                            </div>

                             <div class="mb-3">
                                <label for="showtime" class="h5"><span>*</span> Choose show time</label>
                                <select class="form-control" id="showtime">
                               <option value="" selected disabled>Choose show time</option>
                                 <option value="10:00">10:00</option>
                                <option value="15:00">15:00</option>
                                <option value="19:00">19:00</option>
                               
                                                               
                                
                                
                                
                                </select>
                            </div>
                             
                           
                            <br>
                            <div>
                                <button class="btn btn-success btn-lg" type="button" onclick="schedule()">Schedule movie
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
function schedule(){
	var movieid = "${movieid}";
	var showdate = $("#showdate").val();
	var screen = $("#screen").val();
	var time = $("#showtime").val();
	//alert(time);
	if(movieid != "" && showdate != "" && screen != "" && time != null){
		$.ajax({
			type:"POST",
			url:"schedule",
			data:{
				movieid:movieid,
				showdate:showdate,
				screen:screen,
				showtime:time
			},
			async:false,
			success:function(data){
				if(data != null){
					var res = $.parseJSON(data);
					if(res.hasOwnProperty("success")){
						
				        alert(res.success);
					}
					else{
						alert(res.error);
					}
						
				}
			}
		});
	}
	else{
		alert("Please enter all details");
	}
		

	
}

</script>
</body>
</head>