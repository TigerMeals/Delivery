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

  <title>TigerMeals Delivery - Restaurant New Account</title>
  <link rel='icon' href='static/img/takeout.ico'></link>

  <!-- Bootstrap core CSS -->
  <link href="static/css/bootstrap-lux.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="static/css/shop-homepage.css" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/static/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

  <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>

</head>


<body id="LoginForm">
  <div class="container text-center">
    <img class="d-block mx-auto mb-4" src="https://www.princeton.edu/~oktour/virtualtour/korean/Images/Small/Shield.gif" alt="" width="72" height="72">
    <h1 class="form-heading">Create Restaurant Account</h1>
    <div class="login-form">
      <div class="main-div">
        <div class="panel">
       <!-- <h2>Restaurant Login</h2> -->
       <p>Please enter your email and password.</p>
       </div>
        <form id="Login" class="loginForm" action="http://localhost:8081/login" method="get">

            <div class="form-group">


                <input name="userName" class="form-control" id="userName" placeholder="User Name" type="text">

            </div>

            <div class="form-group">

                <input type="password" class="form-control" id="inputPassword" placeholder="Password" name = "password">

            </div>
            <div class="form-group">


                <input name="restaurantName" class="form-control" id="restaurantName" placeholder="Restaurant Name" type="text">

            </div>
            <div class="form-group">


                <input name="restaurantEmail" class="form-control" id="restaurantEmail" placeholder="Restaurant Email" type="text">

            </div>

            <div class="row">
                <div class="col-12">
                  <h4 class="ml-3"> Primary Contact </h4>
                </div>
                <div class="form-group col-6">
                    <div class="col-12">
                        <label for="p_first_name"><h5>First Name</h5></label>
                        <input type="text" class="form-control" name="p_first_name" id="p_first_name" placeholder="first name" title="enter your first name if any.">
                    </div>
                </div>
                <div class="form-group col-6">
                    <div class="col-12">
                      <label for="p_last_name"><h5>Last Name</h5></label>
                        <input type="text" class="form-control" name="p_last_name" id="p_last_name" placeholder="last name" title="enter your last name if any.">
                    </div>
                </div>
                <div class="form-group col-6">

                    <div class="col-12">
                        <label for="p_email"><h5>Email</h5></label>
                        <input type="text" class="form-control" name="p_email" id="p_email" placeholder="email" title="enter your email if any.">
                    </div>
                </div>
                <div class="form-group col-6">

                    <div class="col-12">
                      <label for="p_phone"><h5>Phone Number</h5></label>
                        <input type="text" class="form-control" name="p_phone" id="p_phone" placeholder="phone number" title="enter your phone number if any.">
                    </div>
                </div>
            </div>


            <div class="row">
              <div class="form-group col-6">

                  <div class="col-12">
                      <label for="phone"><h5>Phone</h5></label>
                      <input type="text" class="form-control" name="phone" id="phone" placeholder="enter phone" title="enter your phone number if any.">
                  </div>
              </div>

              <div class="form-group col-6">
                  <div class="col-12">
                     <label for="website"><h5>Website</h5></label>
                      <input type="text" class="form-control" name="website" id="website" placeholder="enter website" title="enter your website if any.">
                  </div>
              </div>
            </div>

            <div class="row">
              <div class="form-group col-6">

                  <div class="col-12">
                      <label for="email"><h5>Email</h5></label>
                      <input type="email" class="form-control" name="email" id="email" placeholder="you@email.com" title="enter your email.">
                  </div>
              </div>
              <div class="form-group col-6">

                  <div class="col-12">
                      <label for="address"><h5>Address</h5></label>
                      <input type="text" class="form-control" id="address" placeholder="somewhere" title="enter a location">
                  </div>
              </div>
            </div>

            <div class="row">
              <div class="col-12">
                <div class="form-group col-12">
                  <h5 class="mr-2">Hours of Operation</h5>

                  <div class="row mb-2">
                    <div class="col-6">
                        <label for="sunday1"><h6 class="mb-0">Sunday</h6></label>
                        <input type="time" class="form-control" id="sunday1" name="sunday1" required>
                        <div class="invalid-feedback">
                          Please enter a valid time.
                        </div>
                    </div>

                    <div class="col-6">
                        <label for="sunday2"><h6 class="mb-0" style="color:white;">Sunday Closing</h6></label>
                        <input type="time" class="form-control" id="sunday2" name="sunday2" required>
                        <div class="invalid-feedback">
                          Please enter a valid time.
                        </div>
                    </div>
                  </div>

                  <div class="row mb-2">
                    <div class="col-6">
                        <label for="monday1"><h6 class="mb-0">Monday</h6></label>
                        <input type="time" class="form-control" id="monday1" name="monday1" required>
                        <div class="invalid-feedback">
                          Please enter a valid time.
                        </div>
                    </div>

                    <div class="col-6">
                        <label for="monday2"><h6 class="mb-0" style="color:white;">Monday Closing</h6></label>
                        <input type="time" class="form-control" id="monday2" name="monday2" required>
                        <div class="invalid-feedback">
                          Please enter a valid time.
                        </div>
                    </div>
                  </div>

                  <div class="row mb-2">
                    <div class="col-6">
                        <label for="tuesday1"><h6 class="mb-0">Tuesday</h6></label>
                        <input type="time" class="form-control" id="tuesday1" name="tuesday1" required>
                        <div class="invalid-feedback">
                          Please enter a valid time.
                        </div>
                    </div>

                    <div class="col-6">
                        <label for="tuesday2"><h6 class="mb-0" style="color:white;">Tuesday Closing</h6></label>
                        <input type="time" class="form-control" id="tuesday2" name="tuesday2" required>
                        <div class="invalid-feedback">
                          Please enter a valid time.
                        </div>
                    </div>
                  </div>

                  <div class="row mb-2">
                    <div class="col-6">
                        <label for="wednesday1"><h6 class="mb-0">Wednesday</h6></label>
                        <input type="time" class="form-control" id="wednesday1" name="wednesday1" required>
                        <div class="invalid-feedback">
                          Please enter a valid time.
                        </div>
                    </div>

                    <div class="col-6">
                        <label for="wednesday2"><h6 class="mb-0" style="color:white;">Wednesday Closing</h6></label>
                        <input type="time" class="form-control" id="wednesday2" name="wednesday2" required>
                        <div class="invalid-feedback">
                          Please enter a valid time.
                        </div>
                    </div>
                  </div>

                  <div class="row mb-2">
                    <div class="col-6">
                        <label for="thursday1"><h6 class="mb-0">Thursday</h6></label>
                        <input type="time" class="form-control" id="thursday1" name="thursday1" required>
                        <div class="invalid-feedback">
                          Please enter a valid time.
                        </div>
                    </div>

                    <div class="col-6">
                        <label for="thursday2"><h6 class="mb-0" style="color:white;">Thursday Closing</h6></label>
                        <input type="time" class="form-control" id="thursday2" name="thursday2" required>
                        <div class="invalid-feedback">
                          Please enter a valid time.
                        </div>
                    </div>
                  </div>

                  <div class="row mb-2">
                    <div class="col-6">
                        <label for="friday1"><h6 class="mb-0">Friday</h6></label>
                        <input type="time" class="form-control" id="friday1" name="friday1" required>
                        <div class="invalid-feedback">
                          Please enter a valid time.
                        </div>
                    </div>

                    <div class="col-6">
                        <label for="friday2"><h6 class="mb-0" style="color:white;">Friday Closing</h6></label>
                        <input type="time" class="form-control" id="friday2" name="friday2" required>
                        <div class="invalid-feedback">
                          Please enter a valid time.
                        </div>
                    </div>
                  </div>

                  <div class="row mb-2">
                    <div class="col-6">
                        <label for="saturday1"><h6 class="mb-0">Saturday</h6></label>
                        <input type="time" class="form-control" id="saturday1" name="saturday1" required>
                        <div class="invalid-feedback">
                          Please enter a valid time.
                        </div>
                    </div>

                    <div class="col-6">
                        <label for="saturday2"><h6 class="mb-0" style="color:white;">Saturday Closing</h6></label>
                        <input type="time" class="form-control" id="saturday2" name="saturday2" required>
                        <div class="invalid-feedback">
                          Please enter a valid time.
                        </div>
                    </div>
                  </div>


                </div>
              </div>
            </div>

            <p>{{error}}</p>
            <div class="forgot mb-2">
              <a href="reset.html">Forgot password?</a>
              <a href="create_account_restaurant.html">New user? Create an account here.</a>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>

          </form>
        </div>

        </div>
      </div>
      <footer class="py-4 red-bar">
        <div class="container">
          <p class="m-0 text-center text-white">Copyright &copy; TigerMeals Delivery 2018</p>
        </div>
        <!-- /.container -->
      </footer>


</body>
</html>
