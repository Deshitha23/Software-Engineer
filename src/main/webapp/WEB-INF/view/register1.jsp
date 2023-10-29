<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Click a Show- Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> 
    <style>
    html,body{
    margin:0;
    height: 100%;
    font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body{
    display: flex;
    height: 100vh;
    justify-content: center;
    align-items: center;
    background-image: url('https://americantheatrecritics.org/wp-content/uploads/2020/06/karen-zhao-jLRIsfkWRGo-unsplash-scaled.jpg');
}
.form-container{
    color: white;
    width: 100%;
    max-width: 700px;
    width: 100%;
    padding: 2rem 3rem;
    border: solid 3px #ccc ;
    border-radius: 5px;

}
.form-container .title{
    font-size: 35px;
    font-weight: 600;
    padding-bottom: 10px;
}
.form-container form .user-details{
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}
/*.user-details .input-box{
    margin: 20px 0  12px 0;
    width: calc(100% / 2 - 20px);
}*/
.input-box .details{
    display: block;
    font-weight: 500;
    font-size: 20px;
    margin-bottom: 5px;
}
.input-box input{
    height: 2rem;
    width: 100%;
    outline: none;
    border-radius: 5px;
    border: 1px soid #ccc;
    padding-left: 15px;
    font-size: 16px;
}
form .gender-details .gender-title{
     font-size: 20px;
     font-weight: 500;
}
form .gender-details .category{
    display: flex;
    width: 80%;
    margin: 14px 0;
    /* justify-content: space-between; */
}
.category label{

}
.gender-details .gen{
    font-size: 20px;
    padding: 5px;
    font-weight: 500;
}
form .button{
    height: 4rem;
    margin: 45px 0;
}
form .button input{
    height: 75%;
    width: 100%;
    outline: none;
    color: #fff;
    background: rgb(163, 72, 72);
    border-radius: 5px;
    font-size: 30px;
    font-weight: 500;
    letter-spacing: 1px;
}
form .button input:hover{
    background-color: #d63624;
    box-shadow: 2px 5px rgb(210, 73, 73);
    cursor: pointer;

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
      <div class="form-container">
        <br><br>        <br><br>
                <br><br>
        <br><br><br>
        <br><br>        <br><br>
        <br><br><br>
      
        <div class="title">Create Your Account</div>
        <a class="login" onclick="login()" >Already a User? Login here</a>
          <div class="user-details">
            <div class="input-box">
              <span class="details">first Name</span>
              <input type="text" id="fn"  placeholder="Enter your first name"  />
            </div>
            <div class="input-box">
              <span class="details">last Name</span>
              <input type="text" id="ln" placeholder="Enter your last name"  />
            </div>
            <div class="input-box">
              <span class="details">Username</span>
              <input type="text" id="un" placeholder="Enter your username"  />
            </div>
            <div class="input-box">
              <span class="details">Email</span>
              <input type="email" id="email" placeholder="Enter your email"  />
            </div>
            <div class="input-box">
              <span class="details">Phone Number</span>
              <input
                type="text"
                placeholder="Enter your phone number"
                id="number"
                
              />
            </div>
            <div class="input-box">
              <span class="details">Password</span>
              <input
                type="password"
                placeholder="Enter your password"
                id="pass"
                
              />
            </div>
            <div class="input-box">
              <span class="details">Confirm Password</span>
              <input
                type="password"
                placeholder="Confirm your password"
                id="cpass"
                
              />
            </div>
          </div>
          <br>

<label for="gender">Choose a gender:</label>

<select id="gender" >
  <option value="male">Male</option>
  <option value="female">Female</option>
  <option value="other">other</option>
  
</select>
<br>
<br>
<label >Subscribe to promotions</label>

<select  id="promotion">
  <option value="1">Yes</option>
  <option value="0">No</option>
  
</select>
          
          <br><br>
          <div class="input-box">
              <span class="details">Date of Birth (YYYY-MM-DD)</span>
              <input type="text" id="dob" placeholder="Enter your DOB"  />
            </div>
          <div class="input-box">
              <span class="details">Address</span>
              <input type="text" id="add" placeholder="Enter your address"  />
            </div><br>
            <label class="details" for="ctype">Choose a card type</label>

<select id="ctype" >
  <option value="1">Credit</option>
  <option value="2">Debit</option>
  
</select>
<br>
            
            <div class="input-box">
              <span class="details">Card Name</span>
              <input type="text" id="cardn" placeholder="Enter your cardname"  />
            </div>
           
            <div class="input-box">
              <span class="details">Cardno</span>
              <input type="text" id="cardno" placeholder="Enter your cardno"  />
            </div>
            <div class="input-box">
              <span class="details">Expiry Month</span>
              <input type="text" id="exmonth" placeholder="Enter your expiry month"  />
            </div>
               <div class="input-box">
              <span class="details">Expiry Year</span>
              <input type="text" id="exyear" placeholder="Enter your expiry year"  />
            </div>
            <div class="input-box">
              <span class="details">CVV</span>
              <input type="text" id="cvv" placeholder="Enter your cvv"  />
            </div>
            <br>
            <br>
          <div class="button">
            <button onclick="createacc()" >Register</button>
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

  
  function createacc(){
	  var username = $("#un").val();
		 var firstname = $("#fn").val();
		 var lastname = $("#ln").val();
		 var newpwd = $("#pass").val();
		 var confpwd = $("#cpass").val();
		 var gender = $("#gender").val();
		 var promotion = $("#promotion").val();
		 var number = $("#number").val();
		 var email = $("#email").val();

		 var dob = $("#dob").val();

		 var caddress = $("#add").val();

		 var cardname = $("#cardn").val();
		 var ctype = $("#ctype").val();
		 //alert(ctype);

		 var cardno = $("#cardno").val();
		 var exmonth = $("#exmonth").val();
		 var exyear = $("#exyear").val();

		 var cvv = $("#cvv").val();
		   if( username !="" && firstname != "" && lastname != "" && dob !=""
				 && confpwd !="" && newpwd !="" && gender !="" && promotion !="" && number !=""
				 && caddress != "" && ctype != "" && cardname != "" && cardno != "" && cvv != "" && exmonth != "" && exyear != "" && email != ""){
			   let pattern1 = /[a-z]/;
		         let pattern2 = /[A-Z]/;
		         let pattern3 = /[0-9]/;
		         let pattern4 = /[`!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?~]/;
		         
		         
		         
		         if (!(pattern1.test(newpwd) && pattern2.test(newpwd) && pattern3.test(newpwd) && pattern4.test(newpwd))) {
		         alert('Password must have atleast one lowercase letter, uppercase letter, number and special character');
		           return;
		         }
		         
			  if(cardno.length < 16 || cardno.length > 16){
				 alert("Card number must be 16 digits long");
				 return;
			 }
			 
			  else if(cvv.length < 3 || cvv.length > 3){
				 alert("cvv number must be 3 digits long");
				 return;
			 }
			  else if(newpwd != confpwd)
				 {
				 alert("Enter same Password");
				 return;
				 }
			  else if(number.length < 10 || number.length > 10){
				 alert("mobile number must be 10 digits long");
				 return;
			 }  
			   $.ajax({
				 type:"POST",
				 url:"createAcc",
				 data:{
					 fn:firstname,
					 ln:lastname,
					 un:username,
					 emailaddress:email,
					 mobilenumber:number,
					 pass:newpwd,
					 gen:gender,
					 promo:promotion,
					 date:dob,
					 add:caddress,
					 cardn:cardname,
					 cardtype:ctype,
					 cardnumber:cardno,
					 exmonth:exmonth,
					 exyear:exyear,

					 cv:cvv
				 },
				 async:false,
				 success:function(data){
					 if(data != null){
						 var response = $.parseJSON(data);
						 if(response.hasOwnProperty("success")){
							 alert(response.success);
								window.location.href="login";
							
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
		 
		 
		
  } 
  
  </script>
  </body>
</html>
