<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang=”en” manifest="/cache.appcache">
<head>
<title>editprofile</title>
<meta charset="utf-8">
<link rel="stylesheet" rel="noopener" target="_blank" href="bootstrap/css/bootstrap.min.css"> <!-- This link is only necessary if you’re using an external stylesheet -->
<style>
/* These style tags are only necessary if you’re adding internal CSS */
body{
    background-color:rgb(15, 7, 6);
    margin-top: 50px;
    margin-left: 100px;
}
label{
    color:rgb(12, 1, 1)
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
    <div width:650px;height:400px;">
        
            <br>
<u style="color:rgb(245, 240, 240)"><h1 style="crgb(248, 243, 243)7, 7)">Edit Your Profile</h1></u>
<br>
<div style="background-color: rgb(244, 244, 246);
border: 15px rgb(10, 5, 5);
padding: 50px;
margin: 20px">

<label >Email:</label>
<input type="text" id="email" required disabled>   
        <br><br><br>
        <label>change First name : </label>   
        <input type="text" placeholder="Enter First name" id="Firstname" required>  
        <br><br> <br>
        <label>change Last name : </label>   
        <input type="text" placeholder="Enter Last name" id="Lastname" required>  
        <br><br> <br>
        
        <u Style="color: rgb(14, 2, 2)"><h3 style="color: rgb(15, 1, 1)">Change Address Details</h3></u>
        <label> address : </label> 
        <input type="text" placeholder="enter new address" id="address" required>
        <u Style="color: rgb(14, 6, 6)"><h3 style="color: rgb(11, 0, 0)">Change Card Details</h3></u>
        <label>Description : </label> 
        <input type="text" placeholder="What Do You Wanna Call It" id="description" required>  
        <br> <br>
                    <label class="details" for="ctype">Choose a card type</label>

<select id="ctype" >
  <option value="1">Credit</option>
  <option value="2">Debit</option>
  
</select>
        <br>
        <br>

        <label>Card Number : </label> 
        <input type="text" placeholder="New Card Number" id="cardnumber" required>  
        <br> <br>
        <label>Name on the card : </label> 
        <input type="text" placeholder="New Name" id="nameoncard" required>  
        <br> <br>
        <label>Expiry month: </label> 
        <input type="text" placeholder="New Exp month" id="exmonth" required>
                <label>Expiry Year: </label> 
        <input type="text" placeholder="New Exp year" id="exyear" required> 
        <br><br>
        <label>cvv : </label> 
        <input type="password" placeholder="New cvv" id="cvv" required>   
        <br> <br>
        <input type="button" onclick="editempdata()" value="save">
        <br><br>
        <input type="button" onclick="changepwd()" value="Change password">
         

    </div>   
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <script>
    
    getEmpData()
    function getEmpData(){
		var user_id = "${sessionScope.userid}";
		//alert(user_id);
		user_id = parseInt(user_id);
		$.ajax({
			type:"GET",
			url:"getEmpData",
			data:{
				uid:user_id
			},
			async:false,
			success:function(data){
				if(data != null){
					var res = $.parseJSON(data);
					$("#email").val(res.email);
					$("#Firstname").val(res.firstname);
					$("#Lastname").val(res.lastname);
					$("#ctype").val(res.ctype);
					$("#address").val(res.address);
					$("#description").val(res.description);
					$("#cardnumber").val(res.cardnumber);
					$("#nameoncard").val(res.nameoncard);
					$("#exmonth").val(res.exmonth);
					$("#exyear").val(res.exyear);

					$("#cvv").val(res.cvv);
					

				}
			}
		});
	}
	
    function editempdata(){
		var user_id = "${sessionScope.userid}";
	 var firstname = $("#Firstname").val();
	 var lastname = $("#Lastname").val();
	 var caddress = $("#address").val();
	 var cardname = $("#description").val();
	 var cardno = $("#cardnumber").val();
	 var cardsname = $("#nameoncard").val();
	 var ctype = $("#ctype").val();

	 var exmonth = $("#exmonth").val();
	 var exyear = $("#exyear").val();

	 var cvv = $("#cvv").val();
	 user_id=parseInt(user_id);
	 if( firstname != "" && lastname != "" && address != "" && cardname != "" && cardno != "" && cardsname != "" && exmonth != "" && exyear != "" && ctype != ""){
		
		 if(cardno.length < 16 || cardno.length > 16){
			 alert("Card number must be 16 digits long");
			 return;
		 }
		 
		 if(cvv.length < 3 || cvv.length > 3){
			 alert("cvv number must be 3 digits long");
			 return;
		 }
		 
		 $.ajax({
			 type:"POST",
			 url:"editempdata",
			 data:{
				 uid:user_id,
				 fname:firstname,
				 lname:lastname,
				 
				 address:caddress,
				 cname:cardname,
				 cno:cardno,
				 csname:cardsname,
				 cardtype:ctype,
				 exmonth:exmonth,
				 exyear:exyear,

				 cvv:cvv
			 },
			 async:false,
			 success:function(data){
				 if(data != null){
					 var response = $.parseJSON(data);
					 if(response.hasOwnProperty("Success")){
						 getEmpData();
						 alert(response.Success);

						
					 }
					 else{
						 alert(response.Error);
					 }
				 }
				 
			 }
		 })
	 }
	 else{
		 alert("Enter all the Values ");
	 }
 }
    function changepwd(){
    	window.location.href="changepwd";
    }
</script>
</body>
</html>