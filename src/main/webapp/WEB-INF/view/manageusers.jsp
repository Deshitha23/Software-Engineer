
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
  <head>
    <title>Manage Users</title>
    <link rel="stylesheet" href="../css/ss.css" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <style>
    
    html,body{
    margin:0;
    height: 100%;
    font-family: 'Courier New', Courier, monospace;
}
.wh-container{
    display: flex;
    width: 100%;
    position: relative;
}
.left{
    width: 20%;
    background-color: rgba(21, 32, 29, 0.756);
    color: white;
    height: 100%;
    position: fixed;
}
.title{
    color: rgb(232, 84, 84);
    font-size: 6rem;
    font-family: 'Rampart One', cursive;
    font-weight: 600;
    letter-spacing: 0;
    padding-left: 1rem;
}
a:link{
    text-decoration: none;
}
.side-nav{
    /* padding: 2rem 0 2rem 0 !important; */
    /* padding-top: 10rem; */
    font-size: 2rem;
    color: white;
}
ul{
    outline: none;
    list-style: none;
}
.right{
    width: 100% ;
    margin-left: 20%;
    /* background-color: green; */
}
.list{
    background-color: azure;
    padding: 1.5rem;
}
th{
    padding: 4rem;
    
}
td{
    padding: 4rem;
}
.posture{
    height: 10rem;
    width: 15rem;
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
    <div class="wh-container">
        <div class="left">
            <div class="title">CaS</div>
            <br>
            <ul>
              <li > <a href="#" onclick="admin()" class="side-nav"> Home</a></li>
            
               
            </ul>
        </div>

        <div class="right">
            <h2 class="list">USERS LIST</h2>
            <table>
                <tr>
                     <th style="display:none;">User Id</th>
                    
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                     <th>Status</th>
                    
                    <th>Action</th>
                    
                </tr>
                <tbody id="getuserData">
                
                </tbody>
                
                    <!-- <td>
                        <button class="btn btn-secondary">Activate</button>
                        <button class="btn btn-primary">Deactivate</button>
                        <button class="btn btn-danger">Suspend</button>
                    </td>  -->

               

                
                 

                
            </table>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
    
    function addmovies(){
		window.location.href="addmovies";
	}
    function login(){
		window.location.href="login";
	}
    function admin(){
		window.location.href="admin";
	}
    getuserData();
    function getuserData(){
		/*var user_id = "${sessionScope.userid}";*/
		//alert(user_id);
		/*user_id = parseInt(user_id);*/
		$.ajax({
			type:"GET",
			url:"getuserData",
			data:{
				//uid:user_id
			},
			async:false,
			success:function(data){
				if(data != null){
					var result = $.parseJSON(data);
					var tbody="";
					for(var i=0;i<result.length;i++)
						{
						tbody+=  "<tr><td style='display:none;'>" + result[i].id + "</td><td>" + result[i].firstname + "</td><td>" + result[i].lastname +"</td><td>" + result[i].email + "</td>";  
						if(result[i].status==0){
							tbody+="<td>Inactive User</td>";
							
						}
						else if(result[i].status==1){
							tbody+="<td>Active User</td><td><button onclick='suspendUser(this)'>Suspend</button></td>";
						}
						else{
							tbody+="<td>Suspended User</td><td><button onclick='unsuspendUser(this)' >UnSuspend</button></td></tr>";
						}
						}
					$("#getuserData").html(tbody);

				}
			}
		});
	}
    
    function suspendUser(p){
    	var userid = p.parentElement.parentElement.children[0].innerHTML;
    	var email = p.parentElement.parentElement.children[3].innerHTML;
    	var firstname = p.parentElement.parentElement.children[1].innerHTML;
    	var lastname = p.parentElement.parentElement.children[2].innerHTML;
    	var username = firstname + " " + lastname;

    	$.ajax({
    		type:"POST",
    		url:"suspend",
    		data:{
    			userid:userid,
    			email:email,
    			username:username
    		},
    		async:false,
    		success:function(data){
    			if(data != null){
    				var res = $.parseJSON(data);
    				if(res.hasOwnProperty("success")){
    					alert(res.success);
    		           
						getuserData()
						}
    			}
    		}
    	});
    }

    function unsuspendUser(p){
    	var userid = p.parentElement.parentElement.children[0].innerHTML;
    	var email = p.parentElement.parentElement.children[3].innerHTML;
    	var firstname = p.parentElement.parentElement.children[1].innerHTML;
    	var lastname = p.parentElement.parentElement.children[2].innerHTML;
    	var username = firstname + " " + lastname;
    	
    	$.ajax({
    		type:"POST",
    		url:"unsuspend",
    		data:{
    			userid:userid,
    			email:email,
    			username:username
    		},
    		async:false,
    		success:function(data){
    			if(data != null){
    				var res = $.parseJSON(data);
    				if(res.hasOwnProperty("success")){
    					alert(res.success);
    		           
						getuserData()
						}
    			}
    		}
    	});
    	
    }
    
    </script>
</body>
</html>