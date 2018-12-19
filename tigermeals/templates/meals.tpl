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

        <div class="row">

          <div class="col-lg-3">
            <div class="sticky-top">

              <h1 class="mt-0 mb-2">Catering Packages</h1>

              {% if current_filters %}
              <h4>Current filters</h4>
              {% endif %}

              {% for f in current_filters %}
              <div class="row">
                <div class="col-4">
                  <button class="btn btn-link no-pad" onclick="remove_filter('{{f.checkbox}}')"> {{f.filter}} <span aria-hidden="true">&times;</span>
                  </button>
                </div>
              </div>
              {% endfor %}

              <br>

              <h4>Filter by</h4>

              <div class="accordion" id="accordionExample">
                <div class="card border-light bg-transparent">

                  <div class="card-header bg-transparent" id="headingOne">
                    <h5 class="mb-0">
                      <button class="btn btn-link no-pad float-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        <div class="col-sm pl-0 float-left">Restaurant </div>
                      </button>
                      <button class="btn btn-link no-pad float-right" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                      <div class="col-sm pr-0 float-right"><i class="fas fa-plus"></i></div>
                    </button>
                    </h5>
                  </div>
                  <form id = "filter" action="/meals/filter" method="POST">
                    <input type="hidden" name="sort" id="sort">
                    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                      <div class="card-body">
                        <div class="form-check">
                          {% for r in restaurants %}
                          <input class="form-check-input" type="checkbox" value="" name="restaurant_{{r.name}}_{{r.id}}" id="restaurant_{{r.name}}_{{r.id}}">
                          <label class="form-check-label" for="{{r.name}}">
                            {{r.name}}
                          </label> <br>
                          {% endfor %}
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="card border-light bg-transparent">
                    <div class="card-header bg-transparent" id="headingThree">
                      <h5 class="mb-0">
                        <button class="btn btn-link no-pad float-left" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
                          <div class="col-sm pl-0 float-left">Dietary Restrictions </div>
                        </button>
                        <button class="btn btn-link no-pad float-right" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
                        <div class="col-sm pr-0 float-right"><i class="fas fa-plus"></i></div>
                      </button>
                      </h5>
                    </div>
                    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                      <div class="card-body">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" value="" name="Contains dairy" id="Contains dairy">
                          <label class="form-check-label" for="Contains diary">
                            Contains dairy
                          </label> <br>
                          <input class="form-check-input" type="checkbox" value="" name="Contains meat" id="Contains meat">
                          <label class="form-check-label" for="Contains meat">
                            Contains meat
                          </label> <br>
                          <input class="form-check-input" type="checkbox" value="" name="Contains eggs" id="Contains eggs">
                          <label class="form-check-label" for="Contains eggs">
                            Contains eggs
                          </label> <br>
                          <input class="form-check-input" type="checkbox" value="" name="Kosher" id="Kosher">
                          <label class="form-check-label" for="Kosher">
                            Kosher
                          </label> <br>
                          <input class="form-check-input" type="checkbox" value="" name="Vegan" id="Vegan">
                          <label class="form-check-label" for="Vegan">
                            Vegan
                          </label> <br>
                          <input class="form-check-input" type="checkbox" value="" name="Vegetarian" id="Vegetarian">
                          <label class="form-check-label" for="Vegetarian">
                            Vegetarian
                          </label> <br>
                          <input class="form-check-input" type="checkbox" value="" name="Dairy free" id="Dairy free">
                          <label class="form-check-label" for="Dairy free">
                            Dairy free
                          </label> <br>
                          <input class="form-check-input" type="checkbox" value="" name="Nut free" id="Nut free">
                          <label class="form-check-label" for="Nut free">
                            Nut free
                          </label> <br>
                          <input class="form-check-input" type="checkbox" value="" name="Gluten free" id="Gluten free">
                          <label class="form-check-label" for="Gluten free">
                            Gluten free
                          </label> <br>
                        </div>
                    </div>
                  </div>
                </div>
                  <div class="card border-light bg-transparent">
                    <div class="card-header bg-transparent" id="headingFour">
                      <h5 class="mb-0">
                        <button class="btn btn-link no-pad float-left" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="true" aria-controls="collapseFour">
                          <div class="col-sm pl-0 float-left">Serving Size </div>
                        </button>
                        <button class="btn btn-link no-pad float-right" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="true" aria-controls="collapseFour">
                        <div class="col-sm pr-0 float-right"><i class="fas fa-plus"></i></div>
                      </button>
                      </h5>
                    </div>
                    <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
                      <div class="card-body">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" value="" name="0-25" id="0-25">
                          <label class="form-check-label" for="0-25">
                            0-25
                          </label> <br>
                          <input class="form-check-input" type="checkbox" value="" name="25-50" id="25-50">
                          <label class="form-check-label" for="25-50">
                            25-50
                          </label> <br>
                          <input class="form-check-input" type="checkbox" value="" name="50-75" id="50-75">
                          <label class="form-check-label" for="50-75">
                            50-75
                          </label> <br>
                          <input class="form-check-input" type="checkbox" value="" name="75-100" id="75-100">
                          <label class="form-check-label" for="75-100">
                            75-100
                          </label> <br>
                          <input class="form-check-input" type="checkbox" value="" name="100-1000" id="100+">
                          <label class="form-check-label" for="100+">
                            100+
                          </label> <br>
                        </div>
                      </div>
                    </div>
                  </div>
                </form>
                <div class="card border-white bg-transparent">
                  <div class="card-header border-white bg-transparent" id="headingFive">
                    <h5 class="mb-0">
                      <div class="float-right">
                      <input class="btn-sm btn-primary" type="submit" value="Apply Filters" onclick="filter_submit()">
                    </div>
                    </h5>
                  </div>
                </div>

                <div class="card border-white bg-transparent">
                  <div class="card-header border-white bg-transparent">
                     <a href="/meals/restaurant" class="btn btn-outline-primary btn-block my-2 my-sm-0">View by Restaurant</a>
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

            <div class="mt-0 light-background sticky-top">
            <div class="row">
              <div class="col-lg-8 col-md-12 mb-8">
                <div class="sticky-top">
                  <h2 class="mb-0">Catering Packages</h2>
                  <span class="ml-0 mt-0">({{length_meals}} results)</span>
                  {% if error %}
                  <p class="text-danger mt-2">{{error}}</p>
                  {% endif %}
                </div>
              </div>

              <div class="col-lg-4 col-md-6 mb-4 float-right">
                <div class="sticky-top">
                  <div class="dropdown float-right">
                    <a class="btn btn-primary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Sort by...
                    </a>

                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink">
                      <button class="dropdown-item active" href="#">Featured</a>
                      <button class="dropdown-item" type="submit" onclick="filter_submit('popular')">Most popular</a>
                      <button class="dropdown-item" type="submit" onclick="filter_submit('servings')">Number of servings</a>
                      <button class="dropdown-item" type="submit" onclick="filter_submit('price_low_to_high')">Price low to high</a>
                      <button class="dropdown-item" type="submit" onclick="filter_submit('price_high_to_low')">Price high to low</a>
                      <button class="dropdown-item" type="submit" onclick="filter_submit('recent')">Recently added</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

            <div class="row">

              {% for m in meals %}
                {% with meal=m %}
                  {% include 'display_meal.tpl' %}
                {% endwith %}
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
    <!-- /#page-content-wrapper -->
  </div>
  <!-- /#wrapper -->


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
    {% for c in current_filters %}
      document.getElementById('{{c.checkbox}}').checked = true;
    {% endfor %}

    function filter_submit(sort_type) {
      // Keep sorting consistent across multiple filters unless user requests
      // to change it
      if (sort_type == null) {
        document.getElementById("sort").value = "{{sort_type}}";
      }
      else {
        document.getElementById("sort").value = sort_type;
      }
      document.getElementById("filter").submit();
    }

    function remove_filter(checkbox) {
      document.getElementById(checkbox).checked = false;
      document.getElementById("sort").value = "{{sort_type}}";
      document.getElementById("filter").submit();
    }

    </script>
  </body>

</html>
