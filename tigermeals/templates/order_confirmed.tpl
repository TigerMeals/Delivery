<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>TigerMeals - Order Confirmed</title>
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
        <nav class="navbar navbar-expand-md navbar-dark bg-danger fixed-top">
          <a class="navbar-brand ml-2" href="/home">TigerMeals</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="nav navbar-nav ml-auto">
              <li class="nav-item-bar" id="nav-home">
                <a class="nav-link" href="/home">Home</a>
              <li class="nav-item-bar" id="nav-meals">
                <div class="dropdown" id="nav-meals-dropdown">
                  <a class="nav-link btn-danger dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown"  aria-expanded="false">
                    Meals
                  </a>
                  <div class="dropdown-menu dropdown-content mt-0" aria-labelledby="dropdownMenuLink">
                    <a class="dropdown-item" href="/meals">View all meals</a>
                    <a class="dropdown-item" href="/meals/restaurant">View by restaurant</a>
                  </div>
                </div>
              </li>
              <li class="nav-item-bar" id="nav-account">
                <a class="nav-link" href="/account">My Account</a>
              </li>
              <li class="nav-item-bar">
                <a class="nav-link" id="menu-toggle">View Cart</i></a>
              </li>
              <li class="nav-item-bar mr-4">
                <a class="nav-link" href="/logout">Logout</i></a>
              </li>
            </ul>
          </div>
        </nav>


          <div id="wrapper">

            <!-- Sidebar -->
            <div id="sidebar-wrapper">
              <div class="row justify-content-center">
                <h2 class="mt-3">My Cart</h2>
              </div>

              <hr class="mt-1">

              <div class="cart-content text-primary text-center">

                  Your cart is currently empty.

              </div>


            </div> <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">
    <!-- Page Content -->
    <div class="container-fluid container">

      <div class="container mt-4 py-5 px-5">
        <div class="row">
          <div class="col align-self-center">
            <div class="py-5 px-5 text-center">
              <img class="d-block mx-auto mb-4" src="https://www.princeton.edu/~oktour/virtualtour/korean/Images/Small/Shield.gif" alt="" width="72" height="72">
              <h2>Order Confirmed!</h2>
              <p class="lead mb-0">Check your email for an order confirmation. We will notify you when the restaurant approves your order. Thank you for choosing TigerMeals.</p>
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
    </div>


  </div>
  <footer class="py-4 red-bar sticky-footer">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; TigerMeals 2019</p>
    </div>
    <!-- /.container -->
  </footer>

</div>

    <!-- Bootstrap core JavaScript -->
    <script src="/static/vendor/jquery/jquery.min.js"></script>
    <script src="/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    {% include 'handle_toggle.tpl' %}
  </body>

</html>
