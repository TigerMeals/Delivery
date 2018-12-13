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
            </li>
            <li class="nav-item-bar">
              <a class="nav-link" href="/restaurant/about">About</a>
            </li>
            <li class="nav-item-bar">
              <a class="nav-link" href="/listings">My Meals</a>
            </li>
            <li class="nav-item-bar active">
            <div class="dropdown">
              <a class="nav-link btn-danger dropdown-toggle" href="/restaurant/account" role="button" id="logoutLink" data-toggle="dropdown"  aria-expanded="false">
                My Account
              </a>
              <span class="sr-only">(current)</span>
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

    <div class="container">
        <div class="row mt-2">
      		<div class="col-sm-3"><!--left col-->


          <div class="text-center">
            <img src="{{image}}" class="avatar img-circle img-thumbnail" alt="avatar">
            <br><br>
            <h6>Upload a different photo...</h6>
            <form method="post" action="/restaurant/image/update" enctype=multipart/form-data>
              <input type="file" name="image" class="text-center center-block file-upload">
              <div class="mt-3" align="left"><button type = "submit">Save Photo</button></div>
            </form>
          </div></hr><br>

            <div class="panel panel-default">
              <h5>Quick Stats </h5>
            <ul class="list-group">
              <li class="list-group-item text-left"><span class="pull-left"><strong>Listings</strong></span> {{length_listings}}</li>
              <li class="list-group-item text-left"><span class="pull-left"><strong>Active Orders</strong></span> {{length_orders}}</li>
              <li class="list-group-item text-left"><span class="pull-left"><strong>Pending Orders</strong></span> {{length_pending_orders}}</li>
              <li class="list-group-item text-left"><span class="pull-left"><strong>Completed Orders</strong></span> {{length_complete_orders}}</li>

            </ul>
          </div>


              <!-- <div class="panel panel-default">
                <div class="panel-heading">Social Media</div>
                <div class="panel-body">
                	<i class="fa fa-facebook fa-2x"></i> <i class="fa fa-github fa-2x"></i> <i class="fa fa-twitter fa-2x"></i> <i class="fa fa-pinterest fa-2x"></i> <i class="fa fa-google-plus fa-2x"></i>
                </div>
              </div> -->

          </div><!--/col-3-->
        	<div class="col-sm-9">
              <div class="row">
                <h1>{{name}}</h1>
              </div>
              <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#profile" class="mr-2">Profile</a></li>
                <li><a data-toggle="tab" href="#account" class="mr-2">Account</a></li>
                <li><a data-toggle="tab" href="#settings">Settings</a></li>
              </ul>

             <div class="tab-content">
                <div class="tab-pane active" id="profile">

                      <form class="form" action="/restaurant/profile/update" method="post" id="registrationForm">
                        <div class="row mt-3">
                          <div class="form-group col-12">

                              <div class="col-12">
                                  <label for="restaurant_name"><h5>Restaurant Name</h5></label>
                                  {% if error %}
                                  <div class="text-warning">
                                    <p>{{error}}</p>
                                  </div>
                                  {% endif %}
                                  <input type="text" class="form-control" name="restaurant_name" id="restaurant_name" value="{{name}}" title="enter your restaurant name if any.">
                              </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="form-group col-12">

                              <div class="col-12">
                                  <label for="description"><h5>Description</h5></label>
                                    <textarea class="form-control" id="description"name="description" rows="2" title="enter your restaurant description if any.">{{description}}</textarea>
                              </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="form-group col-6">

                              <div class="col-12">
                                  <label for="phone"><h5>Phone</h5></label>
                                  <input type="text" class="form-control" name="phone" id="phone" value="{{phone}}" title="enter your phone number if any.">
                              </div>
                          </div>

                          <div class="form-group col-6">
                              <div class="col-12">
                                 <label for="website"><h5>Website</h5></label>
                                  <input type="text" class="form-control" name="website" id="website" value="{{website}}" title="enter your website if any.">
                              </div>
                          </div>
                        </div>

                        <div class="row">
                          <div class="form-group col-6">

                              <div class="col-12">
                                  <label for="email"><h5>Email</h5></label>
                                  <input type="email" class="form-control" name="email" id="email" value="{{email}}" title="enter your email.">
                              </div>
                          </div>
                          <div class="form-group col-6">

                              <div class="col-12">
                                  <label for="address"><h5>Address</h5></label>
                                  <input type="text" class="form-control" id="address" value="{{address}}" title="enter a location"name="location">
                              </div>
                          </div>
                        </div>

                        <div class="row">
                          <div class="form-group col-6">
                            <div class="input-group clockpicker">
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-time"></span>
                                </span>
                            </div>
                          </div>
                        </div>

                        <div class="row">
                          <div class="form-group col-12">

                              <div class="col-12">
                                <a class="btn btn-info" href="/view">View my profile as a consumer</a>
                              </div>
                          </div>
                        </div>

                        <div class="row">
                          <div class="form-group">
                               <div class="col-12 col-xs-12">
                                    <br>
                                  	<button class="btn btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
                                   	<button class="btn" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>
                                </div>
                          </div>
                        </div>
                  	</form>
                  </div>


                  <div class="tab-pane" id="account">

                        <form class="form" action="/restaurant/account/update" method="post" id="registrationForm">
                          <div class="row mt-3">

                            <div class="form-group col-6">

                                <div class="col-12">
                                    <label for="password"><h5>Change Password</h5></label>
                                    <input type="password" class="form-control" name="password" id="password" placeholder="password" title="enter your password.">
                                </div>

                            </div>
                            <div class="form-group col-6">

                                <div class="col-12">
                                  <label for="password2"><h5>Verify Password</h5></label>
                                    <input type="password" class="form-control" name="password2" id="password2" placeholder="password2" title="enter your password2.">
                                </div>
                            </div>

                          </div>
                          <hr>
                          <div class="row">
                              <div class="col-12">
                                <h4 class="ml-3"> Primary Contact </h4>
                              </div>
                              <div class="form-group col-6">
                                  <div class="col-12">
                                      <label for="p_first_name"><h5>First Name</h5></label>
                                      <input type="text" class="form-control" name="p_first_name" id="p_first_name" value="{{primaryFirstName}}" title="enter your first name if any.">
                                  </div>
                              </div>
                              <div class="form-group col-6">
                                  <div class="col-12">
                                    <label for="p_last_name"><h5>Last Name</h5></label>
                                      <input type="text" class="form-control" name="p_last_name" id="p_last_name" value="{{primaryLastName}}" title="enter your last name if any.">
                                  </div>
                              </div>
                              <div class="form-group col-6">

                                  <div class="col-12">
                                      <label for="p_email"><h5>Email</h5></label>
                                      <input type="text" class="form-control" name="p_email" id="p_email" value="{{primaryEmail}}" title="enter your email if any.">
                                  </div>
                              </div>
                              <div class="form-group col-6">

                                  <div class="col-12">
                                    <label for="p_phone"><h5>Phone Number</h5></label>
                                      <input type="text" class="form-control" name="p_phone" id="p_phone" value="{{primaryPhone}}" title="enter your phone number if any.">
                                  </div>
                              </div>
                          </div>

                          <hr>
                          <div class="row">
                              <div class="col-12">
                                <h4 class="ml-3"> Secondary Contact </h4>
                              </div>
                              <div class="form-group col-6">
                                  <div class="col-12">
                                      <label for="s_first_name"><h5>First Name</h5></label>
                                      <input type="text" class="form-control" name="s_first_name" id="s_first_name" value="{{secondaryFirstName}}" title="enter your first name if any.">
                                  </div>
                              </div>
                              <div class="form-group col-6">
                                  <div class="col-12">
                                    <label for="s_last_name"><h5>Last Name</h5></label>
                                      <input type="text" class="form-control" name="s_last_name" id="s_last_name" value="{{secondaryLastName}}" title="enter your last name if any.">
                                  </div>
                              </div>
                              <div class="form-group col-6">

                                  <div class="col-12">
                                      <label for="s_email"><h5>Email</h5></label>
                                      <input type="text" class="form-control" name="s_email" id="s_email" value="{{secondaryEmail}}" title="enter your email if any.">
                                  </div>
                              </div>
                              <div class="form-group col-6">

                                  <div class="col-12">
                                    <label for="s_phone"><h5>Phone Number</h5></label>
                                      <input type="text" class="form-control" name="s_phone" id="s_phone" value="{{secondaryPhone}}" title="enter your phone number if any.">
                                  </div>
                              </div>
                          </div>

                          <div class="row">
                            <div class="form-group">
                                 <div class="col-12 col-xs-12">
                                      <br>
                                     <button class="btn btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
                                       <button class="btn" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>
                                  </div>
                            </div>
                          </div>
                     </form>
                    </div>


                 <div class="tab-pane" id="settings">

                       <form class="form" action="#" method="post" id="registrationForm">
                         <div class="row mt-3">
                           <div class="form-group col-12">

                               <div class="col-12">
                                   <label for="notifications"><h5>Notification Preferences</h5></label>
                                   <div class="form-group col-12">  <!-- Checkbox Group !-->
                                     <label class="control-label"><h6>Send me emails...</h6></label>
                                     <div class="row">
                                       <div class="col-6">
                                         <div class="checkbox">
                                           <label>
                                           <input type="radio" name="notification" value="new_order">
                                            Every time I get a new order (recommended)
                                           </label>
                                         </div>
                                         <div class="checkbox">
                                           <label>
                                           <input type="radio"  name="notification" value="daily">
                                           Every day at 8:00AM
                                           </label>
                                         </div>
                                       </div>
                                     </div>
                                   </div>

                                   <div class="form-group col-12">  <!-- Checkbox Group !-->
                                     <label class="control-label"><h6>I want to be notified via...</h6></label>
                                     <div class="row">
                                       <div class="col-6">
                                         <div class="checkbox">
                                           <label>
                                           <input type="checkbox" name="primary" value="primary">
                                            My primary contact email
                                           </label>
                                         </div>
                                         <div class="checkbox">
                                           <label>
                                           <input type="checkbox"  name="secondary" value="secondary">
                                           My secondary contact email
                                           </label>
                                         </div>
                                         <div class="checkbox">
                                           <label>
                                           <input type="checkbox"  name="business" value="business">
                                           My restaurant email
                                           </label>
                                         </div>
                                       </div>
                                     </div>
                                   </div>
                               </div>
                           </div>
                         </div>
                         <div class="row">
                           <div class="form-group col-12">

                                 <div class="col-12">
                                     <label for="delivery"><h5>Delivery Preferences</h5></label>
                                     <div class="form-group col-12">  <!-- Checkbox Group !-->
                                       <label class="control-label"><h6>Allow inquiries up to...</h6></label>
                                       <div class="row">
                                         <div class="col-6">
                                           <div class="checkbox">
                                             <label>
                                             <input type="radio" name="delivery" value="8hr">
                                              8 hours in advance
                                             </label>
                                           </div>
                                           <div class="checkbox">
                                             <label>
                                             <input type="radio"  name="delivery" value="24hr">
                                             24 hours in advance
                                             </label>
                                           </div>
                                         </div>
                                       </div>
                                     </div>
                                 </div>
                           </div>
                         </div>


                         <div class="row">
                           <div class="form-group">
                                <div class="col-12 col-xs-12">
                                     <br>
                                   	<button class="btn btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
                                    	<button class="btn" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>
                                 </div>
                           </div>
                         </div>
                   	</form>
                   </div>
                 </div><!--/tab-content-->

             </div><!--/tab-pane-->


        </div><!--/row-->
      </div> <!--container-->/

        <footer class="py-4 red-bar">
          <div class="container">
            <p class="m-0 text-center text-white">Copyright &copy; TigerMeals Delivery 2018</p>
          </div>
          <!-- /.container -->
        </footer>
</body>
</html>
