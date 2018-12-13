<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>TigerMeals Delivery - Order Confirmed</title>
    <link rel='icon' href='/static/img/takeout.ico'></link>


    <!-- Bootstrap core CSS -->
    <link href="/static/css/bootstrap-lux.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/static/css/shop-homepage.css" rel="stylesheet">
    <link href="/static/css/boostrap-slider.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/static/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

  </head>


  <body>

    <!-- Navigation -->
    <nav class="navbar red-bar navbar-expand-lg navbar-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="#">TigerMeals Delivery</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="/home">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/about">About</a>
            </li>
            <li class="nav-item">
            <div class="dropdown">
              <a class="nav-link btn-danger dropdown-toggle" href="/meals" role="button" id="dropdownMenuLink" data-toggle="dropdown"  aria-expanded="false">
                Meals
              </a>

              <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                <a class="dropdown-item" href="/meals">View all Meals</a>
                <a class="dropdown-item" href="/meals/restaurant">View by Restaurant</a>
              </div>
            </div>
            </li>
            <li class="nav-item">
            <div class="dropdown">
              <a class="nav-link btn-danger dropdown-toggle" href="/account" role="button" id="logoutLink" data-toggle="dropdown"  aria-expanded="false">
                My Account
              </a>

              <div class="dropdown-menu" aria-labelledby="logoutLink">
                <a class="dropdown-item" href="/account">My account</a>
                <a class="dropdown-item" href="/logout">Logout</a>
              </div>
            </div>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="#">Checkout</a>
              <span class="sr-only">(current)</span>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="container mt-4 py-5 px-5">
      <div class="row">
        <div class="col align-self-center">
          <div class="py-5 px-5 text-center">
            <img class="d-block mx-auto mb-4" src="https://www.princeton.edu/~oktour/virtualtour/korean/Images/Small/Shield.gif" alt="" width="72" height="72">
            <h2>Order Confirmed!</h2>
            <p class="lead mb-0">Check your email for an order confirmation. We will notify you when the restaurant approves your order. Thank you for choosing TigerMeals Delivery.</p>
          </div>
          <div class="row px-5 justify-content-center">
              <button class="btn btn-primary" onclick="window.location.href='/meals';"><strong>Browse more meals</strong></button>
          </div>

          <div class="row px-5 mt-5 justify-content-center">
            <p>Questions? Contact us at <a href="mailto:tigermealsdelivery@gmail.com">tigermealsdelivery@gmail.com</a>.</p>
          </div>
        </div>
      </div>
    </div>

    <!-- Footer -->

    <footer class="py-4 red-bar sticky-footer">
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
