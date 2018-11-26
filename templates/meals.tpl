<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>TigerMeals Delivery - Shop Meals</title>
    <link rel='icon' href='takeout.ico'></link>

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
        <a class="navbar-brand" href="#">TigerMeals Delivery</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item-bar">
              <a class="nav-link" href="http://localhost:8080/home?id={{id}}">Home</a>
            </li>
            <li class="nav-item-bar">
              <a class="nav-link" href="http://localhost:8080/about?id={{id}}">About</a>
            </li>
            <li class="nav-item-bar active">
              <a class="nav-link" href="http://localhost:8080/meals?id={{id}}">Meals</a>
            </li>
            <li class="nav-item-bar">
              <a class="nav-link" href="http://localhost:8080/account?id={{id}}">My Account</a>
            </li>
            <li class="nav-item-bar justify-content-end dropdown">
          <a class="nav-link justify-content-end" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> View Cart ({{length_cart}}) <i class="fa fa-caret-down"></i></a>
            <span class="sr-only">(current)</span>
          <ul class="dropdown-menu dropdown-menu-left dropdown-cart" role="menu">
            {% for i in range(0, length_cart) %}
              <li>
                  <span class="item">
                    <span class="item-left">
                        <img src="{{food_images[i]}}" alt="" />
                        <span class="item-info">
                            <span>{{food_titles[i]}}</span>
                            <span>price: {{food_prices[i]}}</span>
                        </span>
                    </span>
                    <span class="item-right">
                        <button class="btn-sm btn-danger btn-cart fa fa-times"></button>
                    </span>
                </span>
              </li>

              <li class="divider"></li>
              <li>
                <span class="checkout-text item-right">Subtotal: {{food_subtotals[i]}}</span><br>
            {% endfor %}
                <a class="checkout-text item-left" href="http://localhost:8080/cart?id={{id}}">View Cart</a>
                <a class="checkout-text item-right" href="http://localhost:8080/checkout?id={{id}}">Checkout</a>
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

          <h1 class="catering-header">Catering Packages</h1>
          <h4>Filter by</h4>

          <div class="accordion" id="accordionExample">
            <div class="card border-light bg-transparent">
              <!-- <div class="card-header bg-transparent" id="current">
                <h5 class="mb-0">
                    <div class="col-sm pl-0 float-left">Current filters: </div>
                </h5>
              </div> -->
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

              <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                <div class="card-body">
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="KungFuTea">
                    <label class="form-check-label" for="KungFuTea">
                      Kung Fu Tea
                    </label> <br>
                    <input class="form-check-input" type="checkbox" value="" id="Panera">
                    <label class="form-check-label" for="Panera">
                      Panera
                    </label> <br>
                    <input class="form-check-input" type="checkbox" value="" id="Tacoria">
                    <label class="form-check-label" for="Tacoria">
                      Tacoria
                    </label> <br>
                  </div>
                </div>
              </div>
            </div>
            <div class="card border-light bg-transparent">
              <div class="card-header bg-transparent" id="headingTwo">
                <h5 class="mb-0">
                  <button class="btn btn-link no-pad float-left" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                    <div class="col-sm pl-0 float-left">Cuisine </div>
                  </button>
                  <button class="btn btn-link no-pad float-right" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                  <div class="col-sm pr-0 float-right"><i class="fas fa-plus"></i></div>
                </button>
                </h5>
              </div>
              <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                <div class="card-body">
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="Asian">
                    <label class="form-check-label" for="Asian">
                      Asian
                    </label> <br>
                    <input class="form-check-input" type="checkbox" value="" id="American">
                    <label class="form-check-label" for="American">
                      American
                    </label> <br>
                    <input class="form-check-input" type="checkbox" value="" id="Drinks">
                    <label class="form-check-label" for="Drinks">
                      Drinks
                    </label> <br>
                    <input class="form-check-input" type="checkbox" value="" id="Healthy">
                    <label class="form-check-label" for="Healthy">
                      Healthy
                    </label> <br>
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
                    <input class="form-check-input" type="checkbox" value="" id="gf">
                    <label class="form-check-label" for="gf">
                      Gluten Free
                    </label> <br>
                    <input class="form-check-input" type="checkbox" value="" id="kosher">
                    <label class="form-check-label" for="kosher">
                      Kosher
                    </label> <br>
                    <input class="form-check-input" type="checkbox" value="" id="vegan">
                    <label class="form-check-label" for="vegan">
                      Vegan
                    </label> <br>
                    <input class="form-check-input" type="checkbox" value="" id="vegetarian">
                    <label class="form-check-label" for="vegetarian">
                      Vegetarian
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
                    <input class="form-check-input" type="checkbox" value="" id="0-25">
                    <label class="form-check-label" for="0-25">
                      0-25
                    </label> <br>
                    <input class="form-check-input" type="checkbox" value="" id="25-50">
                    <label class="form-check-label" for="25-50">
                      25-50
                    </label> <br>
                    <input class="form-check-input" type="checkbox" value="" id="50-75">
                    <label class="form-check-label" for="50-75">
                      50-75
                    </label> <br>
                    <input class="form-check-input" type="checkbox" value="" id="75-100">
                    <label class="form-check-label" for="75-100">
                      75-100
                    </label> <br>
                    <input class="form-check-input" type="checkbox" value="" id="100+">
                    <label class="form-check-label" for="100+">
                      100+
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

          <div class="sticky-top">
          <div class="row">
            <div class="col-lg-8 col-md-12 mb-8">
              <div class="sticky-top">
                <h2>Catering Packages</h2>
                <span class="ml-2">(12 results)</span>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4 float-right">
              <div class="sticky-top">
                <div class="dropdown float-right">
                  <a class="btn btn-primary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Sort by...
                  </a>

                  <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink">
                    <a class="dropdown-item active" href="#">Featured</a>
                    <a class="dropdown-item" href="#">Most popular</a>
                    <a class="dropdown-item" href="#">Number of servings</a>
                    <a class="dropdown-item" href="#">Price low to high</a>
                    <a class="dropdown-item" href="#">Price high to low</a>
                    <a class="dropdown-item" href="#">Recently added</a>
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

    <!-- Bootstrap core JavaScript -->
    <script src="/static/vendor/jquery/jquery.min.js"></script>
    <script src="/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
