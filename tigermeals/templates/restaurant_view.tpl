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
<<<<<<< HEAD

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
              <form method="post" action="/meals/restaurant/delete/{{food_ids[i]}}">
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
=======
    {% include 'nav.tpl' %}>
    <script>
      document.getElementById('nav-meals').classList.add('active');
      document.getElementById('nav-meals-dropdown').classList.add('active');
    </script>
>>>>>>> cb639b8b674f7c62f29f819240706a2ccb557ee8



    <!-- Page Content -->
    <div id="page-content-wrapper">
    <!-- Page Content -->
    <div class="container-fluid container">
      <div class="row">

        <div class="col-lg-3">
          <div class="sticky-top">

          <h2 class="mt-0 mb-3">Restaurants</h2>
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
                    <form id="filter" action="/meals/restaurant/filter" method="post">
                      <input class="form-check-input" type="checkbox" value="" name="American" id="American">
                      <label class="form-check-label" for="American">
                        American
                      </label> <br>
                      <input class="form-check-input" type="checkbox" value="" name="Asian" id="Asian">
                      <label class="form-check-label" for="Asian">
                        Asian
                      </label> <br>
                      <input class="form-check-input" type="checkbox" value="" name="Breakfast" id="Breakfast">
                      <label class="form-check-label" for="Breakfast">
                        Breakfast
                      </label> <br>
                      <input class="form-check-input" type="checkbox" value="" name="Chinese" id="Chinese">
                      <label class="form-check-label" for="Chinese">
                        Chinese
                      </label> <br>
                      <input class="form-check-input" type="checkbox" value="" name="Drinks" id="Drinks">
                      <label class="form-check-label" for="Drinks">
                        Drinks
                      </label> <br>
                      <input class="form-check-input" type="checkbox" value="" name="Healthy" id="Healthy">
                      <label class="form-check-label" for="Healthy">
                        Healthy
                      </label> <br>
                      <input class="form-check-input" type="checkbox" value="" name="Indian" id="Indian">
                      <label class="form-check-label" for="Indian">
                        Indian
                      </label> <br>
                      <input class="form-check-input" type="checkbox" value="" name="Italian" id="Italian">
                      <label class="form-check-label" for="Italian">
                        Italian
                      </label> <br>
                      <input class="form-check-input" type="checkbox" value="" name="Mexican" id="Mexican">
                      <label class="form-check-label" for="Mexican">
                        Mexican
                      </label> <br>
                    </form>
                  </div>
              </div>
            </div>
            </div>


            <div class="card border-white bg-transparent">
              <div class="card-header border-white bg-transparent" id="headingFive">
                <h5 class="mb-0">
                  <div class="float-right">
                  <input class="btn-sm btn-primary" type="submit" value="Apply Filters" form="filter">
                </div>
                  <!-- <button class="btn btn-link no-pad float-right" type="button" h>
                  <div class="col-sm pr-0 float-right">Apply Filters</div> -->
                </h5>
              </div>
            </div>


            <div class="card border-white bg-transparent">
              <div class="card-header border-white bg-transparent">
                 <a href="/meals" class="btn btn-outline-primary btn-block my-2 my-sm-0 text-center">View by Meals</a>
              </div>
            </div>



          </div>
        </div>
        </div>

        <div class="col-lg-9">

          <div id="carouselExampleIndicators" class="carousel slide mt-0 mb-0" data-ride="carousel">
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
              <h2 class="mb-0">Restaurants</h2>
              {% if restaurants_length == 1 %}
              <span class="ml-0 mt-0">({{restaurants_length}} result)</span>
              {% else %}
              <span class="ml-0 mt-0">({{restaurants_length}} results)</span>
              {% endif %}
              {% if error %}
              <p class="text-danger mt-2">{{error}}</p>
              {% endif %}
              <!-- <h2>Restaurants</h2> -->
              <!-- <h4 class="ml-1">{{restaurants_length}} results</h4> -->
            </div>

            <div class="col-lg-6 mb-4 float-right">
              <form class="card card-sm border-white ">
                  <div class="card-body border-white bg-transparent row no-gutters align-items-center px-0 py-0">
                      <div class="col-auto">
                          <!-- <i class="fas fa-search h4 text-body"></i> -->
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
  </div>
  <!-- #page-content-wrapper -->

  </div>
  <!-- #wrapper -->

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
  <script>
  {% for c in cuisines %}
    document.getElementById('{{c}}').checked = true;
  {% endfor %}
  </script>



  </body>

</html>
