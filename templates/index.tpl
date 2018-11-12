<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>TigerMeals Delivery - Shop Meals</title>

    <!-- Bootstrap core CSS -->
    <link href="static/css/bootstrap-lux.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="static/css/shop-homepage.css" rel="stylesheet">
    <link href="static/css/boostrap-slider.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    <!-- use the nordstrom style - have dropdown filters per restaurant/allergies/cuisine type/number of Servings
    wich checkboxes
    and have an upper display show which filters are applied

    then have a sort by dropdown bar in the upper right
    -->

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
              <a class="nav-link" href="http://localhost:8080/home">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="http://localhost:8080/about">About</a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="#">Meals</a>
                <span class="sr-only">(current)</span>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="http://localhost:8080/account">My Account</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="http://localhost:8080/checkout">Checkout</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Page Content -->
    <div class="container">

      <div class="row">

        <div class="col-lg-3">

          <h1 class="my-4">Catering Packages</h1>
          <h4>Filter by:</h4>

          <div class="accordion" id="accordionExample">
            <div class="card border-dark">
              <div class="card-header" id="headingOne">
                <h5 class="mb-0">
                  <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    Restaurant
                    <div class="float-right">
                    <i class="fas fa-plus"></i>
                  </div>
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
            <div class="card border-dark">
              <div class="card-header" id="headingTwo">
                <h5 class="mb-0">
                  <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    Cuisine
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
            <div class="card border-dark">
              <div class="card-header" id="headingThree">
                <h5 class="mb-0">
                  <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    Allergies
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
            <div class="card border-dark">
              <div class="card-header" id="headingFour">
                <h5 class="mb-0">
                  <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                    Number of Servings
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
          </div>

        </div>

        <div class="col-lg-9">

          <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
              <div class="carousel-item active">
                <img class="d-block img-fluid" src="img/mexican.jpg" alt="First slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="img/banhmi.jpg" alt="Second slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="img/dessert.jpg" alt="Third slide">
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

          <div class="row">

            <div class="col-lg-8 col-md-12 mb-8">
              <h2>Catering Packages</h2>
              (6 results)
            </div>

            <div class="col-lg-4 col-md-6 mb-4 float-right">
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

            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card border-light h-100">
                <a href="#"><img class="card-img-top" src="img/kft.jpg" alt=""></a>
                <div class="card-body">
                  <h5 class="card-title">
                    <a href="#">100ct Bubble Tea</a>
                  </h5>
                  <h6>$399.90 | Kung Fu Tea</h6>
                  100 servings
                </div>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href="#"><img class="card-img-top" src="./img/tacoria.jpg" alt=""></a>
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="#">Soft Taco Party Platter</a>
                  </h4>
                  <h5>$64.99 | Tacoria</h5>
                  <h6>40 servings</h6>
                </div>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href="#"><img class="card-img-top" src="img/panera.jpg" alt=""></a>
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="#">Panera Lunch Package</a>
                  </h4>
                  <h5>$99.99 | Panera</h5>
                  <h6>20 servings</h6>
                </div>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="#">Item Four</a>
                  </h4>
                  <h5>$24.99</h5>
                </div>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="#">Item Five</a>
                  </h4>
                  <h5>$24.99</h5>
                </div>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="#">Item Six</a>
                  </h4>
                  <h5>$24.99</h5>
                </div>
              </div>
            </div>

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
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script>
    // // Instantiate a slider
    // var mySlider = new Slider("input.slider", {
    // 	// initial options object
    // });
    var slider = new Slider('#ex2', {});
    // var slider = new Slider('#numservings', {});
    // // Call a method on the slider
    // var value = mySlider.getValue();
    //
    // // For non-getter methods, you can chain together commands
    // mySlider
    // 	.setValue(5)
    // 	.setValue(7);
    </script>
  </body>

</html>
