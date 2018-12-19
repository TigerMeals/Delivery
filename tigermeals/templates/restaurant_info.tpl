<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>TigerMeals Delivery - Shop Meals</title>
    <link rel='icon' href='/static/img/takeout.ico'></link>

    <!-- Bootstrap core CSS -->
    <link href="/static/css/bootstrap-lux.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/static/css/shop-homepage.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    <script type="text/javascript" src="static/js/jquery-1.10.2.min.js"></script>

  </head>

  <body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-md navbar-dark bg-danger fixed-top">
      <a class="navbar-brand" href="/home">TigerMeals Delivery</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="nav navbar-nav ml-auto">
          <li class="nav-item-bar">
            <a class="nav-link" href="/home">Home</a>
          <li class="nav-item-bar">
            <a class="nav-link" href="/about">About</a>
          </li>
          <li class="nav-item-bar active">
            <div class="dropdown">
              <a class="nav-link btn-danger dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown"  aria-expanded="false">
                Meals
              </a>
              <span class="sr-only">(current)</span>

              <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                <a class="dropdown-item" href="/meals">View all Meals</a>
                <a class="dropdown-item" href="/meals/restaurant">View by Restaurant</a>
              </div>
            </div>
          </li>
          <li class="nav-item-bar">
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

      {% if empty_cart %}
      <div class="cart-content text-primary text-center">

          Your cart is currently empty.

      </div>
      {% endif %}

      {% if (not empty_cart) %}
      <div class="cart-content text-primary">
          {% for i in range(0, length_cart) %}
          <div class="row mr-0 ml-0">
            <div class="col-1 pr-0">
              {{food_multiplier[i]}}
            </div>
            <div class="col-6">
              {{food_titles[i]}}
            </div>
            <div class="col-1 px-0">
              <form method="post" action="/cart/delete/{{food_ids[i]}}">
                <button class="transparent-btn"><i class="fa fa-trash" aria-hidden="true"></i></button>
              </form>
              <!-- <i class="fa fa-trash" aria-hidden="true"></i> -->
            </div>
            <div class="col-4 pl-0 pr-3 right-align-text">
              <span id="cart_subtotal{{i}}"></span>
              <script>
                var val = parseFloat({{food_subtotals[i]}}).toFixed(2);
                document.getElementById('cart_subtotal{{i}}').innerHTML = "$" + val;
              </script>
            </div>
          </div>
          {% endfor %}

          <hr>
          <div class="row mr-0 ml-0">
            <div class="col-7 pr-0">
              Item Subtotal:
            </div>
            <div class="col-5 pl-0 pr-3 right-align-text">
              <span id="total"></span>

              <script>
                var val = parseFloat({{total}}).toFixed(2);
                document.getElementById('total').innerHTML = "$" + val;
              </script>
            </div>
          </div>

          <div class="row mr-0 ml-0">
            <div class="col-7 pr-0">
              Delivery Fee:
            </div>
            <div class="col-5 pr-3 right-align-text">
              $5.00
            </div>
          </div>

          <div class="row mr-0 ml-0">
            <div class="col-7 pr-0">
              Order Total:
            </div>
            <div class="col-5 pl-0 pr-3 right-align-text">
              <span id="orderTotal"></span>

              <script>
                var subTotal = parseInt({{total}}) + parseInt(5);
                var valTotal = parseFloat(subTotal).toFixed(2);
                document.getElementById('orderTotal').innerHTML = "$" + valTotal;
              </script>
            </div>
          </div>
        </div>

        <div class="row justify-content-center">
          <a href="/checkout"><button class="btn btn-success">Checkout</button></a>
        </div>
        {% endif %}

    </div> <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">
      <div class="container-fluid container">
      <!-- Portfolio Item Row -->
      <div class="row">

        <div class="col-md-8">
          <img class="img-fluid" src="{{restaurant.image}}" alt="">
        </div>

        <div class="col-md-4">
          <h1 class="mb-2">{{restaurant.name}}</h1>
          <p>{{restaurant.description}}</p>


          <div class="row">
            <div class="col-4">
              <h6 class="mt-1 mb-0">Address</h6>
            </div>
            <div class="col-8">
              <p>{{restaurant.address}}</p>
            </div>
          </div>

          <div class="row">
            <div class="col-4">
              <h6 class="mt-1 mb-0">Phone</h6>
            </div>
            <div class="col-8">
              <p>{{restaurant.phone}}</p>
            </div>
          </div>

          <div class="row">
            <div class="col-4">
              <h6 class="mt-1 mb-0">Website</h6>
            </div>
            <div class="col-8">
              <p><a href="kungfutea.com">{{restaurant.website}}</a></p>
            </div>
          </div>

          <div class="row">
            <div class="col-4">
              <h6 class="mt-1 mb-0">Email</h6>
            </div>
            <div class="col-8">
              <p><a href="mailto:{{restaurant.email}}">{{restaurant.email}}</a></p>
            </div>
          </div>

          <div class="row">
            <div class="col-12">
              <h6 class="mt-1 mb-1">Hours of Operation</h6>
            </div>
            <!-- <div class="row"> -->

            <div class="col-4">
              <h6 class="mt-1 mb-0"><small>Sunday </small></h6>
            </div>
            <div class="col-8">
              <p class="mt-0 mb-0">{{hours[0]}} - {{hours[1]}}</p>
            </div>

            <div class="col-4">
              <h6 class="mt-1 mb-0"><small>Monday </small></h6>
            </div>
            <div class="col-8">
              <p class="mt-0 mb-0">{{hours[2]}} - {{hours[3]}}</p>
            </div>

            <div class="col-4">
              <h6 class="mt-1 mb-0"><small>Tuesday </small></h6>
            </div>
            <div class="col-8">
              <p class="mt-0 mb-0">{{hours[4]}} - {{hours[5]}}</p>
            </div>

            <div class="col-4">
              <h6 class="mt-1 mb-0"><small>Wednesday </small></h6>
            </div>
            <div class="col-8">
              <p class="mt-0 mb-0">{{hours[6]}} - {{hours[7]}}</p>
            </div>

            <div class="col-4">
              <h6 class="mt-1 mb-0"><small>Thursday </small></h6>
            </div>
            <div class="col-8">
              <p class="mt-0 mb-0">{{hours[8]}} - {{hours[9]}}</p>
            </div>

            <div class="col-4">
              <h6 class="mt-1 mb-0"><small>Friday </small></h6>
            </div>
            <div class="col-8">
              <p class="mt-0 mb-0">{{hours[10]}} - {{hours[11]}}</p>
            </div>

            <div class="col-4">
              <h6 class="mt-1 mb-0"><small>Saturday</small></h6>
            </div>
            <div class="col-8">
              <p class="mt-0 mb-0">{{hours[12]}} - {{hours[13]}}</p>
            </div>
          </div>
        </div>
      </div>
      <!-- /.row -->
      <!-- Related Projects Row -->
      <h3 class="my-4">Available Catering Packages</h3>
      <div class="row">
        {% if hasMeals %}
          {% for m in meals %}
            {% with meal=m %}
              {% include 'display_meal.tpl' %}
            {% endwith %}
          {% endfor %}
        {% endif %}
        {% if not hasMeals %}
        <span class="text-primary">This restaurant doesn't have any available catering packages yet. 😢</span>
        {% endif %}
      </div>


    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-4 red-bar">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; TigerMeals Delivery 2018</p>
      </div>
      <!-- /.container -->
    </footer>

  </div><!-- /#page-content-wrapper -->
</div><!-- /#wrapper -->



    <!-- Bootstrap core JavaScript -->
    <script src="/static/vendor/jquery/jquery.min.js"></script>
    <script src="/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script>
      $(function(){
        $("#menu-toggle").click(function(e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
        });

        $(window).resize(function(e) {
          if($(window).width()<=768){
            $("#wrapper").removeClass("toggled");
          }else{
            $("#wrapper").addClass("toggled");
          }
        });
      });

    </script>
  </body>

</html>
