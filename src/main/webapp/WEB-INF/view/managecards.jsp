<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage cards</title>
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
                  <a class="nav-link" href="editprofile">Edit Profile</a>
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

<button class="btn btn-success" onclick="showaddcardmodal()">Add Card</button>

<br>
<br>

<div class="row">
<div class="col col-md-4 col-sm-12">
<label>Primary Card</label>
<div class="card" style="width: 21rem;">
  <div class="card-body">
    <h6 class="card-title" id="pccn"></h6><br>
    <h6 class="card-subtitle mb-2 text-muted" id="pce"></h6><br>
    <h6 class="card-subtitle mb-2 text-muted" id="pccvv">CVV: XXX</h6><br>
	<h6 class="card-subtitle mb-2 text-muted" id="pcct"></h6><br>
	    
<button class="btn btn-sm btn-success" id="pcedit" onclick="edit(this)">Edit Card</button>

  </div>
</div>
</div>
<div class="col col-md-4 col-sm-12" id="ac1" style="display:none;">
<label></label>

<div class="card" style="width: 21rem;">
  <div class="card-body">
    <h6 class="card-title" id="ac1cn"></h6><br>
    <h6 class="card-subtitle mb-2 text-muted" id="ac1e"></h6><br>
    <h6 class="card-subtitle mb-2 text-muted" id="ac1cvv">CVV: XXX</h6><br>
        <h6 class="card-subtitle mb-2 text-muted" id="ac1ct">Debit</h6><br>
    
    
<button class="btn btn-sm btn-success" id="ac1edit" onclick="edit(this)">Edit Card</button>
<button class="btn btn-sm btn-danger" id="ac1remove" onclick="remove(this)">Remove Card</button>
 <button class="btn btn-sm btn-secondary" id="ac1primary" onclick="primary(this)">Set as primary</button>
 
  </div>
</div>
</div>
<div class="col col-md-4 col-sm-12" id="ac2" style="display:none;">
<label></label>

<div class="card" style="width: 21rem;">
  <div class="card-body">
    <h6 class="card-title" id="ac2cn"></h6><br>
    <h6 class="card-subtitle mb-2 text-muted" id="ac2e"></h6><br>
    <h6 class="card-subtitle mb-2 text-muted" id="ac2cvv">CVV: XXX</h6><br>
        <h6 class="card-subtitle mb-2 text-muted" id="ac2ct"></h6><br>
    
    
<button class="btn btn-sm btn-success" id="ac2edit" onclick="edit(this)">Edit Card</button>
<button class="btn btn-sm btn-danger" id="ac2remove" onclick="remove(this)">Remove Card</button>
 <button class="btn btn-sm btn-outline-secondary" id="ac2primary" onclick="primary(this)">Set as primary</button>
 
  </div>
</div>
</div>
</div>
</div>

<!-- Modal HTML Markup -->
<div id="addcardmodal" class="modal fade">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title" id="title">Add Card</h1>
            </div>
            <div class="modal-body">
                     <div class="form-group">
                        <label class="control-label">Card Type</label>
                        <div>
                            <select class="form-control input-lg" id="cardtype">
                            <option value="2">Debit</option>
                            <option value="1">Credit</option>
                            </select>
                        </div>
                    </div><br>
                    <div class="form-group">
                        <label class="control-label">Card Number</label>
                        <div>
                            <input type="text" class="form-control input-lg" id="cardno" value="">
                        </div>
                    </div><br>
                    <div class="form-group">
                        <label class="control-label">Expiry Month</label>
                        <div>
                            <input type="number" class="form-control input-lg" min="1" max="12" id="emonth">
                        </div>
                    </div><br>
                     <div class="form-group">
                        <label class="control-label">Expiry Year</label>
                        <div>
                            <input type="number" class="form-control input-lg" min="2022" max="2030" id="eyear">
                        </div>
                    </div><br>
                    <div class="form-group">
                        <label class="control-label">CVV</label>
                        <div>
                            <input type="password" class="form-control input-lg" id="cvv">
                        </div>
                    </div><br>
                    
                    <div class="form-group">
                        <div>
                            <button type="button" class="btn btn-success" id="button" onclick="addcard()">Add</button>
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

function showaddcardmodal(){
	$("#title").text("Add Card");
	$("#button").text("Add Card");

	$("#button").attr("onclick","addcard()");

	$("#addcardmodal").modal("show");
	
	$("#cardno").val("");
	$("#emonth").val("");
	$("#eyear").val("");
	 $("#cvv").val("");
}




function remove(t){
	var id=t.getAttribute("name");
	$.ajax({
		type:"POST",
		url:"removecard",
		data:{
			id:id
		},
		async:false,
		success:function(data){
			var res = $.parseJSON(data);
			if(res.hasOwnProperty("Success")){
				toastr.options.closeButton = true;
		        toastr.options.positionClass = 'toast-top-center';
		        toastr.success(res.Success, 'Success');
		        getCards();
			}
			
			}
	});
}

function primary(t){
	var id=t.getAttribute("name");
	$.ajax({
		type:"POST",
		url:"primarycard",
		data:{
			id:id
		},
		async:false,
		success:function(data){
			var res = $.parseJSON(data);
			if(res.hasOwnProperty("Success")){
				toastr.options.closeButton = true;
		        toastr.options.positionClass = 'toast-top-center';
		        toastr.success(res.Success, 'Success');
		        getCards();
			}
			
			}
	});
}

