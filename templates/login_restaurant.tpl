<!DOCTYPE html>
<html>
  <head>

  <!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>TigerMeals Delivery - Restaurant Login</title>
  <link rel='icon' href='/static/img/takeout.ico'></link>

  <!-- Bootstrap core CSS -->
  <link href="/static/css/bootstrap-lux.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/static/css/shop-homepage.css" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/static/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

  <script type="text/javascript" src="/static/js/jquery-1.10.2.min.js"></script>

</head>


<body id="LoginForm">

  <!-- <div class="container text-center">
    <img class="d-block mx-auto mb-4" src="https://www.princeton.edu/~oktour/virtualtour/korean/Images/Small/Shield.gif" alt="" width="72" height="72">
    <h1 class="form-heading">Restaurant Login</h1>
    <div class="login-form">
      <div class="main-div">
        <div class="panel">

       <p>Please enter your email and password.</p>
       </div>
        <form id="Login" class="loginForm" action="http://localhost:8081/login" method="get">

            <div class="form-group">


                <input name="email" class="form-control" id="inputEmail" placeholder="Email Address" type="text">

            </div>

            <div class="form-group">

                <input type="password" class="form-control" id="inputPhone" placeholder="Password" name = "password">

            </div>
            <p>{{error}}</p>
            <div class="forgot mb-2">
              <a href="reset.html">Forgot password?</a>
              <br>
              <a href="create_account_restaurant.html">New user? Create an account here.</a>
              <br>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>

          </form>
        </div>

        </div>
      </div> -->
<div class="container">
<img class="d-block mx-auto mb-4" src="https://www.princeton.edu/~oktour/virtualtour/korean/Images/Small/Shield.gif" alt="" width="72" height="72">
<h1 class="form-heading text-center">Restaurant Login</h1>
<div class="login-form">
<div class="main-div">
  <div class="panel text-center">
   <p>Please enter your email and password</p>
   </div>
    <form id="Login" class="loginForm" action="http://localhost:8081/login" method="post">

            <div class="form-group">


                <input name="email" class="form-control" id="inputEmail" placeholder="Email Address" type="text">

            </div>

            <div class="form-group">

                <input type="password" class="form-control" id="inputPhone" placeholder="Password" name = "password">

            </div>
            <p>{{error}}</p>

            <div class="forgot mb-2">
              <a href="reset.html">Forgot password?</a>
              <br>
              <a href="create_account_restaurant.html">New user? Create an account here.</a>
              <br>
            </div>

            <button type="submit" class="btn btn-primary">Login</button>

          </form>
        </div>

        </div>
      </div>
      <footer class="py-4 red-bar sticky-footer">
        <div class="container">
          <p class="m-0 text-center text-white">Copyright &copy; TigerMeals Delivery 2018</p>
        </div>
        <!-- /.container -->
      </footer>


</body>
</html>
