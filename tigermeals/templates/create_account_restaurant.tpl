<!DOCTYPE html>
<html lang="en">
  <head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>TigerMeals Delivery - Create New Restaurant Account</title>
  <link rel='icon' href='/static/img/takeout.ico'></link>

  <!-- Bootstrap core CSS -->
  <link href="/static/css/bootstrap-lux.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/static/css/restaurant.css" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/static/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

  <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>

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
</head>


<body>

  <div class="container text-center mb-5">
    <br>
    <img class="d-block mx-auto mt-5 mb-4" src="https://www.princeton.edu/~oktour/virtualtour/korean/Images/Small/Shield.gif" alt="" width="72" height="72">
    <h1 class="form-heading">Create Restaurant Account</h1>
    <div class="login-form">
      <div class="main-div">
        <div class="panel">
       <!-- <h2>Restaurant Login</h2> -->
       <p>We're excited to have you!</p>
       </div>
         <p class="text-warning text-danger">{{error}}</p>
        <form id="register" class="createAccountForm needs-validation" action="/register/upload" method="post" enctype=multipart/form-data novalidate>
          <div class="text-center justify-content-center">
            <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar">
            <br><br>
            <h5>Upload a profile picture </h5>
            <p class="text-primary">This is what the customers will see!</p>
            <input type="file" name="image" class="text-center center-block file-upload text-danger justify-content-center" enctype=multipart/form-data>
          </div>
          <br>
          <div class="row">
            <div class = "col-12">
              <h4 class="ml-3"> Restaurant Info </h4>
            </div>

            <div class="form-group col-md-6">
                <div class="col-12">
                  <input name="name" class="form-control" id="restaurantName" placeholder="Restaurant Name" type="text" required>
                  <div class="invalid-feedback" align="left">
                    Please enter the restaurant name.
                  </div>
                </div>
            </div>
            <div class="form-group col-md-6">
                <div class="col-12">
                  <input name="email" class="form-control" id="restaurantEmail" placeholder="Restaurant Email" type="email" required>
                  <div class="invalid-feedback" align="left">
                    Please enter a valid email address.
                  </div>
                </div>
            </div>

            <div class="form-group col-md-6">
              <div class="col-12">
                <input type="password" class="form-control" id="password" placeholder="Password" name = "password" required>
                <div class="invalid-feedback" align="left">
                  Please a password.
                </div>
              </div>
            </div>

            <div class="form-group col-md-6">
              <div class="col-12">
                <input type="password" class="form-control" id="password2" placeholder="Confirm Password" name = "password2" required>
                <div class="invalid-feedback" align="left">
                  Please confirm your password.
                </div>
              </div>
            </div>

            <div class="form-group col-md-6 justify-content-right">
              <div class="col-12">
                  <input name="website" class="form-control" id="restaurantWebsite" placeholder="Restaurant Website" type="text" required>
                  <div class="invalid-feedback" align="left">
                    Please enter the restaurant website.
                  </div>
              </div>
            </div>
            <div class="form-group col-md-6 justify-content-right">
                <div class="col-12">
                  <input name="address" class="form-control" id="restaurantAddress" placeholder="Restaurant Address" type="text" required>
                  <div class="invalid-feedback" align="left">
                    Please enter the restaurant address.
                  </div>
              </div>
            </div>

            <div class="form-group col-md-6">
                <div class="col-12">
                  <input name="restaurantPhone" class="form-control" id="restaurantPhone" placeholder="Restaurant Phone" type="text" required>
                  <div class="invalid-feedback" align="left">
                    Please enter the restaurant phone number.
                  </div>
                </div>
            </div>
          </div>
          <hr>

            <div class="row">
              <div class="col-12">
                <div class="form-group col-12">
                  <h5 class="mr-2">Hours of Operation</h5>
                  <div class="row mb-2">
                    <div class="col-6">
                        <label for="sunday1"><h6 class="mb-0">Sunday Opening</h6></label>
                        <input type="time" class="form-control" id="sunday1" name="sunday1" value="08:00">
                    </div>

                    <div class="col-6">
                        <label for="sunday2"><h6 class="mb-0">Sunday Closing</h6></label>
                        <input type="time" value="17:00" class="form-control" id="sunday2" name="sunday2">
                    </div>
                  </div>

                  <div class="row mb-2">
                    <div class="col-6">
                        <label for="monday1"><h6 class="mb-0">Monday Opening</h6></label>
                        <input type="time" class="form-control" id="monday1" name="monday1" value="08:00">
                    </div>

                    <div class="col-6">
                        <label for="monday2"><h6 class="mb-0">Monday Closing</h6></label>
                        <input type="time" value="17:00" class="form-control" id="monday2" name="monday2">
                    </div>
                  </div>

                  <div class="row mb-2">
                    <div class="col-6">
                        <label for="tuesday1"><h6 class="mb-0">Tuesday Opening</h6></label>
                        <input type="time" value="08:00" class="form-control" id="tuesday1" name="tuesday1">
                    </div>

                    <div class="col-6">
                        <label for="tuesday2"><h6 class="mb-0">Tuesday Closing</h6></label>
                        <input type="time" value="17:00" class="form-control" id="tuesday2" name="tuesday2">
                    </div>
                  </div>

                  <div class="row mb-2">
                    <div class="col-6">
                        <label for="wednesday1"><h6 class="mb-0">Wednesday Opening</h6></label>
                        <input type="time" value="08:00" class="form-control" id="wednesday1" name="wednesday1">
                    </div>

                    <div class="col-6">
                        <label for="wednesday2"><h6 class="mb-0">Wednesday Closing</h6></label>
                        <input type="time" value="17:00" class="form-control" id="wednesday2" name="wednesday2">
                    </div>
                  </div>

                  <div class="row mb-2">
                    <div class="col-6">
                        <label for="thursday1"><h6 class="mb-0">Thursday Opening</h6></label>
                        <input type="time" value="08:00" class="form-control" id="thursday1" name="thursday1">
                    </div>

                    <div class="col-6">
                        <label for="thursday2"><h6 class="mb-0">Thursday Closing</h6></label>
                        <input type="time" value="17:00" class="form-control" id="thursday2" name="thursday2">
                    </div>
                  </div>

                  <div class="row mb-2">
                    <div class="col-6">
                        <label for="friday1"><h6 class="mb-0">Friday Opening</h6></label>
                        <input type="time" value="08:00" class="form-control" id="friday1" name="friday1">
                    </div>

                    <div class="col-6">
                        <label for="friday2"><h6 class="mb-0">Friday Closing</h6></label>
                        <input type="time" value="17:00" class="form-control" id="friday2" name="friday2">
                    </div>
                  </div>

                  <div class="row mb-2">
                    <div class="col-6">
                        <label for="saturday1"><h6 class="mb-0">Saturday Opening</h6></label>
                        <input type="time" value="08:00" class="form-control" id="saturday1" name="saturday1">
                    </div>

                    <div class="col-6">
                        <label for="saturday2"><h6 class="mb-0">Saturday Closing</h6></label>
                        <input type="time" value="17:00" class="form-control" id="saturday2" name="saturday2">
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <h4>Cuisine Types</h4>
            <p class="text-primary">Check all of the boxes that describe what your restaurant serves.</p>
            <div class="row" align="center">
              <div class="col-6 col-lg-4">
                <div class="checkbox" align="left">
                  <label>
                    <input type="checkbox" name="Chinese">
                    Chinese
                  </label>
                </div>
              </div>
              <div class="col-6 col-lg-4">
                <div class="checkbox" align="left">
                  <label>
                    <input type="checkbox"  name="Mexican">
                    Mexican
                  </label>
                </div>
              </div>
              <div class="col-6 col-lg-4">
                <div class="checkbox" align="left">
                  <label>
                    <input type="checkbox"  name="American">
                    American
                  </label>
                </div>
              </div>

              <div class="col-6 col-lg-4">
                <div class="checkbox" align="left">
                  <label>
                    <input type="checkbox"  name="Healthy">
                    Healthy
                  </label>
                </div>
              </div>
              <div class="col-6 col-lg-4">
                <div class="checkbox" align="left">
                  <label>
                    <input type="checkbox"  name="Drinks">
                    Drinks
                  </label>
                </div>
              </div>
              <div class="col-6 col-lg-4">
                <div class="checkbox" align="left">
                  <label>
                    <input type="checkbox"  name="Breakfast">
                    Breakfast
                  </label>
                </div>
              </div>
              <div class="col-6 col-lg-4">
                <div class="checkbox" align="left">
                  <label>
                    <input type="checkbox"  name="Indian">
                    Indian
                  </label>
                </div>
              </div>
              <div class="col-6 col-lg-4">
                <div class="checkbox" align="left">
                  <label>
                    <input type="checkbox"  name="Italian">
                    Italian
                  </label>
                </div>
              </div>
              <div class="col-6 col-lg-4">
                <div class="checkbox" align="left">
                  <label>
                    <input type="checkbox"  name="Asian">
                    Asian
                  </label>
                </div>
              </div>
            </div>

            <hr>

            <div class="row">
              <div class="col-12">
                <h4 class="ml-3"> Primary Contact Info (Optional) </h4>
              </div>

              <div class="form-group col-md-6">
                  <div class="col-12">
                      <!-- <label for="primaryFirstName"><h5>First Name</h5></label> -->
                      <input type="text" class="form-control" name="primaryFirstName" id="primaryFirstName" placeholder="First Name" title="enter your first name if any.">
                  </div>
              </div>
              <div class="form-group col-md-6">
                  <div class="col-12">
                    <!-- <label for="primaryLastName"><h5>Last Name</h5></label> -->
                      <input type="text" class="form-control" name="primaryLastName" id="primaryLastName" placeholder="Last Name" title="enter your last name if any.">
                  </div>
              </div>

              <div class="form-group col-md-6 justify-content-right">

                  <div class="col-12">
                      <!-- <label for="primaryEmail"><h5>Email</h5></label> -->
                      <input type="email" class="form-control" name="primaryEmail" id="primaryEmail" placeholder="Email" title="enter your email if any.">
                  </div>
              </div>
              <div class="form-group col-md-6 justify-content-right">

                  <div class="col-12">
                    <!-- <label for="primaryPhone"><h5>Phone Number</h5></label> -->
                      <input type="email" class="form-control" name="primaryPhone" id="primaryPhone" placeholder="Phone Number" title="enter your phone number if any.">
                  </div>
              </div>
            </div>

            <hr>

            <div class="row">
              <div class="col-12">
                <h4 class="ml-3"> Secondary Contact Info (Optional) </h4>
              </div>

              <div class="form-group col-md-6">
                  <div class="col-12">
                      <!-- <label for="secondaryFirstName"><h5>First Name</h5></label> -->
                      <input type="text" class="form-control" name="secondaryFirstName" id="secondaryFirstName" placeholder="First Name" title="enter your first name if any.">
                  </div>
              </div>
              <div class="form-group col-md-6">
                  <div class="col-12">
                    <!-- <label for="secondaryLastName"><h5>Last Name</h5></label> -->
                      <input type="text" class="form-control" name="secondaryLastName" id="secondaryLastName" placeholder="Last Name" title="enter your last name if any.">
                  </div>
              </div>

              <div class="form-group col-md-6 justify-content-right">

                  <div class="col-12">
                      <!-- <label for="secondaryEmail"><h5>Email</h5></label> -->
                      <input type="text" class="form-control" name="secondaryEmail" id="secondaryEmail" placeholder="Email" title="enter your email if any.">
                  </div>
              </div>
              <div class="form-group col-md-6 justify-content-right">

                  <div class="col-12">
                    <!-- <label for="secondaryPhone"><h5>Phone Number</h5></label> -->
                      <input type="text" class="form-control" name="secondaryPhone" id="secondaryPhone" placeholder="Phone Number" title="enter your phone number if any.">
                  </div>
              </div>
            </div>

            <p>{{error}}</p>

            <div class="forgot mb-2">
              <a href="/restaurant/home">Already have an account? Login here.</a>
              <br>
              <a href="mailto:tigermealsdelivery@gmail.com">Questions? Email us at tigermealsdelivery@gmail.com.</a>
              <br>
            </div>
            <button type="submit" class="btn btn-primary">Register!</button>

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
      <script>
      // Disables form submissions if there are invalid fields
      // Adapted from https://getbootstrap.com/docs/4.0/components/forms/#validation
      (function() {
        'use strict';
        window.addEventListener('load', function() {
          // Fetch all the forms we want to apply custom Bootstrap validation styles to
          var forms = document.getElementsByClassName('needs-validation');
          // Loop over them and prevent submission
          var validation = Array.prototype.filter.call(forms, function(form) {
            form.addEventListener('submit', function(event) {
              if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
            }, false);
          });
        }, false);
      })();

      </script>

</body>
</html>
