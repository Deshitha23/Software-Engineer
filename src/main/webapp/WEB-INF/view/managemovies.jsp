<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
  <head>
    <title>Manage Movies</title>
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
            
              <li > <a href="#" onclick="addmovies()" class="side-nav"> Add Movies</a></li>
               
            </ul>
        </div>

        <div class="right">
            <h2 class="list">MOVIE LIST</h2>
            <table>
                <tr>
                                        <th style="display:none;">Movie Id</th>
                    
                    <th id="title">Title</th>
                    <th id="genre" >Genre</th>
                    <th id="cast" >Cast</th>
                    
                    <th id="producer" >Producer</th>
                    <th id="director" >Director</th>
                    <th id="rating" >Rating</th>
                                        <th id="" >Action</th>
                    
                </tr>
                <tbody id="getmovieslist">
                
                </tbody>

                
                 

                
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
    function admin(){
		window.location.href="admin";
	}
    function schedulemovie(p){
		window.location.href="schedulemovie?movie=" + p.parentElement.parentElement.children[0].innerHTML;
	}
    getmovieslist()
    function getmovieslist(){
    	
    	$.ajax({
			type:"GET",
			url:"getmovieslist",
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
						tbody+=  "<tr><td style='display:none;'>" + result[i].movieid + "</td><td>" + result[i].title + "</td><td>" + result[i].genre +"</td><td>" + result[i].cast + "</td><td>" + result[i].producer + "</td><td>" + result[i].director + "</td><td>" + result[i].rating + "</td><td><button onclick='schedulemovie(this)'>Schedule</button></td>";  
						
						}
					$("#getmovieslist").html(tbody);

				}
			}
		});
    	
    }
    </script>
</body>
</html>