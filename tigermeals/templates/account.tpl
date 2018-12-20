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

  <!-- Navigation -->
  <nav class="navbar navbar-expand-md navbar-dark bg-danger fixed-top">
    <a class="navbar-brand" href="/home">TigerMeals Delivery</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="nav navbar-nav ml-auto">
        <li class="nav-item-bar">
          <a class="nav-link" href="/home">Home</a>
        <li class="nav-item-bar">
          <a class="nav-link" href="/about">About</a>
        </li>
        <li class="nav-item-bar active">
          <div class="dropdown">
            <a class="nav-link btn-danger dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown"  aria-expanded="false">
              Meals
            </a>
            <span class="sr-only">(current)</span>

            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
              <a class="dropdown-item" href="/meals">View all Meals</a>
              <a class="dropdown-item" href="/meals/restaurant">View by Restaurant</a>
            </div>
          </div>
        </li>
        <li class="nav-item-bar">
          <a class="nav-link" href="/account">My Account</a>
        </li>
        <li class="nav-item-bar">
          <a class="nav-link" id="menu-toggle">View Cart</i></a>
        </li>
        <li class="nav-item-bar mr-4">
          <a class="nav-link" href="/logout">Logout</i></a>
        </li>
      </ul>
    </div>
  </nav>

  <div id="wrapper">

    <!-- Sidebar -->
    <div id="sidebar-wrapper">
      <div class="row justify-content-center">
        <h2 class="mt-3">My Cart</h2>
      </div>

      <hr class="mt-1">

      {% if empty_cart %}
      <div class="cart-content text-primary text-center">

          Your cart is currently empty.

      </div>
      {% endif %}

      {% if (not empty_cart) %}
      <div class="cart-content text-primary">
          {% for i in range(0, length_cart) %}
          <div class="row mr-0 ml-0">
            <div class="col-1 pr-0">
              {{food_multiplier[i]}}
            </div>
            <div class="col-6">
              {{food_titles[i]}}
            </div>
            <div class="col-1 px-0">
              <form method="post" action="/cart/delete/{{food_ids[i]}}">
                <button class="transparent-btn"><i class="fa fa-trash" aria-hidden="true"></i></button>
              </form>
              <!-- <i class="fa fa-trash" aria-hidden="true"></i> -->
            </div>
            <div class="col-4 pl-0 pr-3 right-align-text">
              <span id="cart_subtotal{{i}}"></span>
              <script>
                var val = parseFloat({{food_subtotals[i]}}).toFixed(2);
                document.getElementById('cart_subtotal{{i}}').innerHTML = "$" + val;
              </script>
            </div>
          </div>
          {% endfor %}

          <hr>
          <div class="row mr-0 ml-0">
            <div class="col-7 pr-0">
              Item Subtotal:
            </div>
            <div class="col-5 pl-0 pr-3 right-align-text">
              <span id="total"></span>

              <script>
                var val = parseFloat({{total}}).toFixed(2);
                document.getElementById('total').innerHTML = "$" + val;
              </script>
            </div>
          </div>

          <div class="row mr-0 ml-0">
            <div class="col-7 pr-0">
              Delivery Fee:
            </div>
            <div class="col-5 pr-3 right-align-text">
              $5.00
            </div>
          </div>

          <div class="row mr-0 ml-0">
            <div class="col-7 pr-0">
              Order Total:
            </div>
            <div class="col-5 pl-0 pr-3 right-align-text">
              <span id="orderTotal"></span>

              <script>
                var subTotal = parseInt({{total}}) + parseInt(5);
                var valTotal = parseFloat(subTotal).toFixed(2);
                document.getElementById('orderTotal').innerHTML = "$" + valTotal;
              </script>
            </div>
          </div>
        </div>

        <div class="row justify-content-center">
          <a href="/checkout"><button class="btn btn-success">Checkout</button></a>
        </div>
        {% endif %}

    </div> <!-- /#sidebar-wrapper -->



    <!-- Page Content -->
    <div id="page-content-wrapper">
    <!-- Page Content -->
    <div class="container-fluid container">
        <div class="row">
          <div class="col-sm-3"><!--left col-->


          <div class="text-center">
            {% if image != "": %}
            <img src="{{image}}" class="avatar img-circle img-thumbnail" alt="avatar">
            {% else %}
            <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar">
            {% endif %}
            <br><br>
            <h6>Upload a different photo...</h6>
            <form method="post" action="/user/image/update" enctype=multipart/form-data>
              <input type="file" name="image" class="text-center center-block file-upload">
              <div class="mt-3" align="left"><button type="submit">Save Photo</button></div>
            </form>
          </div></hr><br>

            <div class="panel panel-default">
              <h6 class="mb-0 mt-1">Quick Stats </h6>
            <ul class="list-group">
              <li class="list-group-item text-left"><span class="pull-left"><strong>Orders</strong></span> {{length_past_orders}}</li>
              <li class="list-group-item text-left"><span class="pull-left"><strong>Restaurants</strong></span> {{number_different_rest}}</li>
            </ul>
          </div>

          </div><!--/col-3-->
          <div class="col-sm-9">
              <div class="row mb-2">
                <h1 class="ml-3">My Account</h1>
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



            <div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-tab">

                    <form class="form mt-3" action="/account/update" method="post" id="registrationForm">

                      <div class="row">
                          <div class="form-group col-6">
                              <div class="col-12">
                                  <label for="p_first_name"><h6 class="mb-0 mt-1">First Name</h6></label>
                                  <input type="text" class="form-control" name="p_first_name" id="p_first_name" value="{{name[0]}}" title="enter your first name if any.">
                              </div>
                          </div>
                          <div class="form-group col-6">
                              <div class="col-12">
                                <label for="p_last_name"><h6 class="mb-0 mt-1">Last Name</h6></label>
                                  <input type="text" class="form-control" name="p_last_name" id="p_last_name" value="{{name[1]}}" title="enter your last name if any.">
                              </div>
                          </div>
                          <div class="form-group col-6">

                              <div class="col-12">
                                  <label for="p_email"><h6 class="mb-0 mt-1">Email</h6></label>
                                  <input type="text" class="form-control" name="p_email" id="p_email" value="{{email}}" title="enter your email if any.">
                                  <div class = "text-warning">
                                You cannot change this
                              </div>
                              </div>

                          </div>
                          <div class="form-group col-6">

                              <div class="col-12">
                                <label for="p_phone"><h6 class="mb-0 mt-1">Phone Number</h6></label>
                                  <input type="text" class="form-control" name="p_phone" id="p_phone" value="{{phone}}" title="enter your phone number if any.">
                              </div>
                          </div>
                      </div>

                      <div class="row">
                          <div class="form-group col-12">
                              <div class="col-12">
                                  <label for="s_first_name"><h6 class="mb-0 mt-1">List Allergies</h6></label>
                                  <input type="text" class="form-control" name="p_allergies" id="s_first_name" value="{{allergies}}" title="enter your first name if any.">
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

              <div class="tab-pane fade show" id="pending-orders" role="tabpanel" aria-labelledby="pending-orders-tab">

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
                    {% with order=o,user=True, email=rest_emails_dict[o['restaurant_id']], restaurant=rests_dict[o['restaurant_id']] %}
                  {% include 'order_modals.tpl' %}
                {% endwith %}
              {% endfor %}
                </div>


                <div class="tab-pane fade show" id="active-orders" role="tabpanel" aria-labelledby="active-orders-tab">

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
                    {% with order=o,user=True, email=rest_emails_dict[o['restaurant_id']], restaurant=rests_dict[o['restaurant_id']] %}
                  {% include 'order_modals.tpl' %}
                {% endwith %}
              {% endfor %}
                </div>



                <div class="tab-pane fade show" id="history-orders" role="tabpanel" aria-labelledby="history-orders-tab">

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
                          <h6 class="mt-1 mb-0 float-right">Status: <br> Completed</h6>
                        </div>

                      </div>
                    </div>
                  </div>

                  {% endfor %}
                  {% for o in history_orders %}
                    {% with order=o,user=True, email=rest_emails_dict[o['restaurant_id']], restaurant=rests_dict[o['restaurant_id']] %}
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
  <script>
    $(function(){
      $("#menu-toggle").click(function(e) {
          e.preventDefault();
          $("#wrapper").toggleClass("toggled");
      });

      $(window).resize(function(e) {
        if($(window).width()<=768){
          $("#wrapper").removeClass("toggled");
        }else{
          $("#wrapper").addClass("toggled");
        }
      });
    });

  </script>
</body>
</html>
