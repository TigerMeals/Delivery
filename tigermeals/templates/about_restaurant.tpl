<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>TigerMeals Delivery - About Us</title>
    <link rel='icon' href='/static/img/takeout.ico'></link>

    <!-- Bootstrap core CSS -->
    <link href="/static/css/bootstrap-lux.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/static/css/restaurant.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    <script type="text/javascript" src="/static/js/jquery-1.10.2.min.js"></script>

  </head>

  <body>

    <!-- Navigation -->
    <nav class="navbar red-bar navbar-expand-lg navbar-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="/">TigerMeals Delivery</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item-bar">
              <a class="nav-link" href="/restaurant/home">Home</a>
            <li class="nav-item-bar active">
              <a class="nav-link" href="/restaurant/about">About</a>
              <span class="sr-only">(current)</span>
            </li>
            <li class="nav-item-bar">
              <a class="nav-link" href="/listings">My Meals</a>
            </li>
            <li class="nav-item-bar">
              <div class="dropdown">
                <a class="nav-link btn-danger dropdown-toggle" href="/restaurant/account" role="button" id="logoutLink" data-toggle="dropdown"  aria-expanded="false">
                  My Account
                </a>

                <div class="dropdown-menu" aria-labelledby="logoutLink">
                  <a class="dropdown-item" href="/restaurant/account">My account</a>
                  <a class="dropdown-item" href="/restaurant/logout">Logout</a>
                </div>
              </div>
            </li>
            <li class="nav-item-bar">
              <a class="nav-link" href="/orders">View Orders ({{length_orders}} Active)</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <br>
    <!-- Page Content -->
    <div class="container">

      <!-- Introduction Row -->
      <h1 class="my-4">About Us
        <br>
        <small>It's Nice to Meet You!</small>
      </h1>
      <p>We are a committed and driven group of students who want to make a difference in the way we eat on campus. Our mission is to connect local restaurants to the various RCA's, club leaders, and student organizers across the Princeton community.</p>

      <!-- Team Members Row -->
      <div class="row">
        <div class="col-lg-12">
          <h2 class="my-4">Our Team</h2>
        </div>
        <div class="col-lg-4 col-sm-6 text-center mb-4">
          <img class="img-fluid d-block mx-auto mb-2" src="https://scontent-lga3-1.xx.fbcdn.net/v/t1.0-9/45581789_344937272929889_7973460369588879360_n.jpg?_nc_cat=111&_nc_ht=scontent-lga3-1.xx&oh=52266d037a0e0eb851e7bd155380d443&oe=5C3DB036" alt="">
          <h3>Vinay Ramesh
            <br>
            <small>Project Leader</small>
          </h3>
          <p>Primarily worked on front-end development on this application, saw over the timeline and created weekly deliverables. Created the template from which our backend is based on.</p>
        </div>
        <div class="col-lg-4 col-sm-6 text-center mb-4">
          <img class="img-fluid d-block mx-auto mb-2" src="https://scontent-lga3-1.xx.fbcdn.net/v/t1.0-1/c150.14.630.630/s320x320/21272407_1609338289117127_4836876658271716262_n.jpg?_nc_cat=103&_nc_ht=scontent-lga3-1.xx&oh=5cc81e7367e169b0948ce9c6da8829da&oe=5C3F216D" alt="">
          <h3>Aliyah Taylor
            <br>
            <small>Backend Wiz</small>
          </h3>
          <p>Wrote the entire backend model and database, and heavily involved in the front-end development of the application, namely the restaurant version of the user interface.</p>
        </div>
        <div class="col-lg-4 col-sm-6 text-center mb-4">
          <img class="img-fluid d-block mx-auto mb-2" src="/static/img/janetheadshot.jpg" alt="">
          <h3>Janet Lee
            <br>
            <small>Frontend Wiz</small>
          </h3>
          <p>Created the templates from which we created the main look and design of the application, providing insight to the rest of the team on design decisions and knowledge of the Bootstrap framework.</p>
        </div>
        <div class="col-lg-4 col-sm-6 text-center mb-4">
          <img class="img-fluid d-block mx-auto mb-2" src="https://scontent-lga3-1.xx.fbcdn.net/v/t1.0-1/p320x320/29186842_2038620979499487_5184330447475179520_n.jpg?_nc_cat=111&_nc_ht=scontent-lga3-1.xx&oh=3234a713e22dbceffb182c5087b28a32&oe=5C73245E" alt="">
          <h3>Niranjan Shankar
            <br>
            <small>General Wiz</small>
          </h3>
          <p>Created the Restful API that allows the main application to communicate with our backend database and model. Later became involved heavily in frontend development.</p>
        </div>
        <div class="col-lg-4 col-sm-6 text-center mb-4">
          <img class="img-fluid d-block mx-auto mb-2" src="https://www.cs.princeton.edu/~rdondero/images/rdondero.jpg" alt="">
          <h3>Professor Robert Dondero, Ph.D
            <br>
            <small>COS 333 Lead Course Instructor</small>
          </h3>
          <p>Provided mentorship and guidance throughout the project. Equipped us with the knowledge and tools necessary to embark on a project like this one.</p>
        </div>
        <div class="col-lg-4 col-sm-6 text-center mb-4">
          <img class="img-fluid d-block mx-auto mb-2" src="https://scontent-lga3-1.xx.fbcdn.net/v/t1.0-9/32829734_10216759133919484_8628687231508283392_n.jpg?_nc_cat=102&_nc_ht=scontent-lga3-1.xx&oh=f73457d94e63ba615886cc42db2fb862&oe=5C6E956E" alt="">
          <h3>Mohamed El-Dirany
            <br>
            <small>COS 333 Course Teacher Assistant</small>
          </h3>
          <p>Serving as our immediate point of contact, Mohamed met with the team on a weekly basis to provide suggesstions, deliverables, and insight to the project. He is essential to the success of this project.</p>
        </div>
      </div>

        <!-- Footer -->

        <footer class="py-4 red-bar">
          <div class="container">
            <p class="m-0 text-center text-white">Copyright &copy; TigerMeals Delivery 2018</p>
          </div>
          <!-- /.container -->
        </footer>

        <!-- Bootstrap core JavaScript -->
        <script src="/static/vendor/jquery/jquery.min.js"></script>
        <script src="/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
      </body>

    </html>
