<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="This is the page in which users will checkout after they have filled up their cart">
    <meta name="author" content="TigerMeals Delivery Team">

    <title>TigerMeals Delivery - My Account</title>
    <link rel='icon' href='/static/img/takeout.ico'></link>

    <!-- Bootstrap core CSS -->
    <link href="static/css/bootstrap-lux.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="static/css/shop-homepage.css" rel="stylesheet">
    <link href="static/css/clockpicker.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="static/dist/bootstrap-clockpicker.min.css">
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
  {% include 'nav.tpl' %}
  <script>
    document.getElementById('nav-account').classList.add('active');
  </script>

    <!-- Page Content -->
    <div id="page-content-wrapper">
    <!-- Page Content -->
    <div class="container-fluid container">
        <div class="row mb-4">
          <div class="col-sm-12 col-lg-3 mb-4"><!--left col-->


          <div class="text-center">

            <h1 class="ml-3 mt-4 mb-3 d-xs-inline d-lg-none">My Account</h1>
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
          </div>

            <div class="panel panel-default">
              <h6 class="mb-0 mt-1">Quick Stats </h6>
            <ul class="list-group">
              <li class="list-group-item text-left"><span class="pull-left"><strong>Orders</strong></span> {{length_past_orders}}</li>
              <li class="list-group-item text-left"><span class="pull-left"><strong>Restaurants</strong></span> {{number_different_rest}}</li>
            </ul>
          </div>

          </div><!--/col-3-->
          <div class="col-sm-12 col-lg-9">
              <div class="row mb-2">
                <h1 class="ml-3 d-none d-lg-inline">My Account</h1>
              </div>
              <ul class="nav nav-tabs" id="myTab" role="tablist">
                  <li class="nav-item">
                      <a class="nav-link active" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">My Profile</a>
                  </li>

                  <li class="nav-item">
                      <a class="nav-link" id="pending-orders-tab" data-toggle="tab" href="#pending-orders" role="tab" aria-controls="pending-orders" aria-selected="true">My Pending Orders</a>
                  </li>

                  <li class="nav-item">
                      <a class="nav-link" id="active-orders-tab" data-toggle="tab" href="#active-orders" role="tab" aria-controls="active-orders" aria-selected="true">My Orders To Be Delivered</a>
                  </li>

                  <li class="nav-item">
                      <a class="nav-link" id="history-orders-tab" data-toggle="tab" href="#history-orders" role="tab" aria-controls="history-orders" aria-selected="true">My Order History</a>
                  </li>
              </ul>


            <div class="tab-content profile-tab" id="myTabContent">



            <div class="tab-pane fade show active col-md-12" id="profile" role="tabpanel" aria-labelledby="profile-tab">

                    <form class="form mt-3" action="/account/update" method="post" id="registrationForm">

                      <div class="row">
                          <div class="form-group col-md-6">
                              <div class="col-12">
                                  <label for="p_first_name"><h6 class="mb-0 mt-1">First Name</h6></label>
                                  <input type="text" class="form-control" name="p_first_name" id="p_first_name" value="{{name[0]}}" title="enter your first name if any.">
                              </div>
                          </div>
                          <div class="form-group col-md-6">
                              <div class="col-12">
                                <label for="p_last_name"><h6 class="mb-0 mt-1">Last Name</h6></label>
                                  <input type="text" class="form-control" name="p_last_name" id="p_last_name" value="{{name[1]}}" title="enter your last name if any.">
                              </div>
                          </div>
                          <div class="form-group col-md-6">

                              <div class="col-12">
                                  <label for="p_email"><h6 class="mb-0 mt-1">Email</h6></label>
                                  <input type="text" class="form-control" name="p_email" id="p_email" value="{{email}}" title="enter your email if any.">
                                  <div class = "text-warning">
                                You cannot change this
                              </div>
                              </div>

                          </div>
                          <div class="form-group col-md-6">

                              <div class="col-12">
                                <label for="p_phone"><h6 class="mb-0 mt-1">Phone Number</h6></label>
                                  <input type="text" class="form-control" name="p_phone" id="p_phone" value="{{phone}}" title="enter your phone number if any.">
                              </div>
                          </div>
                      </div>

                      <div class="row">
                          <div class="form-group col-12">
                              <div class="col-12">
                                  <label for="s_first_name"><h6 class="mb-0 mt-1">Select Allergies and Dietary Restrictions</h6></label>
                                  <!--<input type="text" class="form-control" name="p_allergies" id="s_first_name" value="{{allergies}}" title="enter your first name if any."> -->

                                  <div class="row">
                               <div class="col-6 col-lg-4">
                                 <div class="checkbox">
                                   <label>
                                     <input type="checkbox"  name="allergens1" value="Kosher">
                                     Kosher
                                   </label>
                                 </div>
                               </div>
                               <div class="col-6 col-lg-4">
                                 <div class="checkbox">
                                   <label>
                                     <input type="checkbox"  name="allergens2" value="Vegan">
                                     Vegan
                                   </label>
                                 </div>
                               </div>
                               <div class="col-6 col-lg-4">
                                 <div class="checkbox">
                                   <label>
                                     <input type="checkbox"  name="allergens3" value="Vegetarian">
                                     Vegetarian
                                   </label>
                                 </div>
                               </div>
                               <div class="col-6 col-lg-4">
                                 <div class="checkbox">
                                   <label>
                                     <input type="checkbox"  name="allergens4" value="No dairy">
                                     No dairy
                                   </label>
                                 </div>
                               </div>
                               <div class="col-6 col-lg-4">
                                 <div class="checkbox">
                                   <label>
                                     <input type="checkbox"  name="allergens5" value="Nut allergies">
                                     Nut allergies
                                   </label>
                                 </div>
                               </div>
                               <div class="col-6 col-lg-4">
                                 <div class="checkbox">
                                   <label>
                                     <input type="checkbox"  name="allergens6" value="No eggs">
                                     No eggs
                                   </label>
                                 </div>
                               </div>
                               <div class="col-6 col-lg-4">
                                 <div class="checkbox">
                                   <label>
                                     <input type="checkbox"  name="allergens7" value="Gluten free">
                                     Gluten free
                                   </label>
                                 </div>
                              </div>
                        </div>
                      </div>
                    </div>
                      </div>
                      <div class="row">
                          <div class="form-group col-12">
                              <div class="col-12">
                                  <label for="s_first_name"><h6 class="mb-0 mt-1">Preferred Delivery Location</h6></label>
                                  <input type="text" class="form-control" name="p_address" id="s_first_name" value="{{address}}" title="enter your first name if any.">
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
                <script>
                          var elements = document.getElementById('registrationForm').elements;
                            var _URL = window.URL || window.webkitURL;

                            for (var i = 0; i < elements.length; i++) {
                              if({{allergies}}.includes(elements[i].value)) {
                                elements[i].checked = true;
                              }
                            }
                </script>

              <div class="tab-pane fade show" id="pending-orders" role="tabpanel" aria-labelledby="pending-orders-tab">

                {% if not pending_order[0] %}
                  <div class="row mt-3 mx-3">
                    <p class="text-dark">You currently do not have any pending orders.</p>
                  </div>
                {% endif %}
                {% for order in pending_order %}

              <div class="row mt-2">
                <div class="col-10">
                  <h4 class="float-left mt-2" href="#">Order #{{order['order_id']}}</h4>
                </div>
                <div class="col-2">
                  <button type="button" class="btn btn-info restuarant_list_button float-right mb-2" data-toggle="modal" data-target="#{{order['order_id']}}">
                    View order
                  </button>
                </div>
              </div>
              <div class="card col-md-12 px-3 pt-2 mb-3 border-dark">

                <div class="row">
                  <div class="col-10">
                    <div class="row">
                    <div class="col-4">
                      <h6 class="mb-0 mt-1">Order Placed on</h6>
                    </div>
                    <div class="col-8">
                      <p>{{order['date']}}</p>
                    </div>


                    <div class="col-4">
                      <h6 class="mb-0 mt-1">Delivery Time</h6>
                    </div>
                    <div class="col-8">
                      <p>{{order['delivery_time']}}</p>
                    </div>


                    <div class="col-4">
                      <h6 class="mb-0 mt-1">Location</h6>
                    </div>
                    <div class="col-8">
                      <p>{{order['location']}}</p>
                    </div>


                    <div class="col-4">
                      <h6 class="mb-0 mt-1">Restaurant</h6>
                    </div>
                    <div class="col-8">
                      <p>{{rests_dict[order['restaurant_id']]}}</p>
                    </div>
                  </div>
                </div>

                  <div class="col-2">
                    <div class="row pr-2">
                          <h6 class="mt-1 mb-0 text-success float-right">$<span id="price{{order['order_id']}}">{{order['price']}}</span></h6>
                          </div>
                          <script>
                            var val = parseFloat({{order['price']}}).toFixed(2);
                            document.getElementById("price{{order['order_id']}}").innerHTML = val;
                          </script>
                    <div class="row pr-2">
                          <h6 class="mt-1 mb-0 float-right">Status: <br> Pending</h6>
                    </div>
                  </div>
                </div>
              </div>


              {% endfor %}
              {% for o in pending_order %}
                    {% with order=o,user=True, email=rest_emails_dict[o['restaurant_id']], restaurant=rests_dict[o['restaurant_id']], phone=rest_phones_dict[o['restaurant_id']] %}
                  {% include 'order_modals.tpl' %}
                {% endwith %}
              {% endfor %}
                </div>


                <div class="tab-pane fade show" id="active-orders" role="tabpanel" aria-labelledby="active-orders-tab">

                  {% if not inprogress_orders[0] %}
                    <div class="row mt-3 mx-3">
                      <p class="text-dark">You currently do not have any orders in progress.</p>
                    </div>
                  {% endif %}
                  {% for order in inprogress_orders %}

                  <div class="row mt-2">
                    <div class="col-10">
                      <h4 class="float-left mt-2" href="#">Order #{{order['order_id']}}</h4>
                    </div>
                    <div class="col-2">
                      <button type="button" class="btn btn-info restuarant_list_button float-right mb-2" data-toggle="modal" data-target="#{{order['order_id']}}">
                        View order
                      </button>
                    </div>
                  </div>
                  <div class="card col-md-12 px-3 pt-2 mb-3 border-dark">

                    <div class="row">
                      <div class="col-10">
                        <div class="row">
                        <div class="col-4">
                          <h6 class="mb-0 mt-1">Order Placed on</h6>
                        </div>
                        <div class="col-8">
                          <p>{{order['date']}}</p>
                        </div>


                        <div class="col-4">
                          <h6 class="mb-0 mt-1">Delivery Time</h6>
                        </div>
                        <div class="col-8">
                          <p>{{order['delivery_time']}}</p>
                        </div>


                        <div class="col-4">
                          <h6 class="mb-0 mt-1">Location</h6>
                        </div>
                        <div class="col-8">
                          <p>{{order['location']}}</p>
                        </div>


                        <div class="col-4">
                          <h6 class="mb-0 mt-1">Restaurant</h6>
                        </div>
                        <div class="col-8">
                          <p>{{rests_dict[order['restaurant_id']]}}</p>
                        </div>
                      </div>
                    </div>

                      <div class="col-2">
                        <div class="row pr-2">
                          <h6 class="mt-1 mb-0 text-success float-right">$<span id="price{{order['order_id']}}">{{order['price']}}</span></h6>
                          </div>
                          <script>
                            var val = parseFloat({{order['price']}}).toFixed(2);
                            document.getElementById("price{{order['order_id']}}").innerHTML = val;
                          </script>
                        <div class="row pr-2">
                          <h6 class="mt-1 mb-0 float-right">Status: <br> In Progress</h6>
                        </div>
                      </div>
                    </div>
                  </div>

                  {% endfor %}
                  {% for o in inprogress_orders %}
                    {% with order=o,user=True, email=rest_emails_dict[o['restaurant_id']], restaurant=rests_dict[o['restaurant_id']], phone=rest_phones_dict[o['restaurant_id']] %}
                  {% include 'order_modals.tpl' %}
                {% endwith %}
              {% endfor %}
                </div>



                <div class="tab-pane fade show" id="history-orders" role="tabpanel" aria-labelledby="history-orders-tab">

                  {% if not history_orders[0] %}
                    <div class="row mt-3 mx-3">
                      <p class="text-dark">Your order history is empty.</p>
                    </div>
                  {% endif %}
                  {% for order in history_orders %}

                  <div class="row mt-2">
                    <div class="col-10">
                      <h4 class="float-left mt-2" href="#">Order #{{order['order_id']}}</h4>
                    </div>
                    <div class="col-2">
                      <button type="button" class="btn btn-info restuarant_list_button float-right mb-2" data-toggle="modal" data-target="#{{order['order_id']}}">
                        View order
                      </button>
                    </div>
                  </div>
                  <div class="card col-md-12 px-3 pt-2 mb-3 border-dark">

                    <div class="row">
                      <div class="col-10">
                        <div class="row">
                        <div class="col-4">
                          <h6 class="mb-0 mt-1">Order Placed on</h6>
                        </div>
                        <div class="col-8">
                          <p>{{order['date']}}</p>
                        </div>


                        <div class="col-4">
                          <h6 class="mb-0 mt-1">Delivery Time</h6>
                        </div>
                        <div class="col-8">
                          <p>{{order['delivery_time']}}</p>
                        </div>


                        <div class="col-4">
                          <h6 class="mb-0 mt-1">Location</h6>
                        </div>
                        <div class="col-8">
                          <p>{{order['location']}}</p>
                        </div>


                        <div class="col-4">
                          <h6 class="mb-0 mt-1">Restaurant</h6>
                        </div>
                        <div class="col-8">
                          <p>{{rests_dict[order['restaurant_id']]}}</p>
                        </div>

                        <div class="col-4">
                          <h6 class="mb-0 mt-1">Rate your experience!</h6>
                        </div>
                        <div class="col-8">
                          <form id="orderRating{{order['order_id']}}" action="/updateRating" method="post">
                              <p>Current rating: {{order['rating']}}</p>
                              <input type="hidden" name="order_id" value="{{order['order_id']}}">
                                <input type="radio" class="radio" name="rating" value="1" id="{{order['order_id']}}rating1" onclick="enableSave{{order['order_id']}}()"/>
                                <label for="rating1">1 (Poor)</label>
                                <input type="radio" class="radio" name="rating" value="2" id="{{order['order_id']}}rating2" onclick="enableSave{{order['order_id']}}()"/>
                                <label for="rating2">2</label>
                                <input type="radio" class="radio" name="rating" value="3" id="{{order['order_id']}}rating3" onclick="enableSave{{order['order_id']}}()"/>
                                <label for="rating3">3</label>
                                <input type="radio" class="radio" name="rating" value="4" id="{{order['order_id']}}rating4" onclick="enableSave{{order['order_id']}}()"/>
                                <label for="rating4">4</label>
                                <input type="radio" class="radio" name="rating" value="5" id="{{order['order_id']}}rating5" onclick="enableSave{{order['order_id']}}()"/>
                                <label for="rating5">5 (Excellent)</label>
                                <button class="btn btn-outline-primary btn-sm text-center center-block my-2" id ="saveRating{{order['order_id']}}" type="submit" disabled> Save Rating </button>
                              </form>
                        </div>
                      </div>

                    </div>
                    <script>

                      if ({{order['rating']}} == 1){
                        document.getElementById("{{order['order_id']}}rating1").checked = true;
                      }
                      else if ({{order['rating']}} == 2){
                        document.getElementById("{{order['order_id']}}rating2").checked = true;
                      }
                      else if ({{order['rating']}} == 3){
                        document.getElementById("{{order['order_id']}}rating3").checked = true;
                      }
                      else if ({{order['rating']}} == 4){
                        document.getElementById("{{order['order_id']}}rating4").checked = true;

                      }
                      else if ({{order['rating']}} == 5){
                        document.getElementById("{{order['order_id']}}rating5").checked = true;

                      }
                      function enableSave{{order['order_id']}}(){
                        document.getElementById("saveRating{{order['order_id']}}").disabled = false;
                      }
                    </script>

                      <div class="col-2">
                        <div class="row pr-2">
                          <h6 class="mt-1 mb-0 text-success float-right">$<span id="price{{order['order_id']}}">{{order['price']}}</span></h6>
                          </div>
                          <script>
                            var val = parseFloat({{order['price']}}).toFixed(2);
                            document.getElementById("price{{order['order_id']}}").innerHTML = val;
                          </script>

                        {% if not order['denied'] %}
                        <div class="row pr-2">
                          <h6 class="mt-1 mb-0 float-right">Status: <br> Completed</h6>
                        </div>
                        {% else %}
                        <div class="row pr-2">
                          <h6 class="mt-1 mb-0 float-right">Status: <br> Denied</h6>
                        </div>
                        {% endif %}

                      </div>
                    </div>
                  </div>

                  {% endfor %}
                  {% for o in history_orders %}
                    {% with order=o,user=True, email=rest_emails_dict[o['restaurant_id']], restaurant=rests_dict[o['restaurant_id']], phone=rest_phones_dict[o['restaurant_id']] %}
                      {% include 'order_modals.tpl' %}
                    {% endwith %}
                  {% endfor %}

                </div>

             </div><!--/tab-content-->

         </div><!--/tab-pane-->


        </div><!--/row-->
      </div> <!--container-->

      <footer class="py-4 red-bar mb-0">
        <div class="container">
          <p class="m-0 text-center text-white">Copyright &copy; TigerMeals Delivery 2018</p>
        </div>
        <!-- /.container -->
      </footer>


    </div>
    <!-- #page-content-wrapper -->

  </div>
  <!-- #wrapper -->

  <!-- Bootstrap core JavaScript -->
  <script src="/static/vendor/jquery/jquery.min.js"></script>
  <script src="/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  {% include 'handle_toggle.tpl' %}
</body>
</html>

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
