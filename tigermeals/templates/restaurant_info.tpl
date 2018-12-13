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
    <nav class="navbar red-bar navbar-expand-lg navbar-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="/">TigerMeals Delivery</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item-bar">
              <a class="nav-link" href="/home">Home</a>
            </li>
            <li class="nav-item-bar">
              <a class="nav-link" href="/about">About</a>
            </li>
            <li class="nav-item-bar active">
              <a class="nav-link" href="/meals">Meals</a>
            </li>
            <li class="nav-item-bar">
              <a class="nav-link" href="/account">My Account</a>
            </li>
            <li class="nav-item-bar justify-content-end dropdown">
              <a class="nav-link justify-content-end" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> View Cart ({{length_cart}}) <i class="fa fa-caret-down"></i></a>
    						<span class="sr-only">(current)</span>
    					<ul class="dropdown-menu dropdown-menu-left dropdown-cart" role="menu">
    						{% for i in range(0, length_cart) %}
    							<li>
    									<span class="item">
    										<span class="item-left">
    												<img
    												src="{{food_images[i]}}"
    												style="width:35px;height:35px;"
    												 alt="" />
    												<span class="item-info">
    														<span>{{food_titles[i]}}</span>
    														<span id = "cart_price{{i}}"></span>
                                <!-- Below needed so that price displays with 2 decimal points. -->
                                <script>
                                  var val = parseFloat({{food_prices[i]}}).toFixed(2);
                                  document.getElementById('cart_price{{i}}').innerHTML = "price: $" + val;
                                </script>
    												</span>
    										</span>
    										<span class="item-right">
                          <form method="post"action="/cart/delete/{{food_ids[i]}}">
    												<button class="btn-sm btn-danger btn-cart fa fa-times"></button>
                          </form>
    										</span>
    								</span>
    							</li>

    							<li class="divider"></li>
    							<li>
                    <span id = "cart_subtotal{{i}}"></span>
                    <!-- Below needed so that price displays with 2 decimal points. -->
                    <script>
                      var val = parseFloat({{food_subtotals[i]}}).toFixed(2);
                      document.getElementById('cart_subtotal{{i}}').innerHTML = "Subtotal: $" + val;
                    </script>

    						{% endfor %}
    						<span class="checkout-text item-right">
                    <span id = "total"></span>
                    <!-- Below needed so that price displays with 2 decimal points. -->
                    <script>
                      var val = parseFloat({{total}}).toFixed(2);
                      document.getElementById('total').innerHTML = "Total: $" + val;
                    </script>
                    <a class="checkout-text item-left" href="/cart">View Cart</a>
                    <a class="checkout-text item-right" href="/checkout">Checkout</a>
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
                <p class="mt-0 mb-0">10:00am - 9:00pm</p>
              </div>

              <div class="col-4">
                <h6 class="mt-1 mb-0"><small>Monday </small></h6>
              </div>
              <div class="col-8">
                <p class="mt-0 mb-0">10:00am - 9:00pm</p>
              </div>

              <div class="col-4">
                <h6 class="mt-1 mb-0"><small>Tuesday </small></h6>
              </div>
              <div class="col-8">
                <p class="mt-0 mb-0">10:00am - 9:00pm</p>
              </div>

              <div class="col-4">
                <h6 class="mt-1 mb-0"><small>Wednesday </small></h6>
              </div>
              <div class="col-8">
                <p class="mt-0 mb-0">10:00am - 9:00pm</p>
              </div>

              <div class="col-4">
                <h6 class="mt-1 mb-0"><small>Thursday </small></h6>
              </div>
              <div class="col-8">
                <p class="mt-0 mb-0">10:00am - 9:00pm</p>
              </div>

              <div class="col-4">
                <h6 class="mt-1 mb-0"><small>Friday </small></h6>
              </div>
              <div class="col-8">
                <p class="mt-0 mb-0">10:00am - 9:00pm</p>
              </div>

              <div class="col-4">
                <h6 class="mt-1 mb-0"><small>Saturday</small></h6>
              </div>
              <div class="col-8">
                <p class="mt-0 mb-0">10:00am - 9:00pm</p>
              </div>
          </div>
        </div>
      </div>
      <!-- /.row -->
      <!-- Related Projects Row -->
      <h3 class="my-4">Available Catering Packages</h3>
      <div class="row">
        {% for m in meals %}
          {% with meal=m %}
            {% include 'display_meal.tpl' %}
          {% endwith %}
        {% endfor %}
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

    <!-- Bootstrap core JavaScript -->
    <script src="/static/vendor/jquery/jquery.min.js"></script>
    <script src="/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
