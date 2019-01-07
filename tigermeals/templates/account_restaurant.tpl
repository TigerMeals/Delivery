<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="This is the page in which users will checkout after they have filled up their cart">
    <meta name="author" content="TigerMeals Delivery Team">

    <title>TigerMeals Delivery - Restaurant Account</title>
    <link rel='icon' href='/static/img/takeout.ico'></link>

    <!-- Bootstrap core CSS -->
    <link href="/static/css/bootstrap-lux.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/static/css/restaurant.css" rel="stylesheet">

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


</head>

<body>
    {% include 'nav_restaurant.tpl' %}

    <script>
      document.getElementById('nav-account').classList.add('active');
    </script>
    <br>
    <div class="container">
        <div class="row mt-2 mb-4">
      		<div class="col-sm-12 col-lg-3 mb-4"><!--left col-->
          <div class="text-center">
            {% if image != "": %}
            <img src="{{image}}" class="avatar img-circle img-thumbnail" alt="avatar">
            {% else %}
            <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar">
            {% endif %}
            <br><br>
            <h6>Upload a different photo...</h6>
            <form method="post" action="/user/image/update" enctype=multipart/form-data>
              <hr>
              <input type="file" id = "file" name="image" class="text-center center-block file-upload">
              <hr>
              <button id = "save" class="btn btn-outline-primary btn-sm text-center center-block" type="submit" disabled>Save Photo</button>
              <hr>
            </form>
            <div id = "imageError" class="text-danger" style="visibility:hidden"> Image width and height must be at least 200 pixels!</div>
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
        	<div class="col-sm-12 col-lg-9">
              <div class="row">
                <div class="col-12">
                  <h1>{{name}}</h1>
                </div>

              </div>
              <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#profile" class="mr-2">Profile</a></li>
                <li><a data-toggle="tab" href="#account" class="mr-2">Account</a></li>
                <li><a data-toggle="tab" href="#settings">Settings</a></li>
              </ul>

             <div class="tab-content">
                <div class="tab-pane active" id="profile">

                      <form class="form" action="/restaurant/profile/update" method="post" id="profileForm">
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
                          <div class="form-group col-sm-12 col-md-6">

                              <div class="col-12">
                                  <label for="phone"><h5>Phone</h5></label>
                                  <input type="text" class="form-control" name="phone" id="phone" value="{{phone}}" title="enter your phone number if any.">
                              </div>
                          </div>

                          <div class="form-group col-sm-12 col-md-6">
                              <div class="col-12">
                                 <label for="website"><h5>Website</h5></label>
                                  <input type="text" class="form-control" name="website" id="website" value="{{website}}" title="enter your website if any.">
                              </div>
                          </div>
                        </div>

                        <div class="row">
                          <div class="form-group col-sm-12 col-md-6">

                              <div class="col-12">
                                  <label for="email"><h5>Email</h5></label>
                                  <input type="email" class="form-control" id="email" value="{{email}}" title="enter your email.">
                              </div>
                          </div>
                          <div class="form-group col-sm-12 col-md-6">

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
                                <a class="btn btn-outline-primary" href="/view">View my profile as a customer</a>
                              </div>
                          </div>
                        </div>

                        <div class="row">
                          <div class="form-group">
                               <div class="col-12 col-xs-12">
                                    <br>
                                  	<button class="btn btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
                                </div>
                          </div>
                        </div>
                  	</form>
                  </div>


                  <div class="tab-pane" id="account">

                        <form class="form" action="/restaurant/account/update" method="post" id="accountForm">
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
                                  </div>
                            </div>
                          </div>
                     </form>
                    </div>


                 <div class="tab-pane" id="settings">

                       <form class="form" action="#" method="post" id="settingsForm">
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
                                 </div>
                           </div>
                         </div>
                   	</form>
                   </div>
                 </div><!--/tab-content-->

             </div><!--/tab-pane-->


        </div><!--/row-->
      </div> <!--container-->

    </div>

    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="/static/dist/bootstrap-clockpicker.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script src="/static/vendor/jquery/jquery.min.js"></script>
    <script src="/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


    <script>
          var _URL = window.URL || window.webkitURL;

          $("#file").change(function(e) {

              var image, file;

              if ((file = this.files[0])) {

                  image = new Image();

                  image.onload = function() {
                    if (this.width < 200 || this.height < 200){
                      document.getElementById("imageError").style.visibility = "visible";
                      document.getElementById("save").disabled = true;
                    }
                    else
                    {
                      document.getElementById("imageError").style.visibility = "hidden";
                      document.getElementById("save").disabled = false;
                    }

                      //alert("The image width is " +this.width + " and image height is " + this.height);
                  };
                  //if (this.width >= 200 && this.height >= 200)
                  image.src = _URL.createObjectURL(file);
                }

              });

        </script>

    <footer class="py-4 red-bar">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; TigerMeals Delivery 2018</p>
      </div>
      <!-- /.container -->
    </footer>
</body>
</html>
