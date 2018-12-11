<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>TigerMeals Delivery - Shop Meals</title>
    <link rel='icon' href='static/img/takeout.ico'></link>

    <!-- Bootstrap core CSS -->
    <link href="static/css/bootstrap-lux.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="static/css/shop-homepage.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>

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
            <li class="nav-item-bar">
              <a class="nav-link" href="home.html">Home</a>
            <li class="nav-item-bar">
              <a class="nav-link" href="about.html">About</a>
            </li>
            <li class="nav-item-bar active">
              <a class="nav-link" href="#">Meals</a>
                <span class="sr-only">(current)</span>
            </li>
            <li class="nav-item-bar">
              <a class="nav-link" href="#">My Account</a>
            </li>
            <li class="nav-item-bar justify-content-end dropdown">
          <a class="nav-link justify-content-end" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> View Cart (4) <i class="fa fa-caret-down"></i></a>
          <ul class="dropdown-menu dropdown-menu-left dropdown-cart" role="menu">
              <li>
                  <span class="item">
                    <span class="item-left">
                        <img src="http://www.prepbootstrap.com/Content/images/template/menucartdropdown/item_1.jpg" alt="" />
                        <span class="item-info">
                            <span>Item name</span>
                            <span>price: $27.00</span>
                        </span>
                    </span>
                    <span class="item-right">
                        <button class="btn-sm btn-danger btn-cart fa fa-times"></button>
                    </span>
                </span>
              </li>
              <li>
                  <span class="item">
                    <span class="item-left">
                        <img src="http://www.prepbootstrap.com/Content/images/template/menucartdropdown/item_2.jpg" alt="" />
                        <span class="item-info">
                            <span>Item name</span>
                            <span>price: $3.00</span>
                        </span>
                    </span>
                    <span class="item-right">
                        <button class="btn-sm btn-danger btn-cart fa fa-times"></button>
                    </span>
                </span>
              </li>
              <li>
                  <span class="item">
                    <span class="item-left">
                        <img src="http://www.prepbootstrap.com/Content/images/template/menucartdropdown/item_3.jpeg" alt="" />
                        <span class="item-info">
                            <span>Item name</span>
                            <span>price: $12.00</span>
                        </span>
                    </span>
                    <span class="item-right">
                        <button class="btn-sm btn-danger btn-cart fa fa-times"></button>
                    </span>
                </span>
              </li>
              <li>
                  <span class="item">
                    <span class="item-left">
                        <img src="http://www.prepbootstrap.com/Content/images/template/menucartdropdown/item_4.jpg" alt="" />
                        <span class="item-info">
                            <span>Item name</span>
                            <span>price: $7.00</span>
                        </span>
                    </span>
                    <span class="item-right">
                        <button class="btn-sm btn-danger btn-cart fa fa-times"></button>
                    </span>
                </span>
              </li>
              <li class="divider"></li>
              <li>
                <span class="checkout-text item-right">Subtotal: $49.00</span><br>
                <a class="checkout-text item-left" href="cart.html">View Cart</a>
                <a class="checkout-text item-right" href="checkout.html">Checkout</a>
                <br>
              </li>

          </ul>
        </li>
          </ul>
        </div>
      </div>
    </nav>


    <br>
    <!-- Page Content -->
    <div class="container">

      <div class="row">
        <div class="col-3">
          <div class="text-center item-left">
            <button class="btn btn-success">Back to all restaurant listings</button>
          </div>
        </div>
      </div>

      <br>

      <div class="row">
        <div class="col-7">

          <h2>{{restaurant.name}}</h2>
          <p>{{restaurant.description}}</p>

          <h5>Website</h5>
            <p>{{restaurant.website}}</p>

            <h5>Email</h5>
              <p>{{restaurant.email}}</p>

          <h5>Address</h5>
            <p>{{restaurant.address}}</p>

          <h5>Hours of Operation</h5>
          <div class="row">

            <div class="col-6">
              <h6>Sunday </h6>
              <h6>Monday </h6>
              <h6>Tuesday </h6>
              <h6>Wednesday </h6>
              <h6>Thursday </h6>
              <h6>Friday </h6>
              <h6>Saturday </h6>
            </div>

            <div class="col-6">
              <h6>10:00am - 9:00pm</h6>
              <h6>10:00am - 9:00pm</h6>
              <h6>10:00am - 9:00pm</h6>
              <h6>10:00am - 9:00pm</h6>
              <h6>10:00am - 9:00pm</h6>
              <h6>10:00am - 9:00pm</h6>
              <h6>10:00am - 9:00pm</h6>
            </div>
          </div>

        </div>
        <div class="col-5">
          <img class="d-block w-100" src="./static/img/panera.jpg"
            alt="First slide">
        </div>
      </div>


      <br>
      <h3>Available Listings</h3>

      {% for m in meals %}
        {% with meal=m %}
          {% include 'display_meal.tpl' %}
        {% endwith %}
      {% endfor %}

      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->

    <br>
    <!-- Footer -->
    <footer class="py-4 red-bar">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; TigerMeals Delivery 2018</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="static/vendor/jquery/jquery.min.js"></script>
    <script src="static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
