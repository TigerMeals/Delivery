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
      <div class="row">

        <div class="col-lg-3">
          <div class="sticky-top">

          <h1 class="catering-header">Restaurants</h1>
          <h4>Filter by</h4>

          <div class="accordion" id="accordionExample">
            <div class="card border-light bg-transparent">
              <div class="card-header bg-transparent" id="headingTwo">
                <h5 class="mb-0">
                  <button class="btn btn-link no-pad float-left" type="button" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                    <div class="col-sm pl-0 float-left">Cuisine </div>
                  </button>
                </h5>
              </div>
              <div id="collapseTwo" aria-labelledby="headingTwo" data-parent="#accordionExample">
                <div class="card-body">
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="American">
                    <label class="form-check-label" for="American">
                      American
                    </label> <br>
                    <input class="form-check-input" type="checkbox" value="" id="Asian">
                    <label class="form-check-label" for="Asian">
                      Asian
                    </label> <br>
                    <input class="form-check-input" type="checkbox" value="" id="Breakfast">
                    <label class="form-check-label" for="Breakfast">
                      Breakfast
                    </label> <br>
                    <input class="form-check-input" type="checkbox" value="" id="Chinese">
                    <label class="form-check-label" for="Chinese">
                      Chinese
                    </label> <br>
                    <input class="form-check-input" type="checkbox" value="" id="Drinks">
                    <label class="form-check-label" for="Drinks">
                      Drinks
                    </label> <br>
                    <input class="form-check-input" type="checkbox" value="" id="Fast-Food">
                    <label class="form-check-label" for="Fast-Food">
                      Fast Food
                    </label> <br>
                    <input class="form-check-input" type="checkbox" value="" id="Healthy">
                    <label class="form-check-label" for="Healthy">
                      Healthy
                    </label> <br>
                    <input class="form-check-input" type="checkbox" value="" id="Indian">
                    <label class="form-check-label" for="Indian">
                      Indian
                    </label> <br>
                    <input class="form-check-input" type="checkbox" value="" id="Italian">
                    <label class="form-check-label" for="Italian">
                      Italian
                    </label> <br>
                    <input class="form-check-input" type="checkbox" value="" id="Mexican">
                    <label class="form-check-label" for="Mexican">
                      Mexican
                    </label> <br>
                  </div>
              </div>
            </div>
            </div>


            <div class="card border-white bg-transparent">
              <div class="card-header border-white bg-transparent" id="headingFive">
                <h5 class="mb-0">
                  <div class="float-right">
                  <input class="btn-sm btn-primary" type="submit" value="Apply Filters">
                </div>
                  <!-- <button class="btn btn-link no-pad float-right" type="button" h>
                  <div class="col-sm pr-0 float-right">Apply Filters</div> -->
                </h5>
              </div>
            </div>
          </div>
        </div>
        </div>

        <div class="col-lg-9">

          <div id="carouselExampleIndicators" class="carousel slide mt-4 mb-2" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
              <div class="carousel-item active">
                <img class="d-block img-fluid w-900 meals-carousel" src="/static/img/mexican.jpg" alt="First slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid w-900 meals-carousel" src="/static/img/banhmi.jpg" alt="Second slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid w-900 meals-carousel" src="/static/img/dessert.jpg" alt="Third slide">
              </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>

          <div class="sticky-top sticky-catering">
          <div class="row">
            <div class="col-lg-6 col-md-12 mb-8">
              <!-- <h2>Restaurants</h2> -->
              <h4 class="ml-1">{{restaurants_length}} results</h4>
            </div>

            <div class="col-lg-6 mb-4 float-right">
              <form class="card card-sm border-white ">
                  <div class="card-body border-white bg-transparent row no-gutters align-items-center px-0 py-0">
                      <div class="col-auto">
                          <i class="fas fa-search h4 text-body"></i>
                      </div>
                      <!--end of col-->
                      <div class="col">
                          <input class="form-control form-control-sm form-control-borderless" type="search" placeholder="Search restaurants">
                      </div>
                      <!--end of col-->
                      <div class="col-auto">
                          <button class="btn-sm btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                      </div>
                      <!--end of col-->
                  </div>
              </form>
            </div>
          </div>
        </div>

          <div class="row">
            {% for r in restaurants %}
            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card border-light h-100">
                <a href="/meals/restaurant/{{r.restaurant_id}}"><img class="card-img-top" src="{{r.image}}" alt=""></a>
                <div class="card-body">
                  <h5 class="card-title">
                    <a href="/meals/restaurant/{{r.restaurant_id}}">{{r.name}}</a>
                  </h5>
                  <h6>{{r.address}}</h6>
                  <p>{{r.num_orders}} available catering packages</p>
                </div>
              </div>
            </div>
            {% endfor %}
          </div>
          <!-- /.row -->

        </div>
        <!-- /.col-lg-9 -->

      </div>
      <!-- /.row -->
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