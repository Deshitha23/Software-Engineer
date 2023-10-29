<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
    <title>Add Promotion</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Main</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body>

<div class="container py-5">
    <div class="row">
        <div class="col-lg-7 mx-auto">
            <div class="bg-white rounded-lg shadow-lg rounded-3 p-5">
                <div class="tab-content">
                    <div id="nav-tab-card" class="tab-pane fade show active">
                    <h2 > <a href="#" onclick="admin()" class="side-nav"> Home</a></h2>
                            <br>
                            <h3 class="display-4 text-center">Add Promotion</h3>
                            <br>
                                          
                            <!-- <p class="h6"><span>*</span><b>Required fields</b></p> -->
                            <div class="mb-3">
                                <label for="promocode" class="h5"><span style="color:red;">*</span> Promo code</label>
                                <input type="text" id="promocode" placeholder="Enter promocode" required="true"
                                            class="form-control" path="promoCode"/>
                            </div>
                            <div class="mb-3">
                                <label for="discountvalue" class="h5"><span style="color:red;">*</span> Discount(%)</label>
                                <input type="text" id="discountvalue" placeholder="Enter discount value" required="true"
                                            class="form-control" path="discountValue"/>
                            </div>
                            <div class="mb-3">
                                <label for="startdate" class="h5"><span style="color:red;">*</span> Start Date</label>
                                <input type="date" id="startdate" placeholder="Select start date" required="true"
                                            class="form-control" path="startDate"/>
                            </div>
                            <div class="mb-3">
                                <label for="enddate" class="h5"><span style="color:red;">*</span> End Date</label>
                                <input type="date" id="enddate" placeholder="Select End date" required="true"
                                            class="form-control" path="endDate"/>
                            </div>
                            <br>
                            <div>
                                <button class="btn btn-success btn-login fw-bold" onclick="promo()" type="submit">Save
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

  
  function promo(){
	  var promocode = $("#promocode").val();
		 var discountvalue = $("#discountvalue").val();
		 var startdate = $("#startdate").val();
		 var enddate = $("#enddate").val();
		 
		   if( promocode !="" && discountvalue != "" && startdate != "" && enddate !=""){
			
		         
		 
			   $.ajax({
				 type:"POST",
				 url:"promo",
				 data:{
					 promocode:promocode,
					 discountval:discountvalue,
					 startdate:startdate,
					 enddate:enddate,
					 
				 },
				 async:false,
				 success:function(data){
					 if(data != null){
						 var response = $.parseJSON(data);
						 if(response.hasOwnProperty("Success")){
							 alert(response.Success);
								window.location.href="Managepromotions";
							
						 }
						 else{
							 alert(response.Error);
						 }
					 }
					 
				 }
			 });
			 
			  
		 }
		  else{
			 alert("Enter all the Values ");
		 }
		 
		 
		
  } 
  </script>
  
</body>
<html>