function edit(t){
	$("#title").text("Edit Card");
	$("#addcardmodal").modal("show");
	$("#button").text("Edit Card");


	var id=t.getAttribute("name").split(",")[0];
	var primary = t.getAttribute("name").split(",")[1];
	$("#button").attr("onclick","editcard(" + id + "," + "'" +  primary  + "')");

	$.ajax({
		type:"POST",
		url:"getcarddetails",
		data:{
			id:id,
			primary:primary
		},
		async:false,
		success:function(data){
			var res = $.parseJSON(data);
				$("#cardtype").val(res.ct);
				$("#cardno").val(res.cn);
				$("#emonth").val(res.em);
				$("#eyear").val(res.ey);
				$("#cvv").val(res.cvv);
				
			
			}
	});
	
	
}



getCards();

function getCards(){
	document.getElementById("ac1").style.display="none";
	document.getElementById("ac2").style.display="none";

var userid = "${sessionScope.userid}";
	
	
	$.ajax({
		type:"GET",
		url:"getCards",
		data:{
			userid:userid
		},
		async:false,
		success:function(data){
			var res = $.parseJSON(data);
			if(res.length == 1){
			var primarycard = res[0];
			$("#pccn").text("Card Number: XXXX-XXXX-XXXX-" + primarycard.cn );
			$("#pce").text("Expiry: " + primarycard.em + "/" + primarycard.ey);
			$("#pcct").text("Card Type: " + primarycard.ct);
			$("#pcedit").attr("name",primarycard.id + "," + primarycard.primary);
			}
			else if(res.length == 2){
				var primarycard = res[0];
				$("#pccn").text("Card Number: XXXX-XXXX-XXXX-" + primarycard.cn);
				$("#pce").text("Expiry: " + primarycard.em + "/" + primarycard.ey);
				$("#pcct").text("Card Type: " + primarycard.ct);
				$("#pcedit").attr("name",primarycard.id + "," + primarycard.primary);
				
				var ac1 = res[1];
				$("#ac1cn").text("Card Number: XXXX-XXXX-XXXX-" + ac1.cn);
				$("#ac1e").text("Expiry: " + ac1.em + "/" + ac1.ey);
				$("#ac1ct").text("Card Type: " + ac1.ct);
				$("#ac1edit").attr("name",ac1.id + "," + ac1.primary);
				$("#ac1remove").attr("name",ac1.id);
 				$("#ac1primary").attr("name",ac1.id);
 			
				document.getElementById("ac1").style.display="";

				}
			else if(res.length == 3){
				var primarycard = res[0];
				$("#pccn").text("Card Number: XXXX-XXXX-XXXX-" + primarycard.cn);
				$("#pce").text("Expiry: " + primarycard.em + "/" + primarycard.ey);
				$("#pcct").text("Card Type: " + primarycard.ct);
				$("#pcedit").attr("name",primarycard.id + "," + primarycard.primary);
				
				var ac1 = res[1];
				$("#ac1cn").text("Card Number: XXXX-XXXX-XXXX-" + ac1.cn);
				$("#ac1e").text("Expiry: " + ac1.em + "/" + ac1.ey);
				$("#ac1ct").text("Card Type: " + ac1.ct);
				$("#ac1edit").attr("name",ac1.id + "," + ac1.primary);
				$("#ac1remove").attr("name",ac1.id);
				$("#ac1primary").attr("name",ac1.id);
 			
				var ac2 = res[2];
				$("#ac2cn").text("Card Number: XXXX-XXXX-XXXX-" + ac2.cn);
				$("#ac2e").text("Expiry: " + ac2.em + "/" + ac2.ey);
				$("#ac2ct").text("Card Type: " + ac2.ct);
				$("#ac2edit").attr("name",ac2.id + "," + ac2.primary);
				$("#ac2remove").attr("name",ac2.id);
 				$("#ac2primary").attr("name",ac2.id);
 			
				document.getElementById("ac1").style.display="";
				document.getElementById("ac2").style.display="";


				
				}
			else{
				
			}
		}
	});
	
}


function addcard(){
	var userid = "${sessionScope.userid}";
	
	var cn = $("#cardno").val();
	var ct = $("#cardtype").val();
	var emonth = $("#emonth").val();
	var eyear = $("#eyear").val();
	var cvv = $("#cvv").val();
	if(cn != "" && ct != "" && emonth != "" && eyear != "" && cvv != ""){ 
	$.ajax({
		type:"POST",
		url:"addcard",
		data:{
			userid:userid,
			cardnumber:cn,
			ct:ct,
			emonth:emonth,
			eyear:eyear,
			cvv:cvv
		},
		async:false,
		success:function(data){
			var res = $.parseJSON(data);
			if(res.hasOwnProperty("Success")){
				$("#addcardmodal").modal("hide");
		        alert(res.Success);
		        getCards();
				
			}
			else{
				$("#addcardmodal").modal("hide");
		        alert(res.Error);

			}
		}
	});
	}
	else{
        alert('Please provide all details');
	}
}

function editcard(id,primary){
	
	var cn = $("#cardno").val();
	var ct = $("#cardtype").val();
	var emonth = $("#emonth").val();
	var eyear = $("#eyear").val();
	var cvv = $("#cvv").val();
	if(cn != "" && ct != "" && emonth != "" && eyear != "" && cvv != ""){ 
	$.ajax({
		type:"POST",
		url:"editcard",
		data:{
			id:id,
			primary:primary,
			cardnumber:cn,
			ct:ct,
			emonth:emonth,
			eyear:eyear,
			cvv:cvv
		},
		async:false,
		success:function(data){
			var res = $.parseJSON(data);
			if(res.hasOwnProperty("Success")){
				$("#addcardmodal").modal("hide");
		        alert(res.Success);
		        getCards();
				
			}
			
		}
	});
	}
	else{
        alert('Please provide all details');
	}
}


</script>
</body>
</html>