<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>TigerMeals Delivery - Home</title>
    <link rel='icon' href='/static/img/takeout.ico'></link>

    <!-- Bootstrap core CSS -->
    <link href="/static/css/bootstrap-lux.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/static/css/shop-homepage.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    <script type="text/javascript" src="/static/js/jquery-1.10.2.min.js"></script>

  </head>

  <body>

    <!-- Navigation -->
    <nav class="navbar red-bar navbar-expand-lg navbar-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="#">TigerMeals Delivery</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item-bar active">
              <a class="nav-link" href="/?id={{id}}">Home</a>
              <span class="sr-only">(current)</span>
            <li class="nav-item-bar">
              <a class="nav-link" href="/about?id={{id}}">About</a>
            </li>
            <li class="nav-item-bar">
              <a class="nav-link" href="/listings?id={{id}}">My Meals</a>
            </li>
            <li class="nav-item-bar">
              <a class="nav-link" href="/account?id={{id}}">My Account</a>
            </li>
            <li class="nav-item-bar">
              <a class="nav-link" href="/orders?id={{id}}">View Orders ({{length_orders}} Active)</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Page Content -->
    <div class="container">
      <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="https://www.princeton.edu/~oktour/virtualtour/korean/Images/Small/Shield.gif" alt="" width="72" height="72">
        <h2>Welcome to TigerMeals!</h2>
      </div>

      <section class="bg-orange text-white">
        <div class="py-3">
        <img style="width:50%" class ="d-block mx-auto mb-4" src='https://i.etsystatic.com/6245917/r/il/58adec/992813431/il_570xN.992813431_dvm1.jpg'>
        </div>
      </section>

      <section id="services">
        <div class="container">
          <div class="row">
            <div class="col-lg-12 text-center">
              <h2 class="section-heading text-warning">At Your Service</h2>
              <hr class="my-4">
            </div>
          </div>
        </div>
        <div class="container">
          <div class="row">
            <div class="col-lg-3 col-md-6 text-center">
              <div class="service-box mt-5 mx-auto">
                <i class="fas fa-4x fa-gem text-primary mb-3 sr-icon-1"></i>
                <h3 class="mb-3 text-warning">Reliable Catering</h3>
                <p class="text-muted mb-0">Our partners are well-rated by the members of the Princeton community.</p>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 text-center">
              <div class="service-box mt-5 mx-auto">
                <i class="fas fa-4x fa-paper-plane text-primary mb-3 sr-icon-2"></i>
                <h3 class="mb-3 text-warning">Delivery</h3>
                <p class="text-muted mb-0">Of course, the food is delivered.</p>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 text-center">
              <div class="service-box mt-5 mx-auto">
                <i class="fas fa-4x fa-code text-primary mb-3 sr-icon-3"></i>
                <h3 class="mb-3 text-warning">Up to Date</h3>
                <p class="text-muted mb-0">We update menus to keep things fresh.</p>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 text-center">
              <div class="service-box mt-5 mx-auto">
                <i class="fas fa-4x fa-heart text-primary mb-3 sr-icon-4"></i>
                <h3 class="mb-3 text-warning">Made with Love</h3>
                <p class="text-muted mb-0">You have to make your food with love these days!</p>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>

    <footer class="py-4 red-bar">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; TigerMeals Delivery 2018</p>
      </div>
      <!-- /.container -->
    </footer>


    <!-- Bootstrap core JavaScript -->
    <script src="static/vendor/jquery/jquery.min.js"></script>
    <script src="static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="static/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="static/vendor/scrollreveal/scrollreveal.min.js"></script>
    <script src="static/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="js/creative.min.js"></script>

  </body>

</html>
