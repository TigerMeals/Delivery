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
    <link href="/static/css/restaurant.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    <script type="text/javascript" src="static/js/jquery-1.10.2.min.js"></script>

  </head>

  <body>

    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="This is the page in which users will checkout after they have filled up their cart">
        <meta name="author" content="TigerMeals Delivery Team">

        <title>TigerMeals Delivery - Restaurant Account</title>
        <link rel='icon' href='static/img/takeout.ico'></link>

        <!-- Bootstrap core CSS -->
        <link href="/static/css/bootstrap-lux.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="/static/css/shop-homepage.css" rel="stylesheet">
        <link href="/static/css/boostrap-slider.css" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <script>
          $(document).ready(function() {

              var readURL = function(input) {
                  if (input.files && input.files[0]) {
                      var reader = new FileReader();

                      reader.onload = function (e) {
                          $('.avatar').attr('src', e.target.result);
                      }

                      reader.readAsDataURL(input.files[0]);
                  }
              }

              $(".file-upload").on('change', function(){
                  readURL(this);
              });
          });

        </script>

        <script type="text/javascript">
          $('.clockpicker').clockpicker();
        </script>

    </head>

    <body>
        <nav class="navbar red-bar navbar-expand-lg navbar-dark fixed-top">
          <div class="container">
            <a class="navbar-brand" href="/">TigerMeals Delivery</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarResponsive">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item-bar">
                  <a class="nav-link" href="/restaurant/home">Home</a>
                <li class="nav-item-bar">
                  <a class="nav-link" href="/restaurant/about">About</a>
                </li>
                <li class="nav-item-bar">
                  <a class="nav-link" href="/listings">My Meals</a>
                </li>
                <li class="nav-item-bar">
                <div class="dropdown">
                  <a class="nav-link btn-danger dropdown-toggle" href="/restaurant/account" role="button" id="logoutLink" data-toggle="dropdown"  aria-expanded="false">
                    My Account
                  </a>

                  <div class="dropdown-menu" aria-labelledby="logoutLink">
                    <a class="dropdown-item" href="/restaurant/account">My account</a>
                    <a class="dropdown-item" href="/restaurant/logout">Logout</a>
                  </div>
                </div>
                </li>
                <li class="nav-item-bar">
                  <a class="nav-link" href="/orders">View Orders ({{length_orders}} Active)</a>
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
              <div class="col-12">
                <a class="btn btn-info" href="/restaurant/account">Back to my account details</a>
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
            {% include 'display_meal_restaurant.tpl' %}
          {% endwith %}
        {% endfor %}
        {% if not meals[0] %}
        <div class="col-12">
          <span class="text-primary">This restaurant doesn't have any available catering packages yet. 😢</span>
        </div>
        <br>
        <br>
        <br>
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

    <!-- Bootstrap core JavaScript -->
    <script src="/static/vendor/jquery/jquery.min.js"></script>
    <script src="/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
