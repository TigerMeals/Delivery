<!DOCTYPE html>
<html>
  <head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>TigerMeals Delivery - Reset Restaurant Account Password</title>
  <link rel='icon' href='/static/img/takeout.ico'></link>

  <!-- Bootstrap core CSS -->
  <link href="static/css/bootstrap-lux.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="static/css/restaurant.css" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/static/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

  <script type="text/javascript" src="static/js/jquery-1.10.2.min.js"></script>

</head>


<body id="LoginForm">

<div class="container text-center">
  <br>
<img class="d-block mx-auto mt-5 mb-4" src="https://www.princeton.edu/~oktour/virtualtour/korean/Images/Small/Shield.gif" alt="" width="72" height="72">
<h1 class="form-heading text-center">Reset Password</h1>
<div class="login-form">
<div class="main-div">
  <div class="panel text-center">
   <p>Please enter your email.</p>
   </div>
    <form id="reset" class="loginForm" action="/reset/upload" method="post">

            <div class="form-group">
                <input name="email" class="form-control" id="inputEmail" placeholder="Email Address" type="text">
            </div>

            <p>{{error}}</p>

            <div class="forgot mb-2">
              <a href="/register">New user? Create an account here.</a>
              <br>
            </div>

            <button type="submit" form="reset" class="btn btn-primary">Email me my new password</button>

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
