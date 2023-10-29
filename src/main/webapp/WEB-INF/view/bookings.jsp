<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Booking history</title>
    <style>
    
 html,body{
    margin:0;
    height: 100%;
    font-family: 'Courier New', Courier, monospace;
}
.nav-bg{
    background: rgb(51 53 69);
}
.cl{
    -webkit-font-smoothing: antialiased !important;
}
.nav-link{
  color: white !important;
}
.nav-item{
    justify-content: space-around !important;
}
.cas-logo{
    height: 5rem;
    width: 5rem;
    margin-right: 1rem;
    /* padding: 2rem; */
}
.cas-brand, .navbar-brand{
    /* font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; */
    font-family: 'Rampart One', cursive;
    /* font-style: italic; */
    text-align: center !important;
    /* margin-left: 9rem; */
    color: rgb(242, 135, 135) !important;
    font-size: 4rem !important;
    position: relative;
    right:15rem;
    
}
.promo-main{
    height: 100%;
    width: 100%;
}
.posture{
    height: 100%;
    width: 100%;
}
.posture:hover{
    transform: scale(1.3);
}
.released-wrapper{
    margin-top: 1rem;
}
.released{
    color: white;
    font-size: 3rem;
}
.released:hover{
    transform: translate(-5px, -5px);
}
.released:hover::before{
    transform: translate(2.5px, 2.5px);
}
.released:hover::after{
    transform: translate(5px, 5px);
}
/* .inn{
    height: 60rem;
    width: 50rem;
} */
.image{
    height: 30rem !important;
    /* width: 50rem !important; */
}
.books{
    padding: 1rem;
}
.posture-wrapper{
    padding-top: 2rem;
}
.genre-btn{
    margin-top: 1rem !important;
    font-size: 2.5rem !important;
}

@media screen and (max-width: 1538px) {
    .cas-brand, .navbar-brand{
        position: relative;
        right: 5rem;
        
    }
    .posture{
        height: 100%;
        width: 100%;
    }
}
@media screen and (max-width: 1284px) {
    .cas-brand, .navbar-brand{
        position: relative;
        right: 0rem;
    }
    .posture{
        height: 100%;
        width: 100%;
    }
}

     </style>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" integrity="sha512-vKMx8UnXk60zUwyUnUPM3HbQo8QfmNx7+ltw8Pm5zLusl1XIfwcxo8DbWCqMGKaWeNxWA8yrx5v3SaVpMvR3CA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	
</head>
<body class="bg bg-light">
<%
  response.addHeader("Pragma", "no-cache");
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.addHeader("Cache-Control", "pre-check=0, post-check=0");
  response.setDateHeader("Expires", 0);
%>

    <div>
      <nav class="navbar navbar-expand-lg navbar-light nav-bg">
        <div class="container-fluid d-flex justify-content-center">
          <div class="d-flex w-75">
          <!-- <img class="cas-logo" src="../images/apple-touch-icon.png" alt="" /> --> 

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="home"
                    >Home</a
                  >
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="editprofile" >Edit Profile</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link"  href="bookinghistory">My Bookings</a>
                </li><li class="nav-item">
                  <a class="nav-link"  href="managecards">Manage Cards</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="logout">logout</a>
                </li>
              </ul>
              <a class="navbar-brand cas-brand" href="#">Click a Show</a>
              <div class="d-flex">
                

                <button class="btn btn-outline-danger" type="submit">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="16"
                    height="16"
                    fill="currentColor"
                    class="bi bi-search"
                    viewBox="0 0 16 16"
                    onclick="search()"
                  >
                    <path
                      d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"
                    />
                  </svg>
                </button>
              </div>
            </div>
          </div>
        </div>
      </nav>
    </div>
 <div class="container">
<br>
<br>


<div class="row" id="history">


</div>
</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 <script>
 var userid = "${sessionScope.userid}";


function redirectToLogin(){
	window.location.href = "login";
	
}




function logout(){
	$.ajax({
		type:"GET",
		url:"logout",
		data:{},
		async:false,
		success:function(data){
			toastr.options.closeButton = true;
            toastr.options.positionClass = 'toast-top-center';
            toastr.success('You are logged out. Redirecting to login page', ' Success');
            setTimeout(redirectToLogin, 5000);
		}
	});
}

getBookings();
function getBookings(){
	$.ajax({
		type:"GET",
		url:"bookings",
		data:{
			uid:userid
		},
		async:false,
		success:function(data){
			if(data != null){
				var res = $.parseJSON(data);
				//alert(data);
				for(var i=0;i<res.length;i++){
					$("#history").append('<div class="col col-md-4 col-sm-12"><div class="card text-white bg bg-dark" style="width: 21rem;">'+
					  '<div class="card-header"><h5>Booking Id: ' + res[i].id + '</h5></div> <div class="card-body">'+
					    '<h6 class="card-title">Movie: ' + res[i].mn + '</h6><br>' + 
					    '<h6 class="card-subtitle mb-2 text-muted">Date: ' + res[i].sd + '</h6><br>' + 
					    '<h6 class="card-subtitle mb-2 text-muted">Time: ' + res[i].st + '</h6><br>' + 
						'<h6 class="card-subtitle mb-2 text-muted">Screen Number: ' + res[i].screen + '</h6><br>' + 
							'<h6 class="card-subtitle mb-2 text-muted">Seats: ' + res[i].seats + '</h6><br>' + 
							'<h6 class="card-subtitle mb-2 text-muted">Price: ' + res[i].price + '$</h6><br></div></div></div>');	
				}
				}
				}
		});
	
	}



</script>
</body>
</html>