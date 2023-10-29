<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
  <head>
    <title>Manage promotions</title>
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
    background-color: black;
    color: white;
    height: 100%;
    position: relative;
}
.title{
    color: rgb(232, 84, 84);
    font-size: 5rem;
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
    /*margin-left: 5%;*/
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
    padding: 2rem;
}
.posture{
    height: 10rem;
    width: 15rem;
}
    
    </style>
  </head>
  <body>
    <div class="wh-container">
        <div class="left">
            <div class="title">CaS</div>
            <ul>
              <li > <a href="#" onclick="admin()" class="side-nav"> Home</a></li>
            
              <li > <a href="#" onclick="addpromotions()" class="side-nav"> Add promotions</a></li>
               
            </ul>
        </div>

        <div class="right">
            <h2 class="list">Promotions List</h2>
            <table>
                <tr>
                    
                    <th >Discount</th>
                    <th  >StartDate</th>
                    <th  >EndDate</th>
                    
                    <th  >promocode</th>
                    <th >Actions</th>
                    
                </tr>
                <tbody id="getpromolist">
                
                </tbody>

                
                 

                
            </table>
        </div>
    </div>
    
    <div class="modal fade" id="editpromo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header border-bottom-0">
        <h5 class="modal-title" id="exampleModalLabel">Edit Promotion</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <div class="modal-body">
          <div class="form-group">
            <label for="promocode">Promo code</label>
            <input type="text" class="form-control" id="promocode" aria-describedby="emailHelp" placeholder="Enter promocode">
          </div>
          <div class="form-group">
            <label for="discount">Discount</label>
            <input type="text" class="form-control" id="discount" placeholder="Enter discount">
          </div>
          <div class="form-group">
            <label for="startdate">Start date</label>
            <input type="date" class="form-control" id="startdate" >
          </div>
          <div class="form-group">
            <label for="enddate">End date</label>
            <input type="date" class="form-control" id="enddate" >
          </div>
        </div>
        <div class="modal-footer border-top-0 d-flex justify-content-center">
          <button type="button" onclick="edit()" class="btn btn-success">Edit</button>
        </div>
    </div>
  </div>
</div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
    
    function addpromotions(){
		window.location.href="Managepromotions";
	}
    function admin(){
		window.location.href="admin";
	}
    getpromolist()
    function getpromolist(){
    	
    	$.ajax({
			type:"GET",
			url:"getpromolist",
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
						if(result[i].sent == 0){
							tbody +=  "<tr><td>" + result[i].discount + "</td><td>" + result[i].startdate +"</td><td>" + result[i].enddate + "</td><td>" + result[i].promocode + "</td><td><button onclick='sendpromo(this)'>send</button>";  

							tbody += "&nbsp;&nbsp;<button name='" + result[i].PromoID + "' onclick='editpromo(this)'>edit</button>";
							tbody += "</td></tr>";

						}
						else{
							tbody +=  "<tr><td>" + result[i].discount + "</td><td>" + result[i].startdate +"</td><td>" + result[i].enddate + "</td><td>" + result[i].promocode + "</td><td>promotion sent";  

							tbody += "</td></tr>";

						}
						}
					$("#getpromolist").html(tbody);

				}
			}
		});
    	
    }
    
    function edit(){
    	
    	var pc = $("#promocode").val();
    	var dis = $("#discount").val();
    	var sd = $("#startdate").val();
    	var ed = $("#enddate").val();
    	
    	if(pc != "" && dis != "" && sd != "" && ed != ""){
        	$.ajax({
    			type:"POST",
    			url:"editPromotion",
    			data:{
    				promoid:id,
    				promocode:pc,
    				discount:dis,
    				startdate:sd,
    				enddate:ed
    			},
    			async:false,
    			success:function(data){
    				if(data != null){
    					//alert(data);
    					var result = $.parseJSON(data);
    					if(result.hasOwnProperty("success"))
    						{
    						$("#editpromo").modal("hide");
    					    getpromolist();

    						alert("Promotion edited successfully");

    						}

    				}
    			}
    		});
        	}
        	else{
        		alert("Please enter all values");
        	}
    }
    var id=0;
    function editpromo(p){
    	$("#editpromo").modal("show");
    	var pc = p.parentElement.parentElement.children[3].innerHTML;
    	var dis = p.parentElement.parentElement.children[0].innerHTML;
    	var sd = p.parentElement.parentElement.children[1].innerHTML;
    	var ed = p.parentElement.parentElement.children[2].innerHTML;
    	id=p.getAttribute("name");
    	$("#promocode").val(pc);
    	$("#discount").val(dis);
    	$("#startdate").val(sd);
    	$("#enddate").val(ed);
    	

    }
    
    function sendpromo(p){
    	var pcode = p.parentElement.parentElement.children[3].innerHTML;
    	$.ajax({
			type:"POST",
			url:"sendPromotion",
			data:{
				code:pcode
			},
			async:false,
			success:function(data){
				if(data != null){
					var result = $.parseJSON(data);
					if(result.hasOwnProperty("success"))
						{
						alert("Promotion sent successfully");
					    getpromolist();

						}

				}
			}
		});
    }
    
    
    </script>
</body>
</html>