
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
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
    <title>Click a Show</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <link
      href="https://fonts.googleapis.com/css2?family=Rampart+One&family=Source+Sans+Pro&display=swap"
      rel="stylesheet"
    />

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
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
            <img class="cas-logo" src="../images/apple-touch-icon.png" alt="" />

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="#"
                    >Home</a
                  >
                </li>
                <li class="nav-item">
                  <a class="nav-link" onclick="signup()" href="#">register</a>
                </li></li>
                <li class="nav-item">
                  <a class="nav-link" onclick="login()" href="#">login</a>
                </li>
              </ul>
              <a class="navbar-brand cas-brand" href="#">Click a Show</a>
              <form class="d-flex">
                <input
                  class="form-control me-2"
                  type="search"
                  placeholder="Search for movies"
                  aria-label="Search"
                />

                <button class="btn btn-outline-danger" type="submit">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="16"
                    height="16"
                    fill="currentColor"
                    class="bi bi-search"
                    viewBox="0 0 16 16"
                  >
                    <path
                      d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"
                    />
                  </svg>
                </button>
              </form>
            </div>
          </div>
        </div>
      </nav>
    </div>

    <div class="books">
      <form class="d-flex justify-content-center">
        <input
          class="form-control me-2 w-50"
          type="search"
          placeholder="Search for your favourite books"
          aria-label="Search"
        />
        <button class="btn btn-outline-danger" type="submit">Search</button>
      </form>
    </div>

    <div
      id="carouselExampleIndicators"
      class="carousel slide"
      data-bs-ride="carousel"
    >
      <div class="carousel-indicators">
        <button
          type="button"
          data-bs-target="#carouselExampleIndicators"
          data-bs-slide-to="0"
          class="active"
          aria-current="true"
          aria-label="Slide 1"
        ></button>
        <button
          type="button"
          data-bs-target="#carouselExampleIndicators"
          data-bs-slide-to="1"
          aria-label="Slide 2"
        ></button>
        <button
          type="button"
          data-bs-target="#carouselExampleIndicators"
          data-bs-slide-to="2"
          aria-label="Slide 3"
        ></button>
      </div>
      <div class="carousel-inner">
        <div class="carousel-item image active">
          <img
            src="https://alphanewscall.com/wp-content/uploads/2022/09/The-Banshees-Of-Inisherin-Release-Date-Revealed-Latest-Updates.jpg"
            class="d-block w-100 promo-main"
            alt=""
          />
        </div>
        <div class="carousel-item image">
          <img
            src="https://assets-in.bmscdn.com/promotions/cms/creatives/1664281103114_bigblastweb.jpg"
            class="d-block w-100 promo-main"
            alt=""
          />
        </div>
        <div class="carousel-item image">
          <img
            src="https://www.wallpaperup.com/uploads/wallpapers/2015/12/12/858387/4b8a92b93fc6b6a5a91175fdc7692d3c-700.jpg"
            class="d-block w-100 promo-main"
            alt=""
          />
        </div>
      </div>
      <button
        class="carousel-control-prev"
        type="button"
        data-bs-target="#carouselExampleIndicators"
        data-bs-slide="prev"
      >
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button
        class="carousel-control-next"
        type="button"
        data-bs-target="#carouselExampleIndicators"
        data-bs-slide="next"
      >
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>

    <div class="released-wrapper d-flex justify-content-center">
      <button  class="btn btn-danger">
        <div class="released d-flex w3">Released </div>
      </button>
      
    </div>

    <div class="container d-flex justify-content-center">
      <div class="row d-flex w-75 posture-wrapper">
        <div class="col">
          <a href="https://www.youtube.com/watch?v=UoM42huMhP0">
            <img
              src="https://cdn.bollywoodmdb.com/fit-in/movies/largethumb/2021/major/major-poster-3.jpg"
              alt=""
              class="posture"
            />
          </a>
        </div>

        <div class="col">
          <a href="https://www.youtube.com/watch?v=UoM42huMhP0">
            <img
              src="https://moviegalleri.net/wp-content/uploads/2021/07/Vijay-Sethupathi-Kamal-Fahadh-Faasil-Vikram-Movie-First-Look-Poster-HD.jpg"
              alt=""
              class="posture"
            />
          </a>
        </div>
        <div class="col">
          <a href="https://www.youtube.com/watch?v=UoM42huMhP0">
            <img
              src="https://cdn.shopify.com/s/files/1/2356/1293/products/StarWarsForceawakens_250x250@2x.jpg?v=1638955512"
              alt=""
              class="posture"
            />
          </a>
        </div>
        <div class="col">
          <a href="https://www.youtube.com/watch?v=UoM42huMhP0">
            <img
              src="https://media.gettyimages.com/photos/captain-america-the-first-avenger-movie-poster-picture-id458467163?s=612x612"
              alt=""
              class="posture"
            />
          </a>
        </div>
      </div>
    </div>

    <div class="released-wrapper d-flex justify-content-center">
      <div class="dropdown">
        <button
          class="btn btn-danger dropdown-toggle genre-btn"
          type="button"
          id="dropdownMenuButton1"
          data-bs-toggle="dropdown"
          aria-expanded="false"
        >
          Coming Soon
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
          <li><a class="dropdown-item" href="#">Action</a></li>
          <li><a class="dropdown-item" href="#">Horror</a></li>
          <li><a class="dropdown-item" href="#">Rom-Com</a></li>
        </ul>
      </div>
    </div>

    <div class="container d-flex justify-content-center">
      <div class="row d-flex w-75 posture-wrapper">
        <div class="col">
          <a href="https://www.youtube.com/watch?v=UoM42huMhP0">
            <img
              src="https://filmcrazy.in/wp-content/uploads/2022/03/Ponniyin-Selvan-Movie-HD-Posters-1-1.jpg"
              alt=""
              class="posture"
            />
          </a>
        </div>
        <div class="col">
          <a href="https://www.youtube.com/watch?v=UoM42huMhP0">
            <img
              src="https://m.media-amazon.com/images/M/MV5BMTAzNjQ1Mzk2MjNeQTJeQWpwZ15BbWU4MDU0MDk1Mjcx._V1_FMjpg_UX1000_.jpg"
              alt=""
              class="posture"
            />
          </a>
        </div>
        <div class="col">
          <a href="https://www.youtube.com/watch?v=UoM42huMhP0">
            <img
              src="https://lumiere-a.akamaihd.net/v1/images/p_disneyplusoriginals_nationaltreasureedgeofhistory_v2_820c592d.jpeg?region=0%2C0%2C540%2C810"
              alt=""
              class="posture"
            />
          </a>
        </div>
        <div class="col">
          <a href="https://www.youtube.com/watch?v=UoM42huMhP0">
            <img
              src="https://images.justwatch.com/poster/11304990/s332/kochadaiiyaan.%7Bformat%7D"
              alt=""
              class="posture"
            />
          </a>
        </div>
      </div>
    </div>
<script>
function signup(){
	window.location.href="register";
}
function login(){
	window.location.href="login";
}

</script>
  </body>
</html>
