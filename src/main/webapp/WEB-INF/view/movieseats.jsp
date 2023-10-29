<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Select seats</title>
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
<body class="bg bg-secondary">
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
              <a class="navbar-brand cas-brand" href="home">Click a Show</a>
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
    <div class="container mt-2 px-2">
        <div class="mb-4">
            <h2 class="text-white"><b>Seat Selection</b></h2>
        </div>
        <div class="row">
                <div class="col-md-4">
            <div class="card card-blue p-3 text-black mb-3">
               <h4 class="text-primary">Summary</h4><br>
                    <h6 id="mname"></h6>
            
                    <h6 id="showdate" ></h6>
                    <h6 id="showtime"></h6>
                                        <h6 id="screen"></h6>
                    
                    <h6 id="seats"></h6>
                                        <h6 id="Total"></h6>
                    
            </div>
                  <div class="card card-blue p-3 text-black mb-3">
               <h5 class="text-primary">Price details</h5><br>
                                                            <h6>Kid: 10$</h6>

                    <h6>Adult: 20$</h6>
                    <h6>Senior: 30$</h6>

            </div>
            <div class="card card-blue p-3 text-black mb-3" id="audience">
               

            </div>
            <div class="card card-blue p-3 text-black mb-3">
                <button class="btn btn-lg btn-primary" onclick="checkout()">Checkout</button>
        </div>

</div>
            <div class="col-md-8">
                <div class="card p-3">
                <div>
                     <h6 class="text-uppercase" class="text-primary">Select a seat</h6>
                     <div style="float:right">
                    <button class="btn btn-sm btn-secondary" disabled>Booked</button>
                                        <button class="btn btn-sm btn-outline-dark" disabled>Available</button>
					                                        <button class="btn btn-sm btn-dark" >Selected</button>
					                    </div>
					                    </div><br>
                            <table class="table bg-light " style='width:25%; margin-right: 300px;'>
                            <thead>
                            <tr>
                            <th></th>
                            <th>1</th>
                            <th>2</th>
                            <th>3</th>
                            <th>4</th>
                            <th>5</th>
                            <th>6</th>
                            <th>7</th>
                            <th>8</th>
                            <th>9</th>
                                                        <th></th>
                            
                            <th>10</th>
                            <th>11</th>
                            <th>12</th>
                            <th>13</th>
                            <th>14</th>
                                                        <th>15</th>
                                                        <th>16</th>
                                                        <th>17</th>
                                                        <th>18</th>
                            
        
    
      </tr>
    </thead>
    <tbody id="allseats">
    
       

    </tbody>
  </table>
  <hr style="height:25px;width:630px;">
  <div id="noseats"></div>
    <pre id="arrPrint"></pre>
  
  
</div>

        </div>

</div>
</div>
<div id="checkoutmodal" class="modal fade">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title" id="title">Buy Tickets</h1>
            </div>
            <div class="modal-body">
                     <div class="form-group">
                        <label class="control-label" id="ticketprice"></label>
                       
                    </div><br>
                    <div class="form-group">
                        <label class="control-label">Apply Promotion</label>
                        <div>
                            <input type="text" class="form-control input-lg" id="promocode" value=""><br>
                            <button class="btn btn-sm btn-success" onclick="promotion()">Apply</button><br>
                            <p id="errormessage"></p>
                        </div>
                    </div><br>
                    
                    <div class="form-group">
                        <label class="control-label">Select card</label>
                        <div>
                            <select class="form-control input-lg" id="paymentcard">
                            </select><br>
                            						<button class="btn btn-sm btn-primary" onclick="addcard()">Add Card</button>
                            
                        </div><br>
                    </div>
                        
                    <br>
                    
                     <div class="form-group">
                        <label class="control-label">CVV</label>
                        <div>
                            <input type="password" class="form-control input-lg" id="cvv" value="">
                        </div>
                    </div><br>
                    
                    <div class="form-group">
                        <div>
                            <button type="button" class="btn btn-success" id="button" onclick="pay()">Pay Now</button>
                        </div>
                    </div>
               
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 <script>
 var userid = "${sessionScope.userid}";
 
 function addcard(){
	 window.location.href="managecards";
 }

 var data = '${moviedata}';
 var res = $.parseJSON(data);
 setSeats();

 function setSeats(){
	 $("#mname").text("Movie: " + res.mname);
	 $("#showdate").text("Show Date: " + res.showdate);
	 $("#showtime").text("Show Time: " + res.showtime);
	 $("#screen").text("Screen Number: " + res.screen);

	 var row = "";
	 var ch = 'A';
	 for(var i=1;i<=12;i++){
		 row="<tr><td>" + ch + "</td>";
		 for(var j=1;j<=18;j++){
			if(j==10){
				row+="<td></td>";
			}
			 var seatno = ch + j.toString();
			 if((res.seats).includes(seatno)){
				 row += "<td><button class='btn btn-md btn-secondary' name='" + seatno + "' disabled></button></td>";
				
			 }
			 else{
				 row += "<td><button class='btn btn-md btn-outline-dark' onclick='clickSeat(this)' name='" + seatno + "'></button></td>";

			 }
		 
		 }
		 row += "</tr>";
		 $("#allseats").append(row);
		 ch = String.fromCharCode(ch.charCodeAt(0) + 1);
		 
		}
	 
 }
    var count = 0;
    var s = [];
