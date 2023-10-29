<!DOCTYPE html>
<html>
  <head>
    <title>Click a Show- Login</title>
    <link rel="stylesheet" rel="noopener" target="_blank" href="bootstrap/css/bootstrap.min.css"> <!-- This link is only necessary if you’re using an external stylesheet -->
    
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
.user-details .input-box{
    margin: 20px 0  12px 0;
    width: calc(100% / 2 - 20px);
}
.input-box .details{
    display: block;
    font-weight: 500;
    font-size: 20px;
    margin-bottom: 5px;
}
.input-box input{
    height: 3rem;
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
    height: 100%;
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
      <div class="form-container">
        <div class="title">Create Your Account</div>
        <div class="login">Already a User? Login here</div>
        <form action="#">
          <div class="user-details">
            <div class="input-box">
              <span class="details">Full Name</span>
              <input type="text" placeholder="Enter your full name" required />
            </div>
            <div class="input-box">
              <span class="details">Username</span>
              <input type="text" placeholder="Enter your username" required />
            </div>
            <div class="input-box">
              <span class="details">Email</span>
              <input type="email" placeholder="Enter your email" required />
            </div>
            <div class="input-box">
              <span class="details">Phone Number</span>
              <input
                type="number"
                placeholder="Enter your phone number"
                required
              />
            </div>
            <div class="input-box">
              <span class="details">Password</span>
              <input
                type="password"
                placeholder="Enter your password"
                required
              />
            </div>
            <div class="input-box">
              <span class="details">Confirm Password</span>
              <input
                type="password"
                placeholder="Confirm your password"
                required
              />
            </div>
          </div>
          <div class="gender-details">
            <span class="gender-title">Gender</span>
            <div class="category">
              <input type="radio" name="gender" value="male" />
              <span class="gen">Male</span>
              <input type="radio" name="gender" value="female" />
              <span class="gen">Female</span>
              <input type="radio" name="gender" value="" /><span class="gen"
                >Prefer not to say</span
              >
            </div>
          </div>
          <div class="input-box">
              <span class="details">Date of Birth</span>
              <input type="text" placeholder="Enter your DOB" required />
            </div>
          <div class="input-box">
              <span class="details">Address</span>
              <input type="text" placeholder="Enter your address" required />
            </div>
           <div class="input-box">
              <span class="details">Cardname</span>
              <input type="text" placeholder="Enter your cardname" required />
            </div>
            <div class="input-box">
              <span class="details">Cardno</span>
              <input type="text" placeholder="Enter your cardno" required />
            </div>
            <div class="input-box">
              <span class="details">Expdate</span>
              <input type="text" placeholder="Enter your expdate" required />
            </div>
            <div class="input-box">
              <span class="details">CVV</span>
              <input type="text" placeholder="Enter your cvv" required />
            </div>
          <div class="button">
            <input type="submit"  onclick="createacc" value="Register" />
          </div>
        </form>
      </div>
      <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   
      <script>
    function createacc(){
   	 var username = $("#username").val();
	 var firstname = $("#first name").val();
	 var lastname = $("#last name").val();
	 var newpwd = $("#newpwd").val();
	 var confpwd = $("#confpwd").val();
	 var caddress = $("#address").val();
	 var cardname = $("#card name").val();
	 var cardno = $("#card number").val();
	 var cardsname = $("#name on card").val();
	 var exdate = $("#Exp Date").val();
	 var cvv = $("#cvv").val();
	 
	 if(username != "" && firstname != "" && lastname != "" && newpwd != "" && confpwd != "" && address != "" && cardname != "" && cardno != "" && cardsname != "" && exdate != ""){
		 $.ajax({
			 type:"POST",
			 url:"addcustomer",
			 data:{
				 uname:username,
				 fname:firstname,
				 lname:lastname,
				 npwd:newpwd,
				 cpwd:confpwd,
				 cardaddress:caddress,
				 cname:cardname,
				 cno:cardno,
				 csname:cardsname,
				 edate:exdate,
				 cvv:cvv
			 },
			 async:false,
			 success:function(data){
				 if(data != null){
					 var response = $.parseJSON(data);
					 if(response.hasOwnProperty("Success")){
						 alert(response.Success);
						 $("#uname").val("");
						 $("#fname").val("");
						 $("#lname").val("");
						 $("#npwd").val("");
						 $("#cpwd").val("");
						 $("#cardaddress").val("");
						 $("#cname").val("");
						 $("#cno").val("");
						 $("#csname").val("");
						 $("#edate").val("");

						
					 }
					 else{
						 alert(response.Error);
					 }
				 }
				 
			 }
		 })
	 }
	 else{
		 alert("Please enter all values");
	 }
 }
	




    
    </script>
  </body>
</html>
