<!DOCTYPE html>
<html>
  <head>

  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>TigerMeals Restaurant Login</title>
  </head>
<body id="LoginForm">
<div class="container">
<h1 class="form-heading">Login Form</h1>
<div class="login-form">
<div class="main-div">
    <div class="panel">
   <h2>Admin Login</h2>
   <p>Please enter your email and password</p>
   </div>
    <form id="Login" action="http://localhost:8081/login" method="get">

        <div class="form-group">


            <input name="email" class="form-control" id="inputEmail" placeholder="Email Address" type="text">

        </div>

        <div class="form-group">

            <input type="text" class="form-control" id="inputPhone" placeholder="Phone" name = "phone">

        </div>
        <p>{{error}}</p>
        <div class="forgot">
        <a href="reset.html">Forgot password?</a>
      </div>
        <button type="submit" class="btn btn-primary">Login</button>

    </form>
    </div>
<p class="botto-text"> Designed by TigerMeals</p>
</div></div></div>


</body>
</html>