function clickSeat(t){
	if(!s.includes(t.getAttribute("name"))){
	if(count < 4 ){
		if(t.className == "btn btn-md btn-outline-dark"){
	        t.className = "btn btn-md btn-dark";
	        count = count  + 1;
			s.push(t.getAttribute("name"));
			$("#audience").append('<div class="ticket-row"><label id="' + t.getAttribute("name") + '">' + t.getAttribute("name") + '</label> <select onchange="price()" class="sel">'+
                  '<option value="" selected disabled>Choose audience type</option><option value="kid">Kid</option><option value="adult">Adult</option><option value="senior">Senior</option></select></div><br>');
 	        document.getElementById("noseats").innerHTML = "Total seats selected: " + count + " seats";
     }
	    
		}
	else{
		
        alert("You cannot select more than 4 seats");
	

    
	}
	}
	else{
	        t.className = "btn btn-md btn-outline-dark";
	        count = count - 1;
 	        document.getElementById("noseats").innerHTML = "Total seats selected: " + count + " seats";
 	         var index = s.indexOf(t.getAttribute("name"));
	        if (index !== -1) {
	          s.splice(index, 1);
	        }
	        document.getElementById(t.getAttribute("name")).parentElement.nextElementSibling.remove();
	        document.getElementById(t.getAttribute("name")).parentElement.remove();



	    
	}
	$("#seats").text("Seats: " + s);
	price();
}
</script>
 
<script>
var total=0;

function price(){
	total=0;
	var arr = document.getElementsByClassName("sel");
	for(var i=0;i<arr.length;i++){
		if(arr[i].value == "kid"){
			total += 10;
		}
		else if(arr[i].value == "adult"){
			total += 20;
		}
		else if(arr[i].value == "senior"){
			total += 30;
		}
		else{
			
		}
			
			
	}
	$("#Total").text("Total amount: " + total + "$");
}

function checkout(){
	if(s.length == 0){
        alert('select atleast 1 seat');

	}
	else{
		var arr = document.getElementsByClassName("sel");
		var flag=0;
		for(var i=0;i<arr.length;i++){
			if(arr[i].value == ""){
				flag=1;
		        break;
			}
		}
		if(flag==0){
			if( userid != ""){
			$("#checkoutmodal").modal("show");
			$("#ticketprice").text("Total price: " + total + "$");
			$.ajax({
				type:"GET",
				url:"getCards",
				data:{
					userid:"${sessionScope.userid}"
				},
				async:false,
				success:function(data){
					var res = $.parseJSON(data);
					var pc = res[0];
					$("#paymentcard").append("<option name='0' value='" + pc.id + "' selected>" + "XXXX-XXXX-XXXX-" + pc.cn + "</option>");
					for(var i=1;i<res.length;i++){
						$("#paymentcard").append("<option name='" + i + "' value='" + res[i].id + "'>" + "XXXX-XXXX-XXXX-" + res[i].cn + "</option>");

					}
				}
				
			});
			}
			else{
	            alert('Please login to book the tickets');
	            window.location.href="login";
 
			}
		}
		else{
	        alert('select type of audience for all seats');
		}
	}
}



function redirectToHistory(){
	window.location.href = "bookinghistory";
	
}

function promotion(){
	var pcode = $("#promocode").val();
	if(pcode != ""){
		$.ajax({
			type:"POST",
			url:"applyPromo",
			data:{
				pcode:pcode,
				price:total
			},
			async:false,
			success:function(data){
				var res = $.parseJSON(data);
				if(res.hasOwnProperty("Success")){
					$("#ticketprice").text("Updated Price: " + res.updatedprice + "$");
					total = res.updatedprice;
					$("#errormessage").text("Promotion applied");

				}
				else{
					$("#errormessage").text(res.Error);

				}
			}
		});

	}
	else{
        alert('Enter promocode');
	
	}
}

function pay(){
	//alert(total);
	var cn = $("#paymentcard").val();

	var cvv = $("#cvv").val();
	if(cvv != ""){
		var mid = res.mid;
		var mname = res.mname;
		var sd = res.showdate;
		var st = res.showtime;
		var screen = res.screen;
		var seats = s.toString();
		var price = total;
		
		$.ajax({
			type:"POST",
			url:"pay",
			data:{
				uid:userid,
				mid:mid,
				mname:mname,
				sd:sd,
				st:st,
				screen:screen,
				seats:seats,
				price:price,
				cvv:cvv,
				cn:cn
			},
			async:false,
			success:function(data){
				var res = $.parseJSON(data);
				if(res.hasOwnProperty("Success")){
			       alert(res.Success);
			        $("#checkoutmodal").modal("hide");
		            setTimeout(redirectToHistory, 3000);

				}
				else{
			        alert(res.Error);

				}
			}
		});
	}
	else{
        alert('Please enter cvv');

	}
	
}





</script>
</body>
</html>