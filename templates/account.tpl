<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="This is the page in which users will checkout after they have filled up their cart">
    <meta name="author" content="TigerMeals Delivery Team">

    <title>TigerMeals Delivery - My Account</title>
    <link rel='icon' href='static/img/takeout.ico'></link>

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
    <nav class="navbar red-bar navbar-expand-lg navbar-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="#">TigerMeals Delivery</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item-bar">
              <a class="nav-link" href="/home">Home</a>
            </li>
            <li class="nav-item-bar">
              <a class="nav-link" href="/about">About</a>
            </li>
            <li class="nav-item-bar">
              <a class="nav-link" href="/meals">Meals</a>
            </li>
            <li class="nav-item-bar active">
              <a class="nav-link" href="/account">My Account</a>
            </li>
            <li class="nav-item-bar justify-content-end dropdown">
              <a class="nav-link justify-content-end" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> View Cart ({{length_cart}}) <i class="fa fa-caret-down"></i></a>
    						<span class="sr-only">(current)</span>
    					<ul class="dropdown-menu dropdown-menu-left dropdown-cart" role="menu">
    						{% for i in range(0, length_cart) %}
    							<li>
    									<span class="item">
    										<span class="item-left">
    												<img
    												src="{{food_images[i]}}"
    												style="width:35px;height:35px;"
    												 alt="" />
    												<span class="item-info">
    														<span>{{food_titles[i]}}</span>
    														<span id = "cart_price{{i}}"></span>
                                <!-- Below needed so that price displays with 2 decimal points. -->
                                <script>
                                  var val = parseFloat({{food_prices[i]}}).toFixed(2);
                                  document.getElementById('cart_price{{i}}').innerHTML = "price: $" + val;
                                </script>
    												</span>
    										</span>
    										<span class="item-right">
    												<button class="btn-sm btn-danger btn-cart fa fa-times"></button>
    										</span>
    								</span>
    							</li>

    							<li class="divider"></li>
    							<li>
                    <span id = "cart_subtotal{{i}}"></span>
                    <!-- Below needed so that price displays with 2 decimal points. -->
                    <script>
                      var val = parseFloat({{food_subtotals[i]}}).toFixed(2);
                      document.getElementById('cart_subtotal{{i}}').innerHTML = "Subtotal: $" + val;
                    </script>

    						{% endfor %}
    						<span class="checkout-text item-right">
                    <span id = "total"></span>
                    <!-- Below needed so that price displays with 2 decimal points. -->
                    <script>
                      var val = parseFloat({{total}}).toFixed(2);
                      document.getElementById('total').innerHTML = "Total: $" + val;
                    </script>
                    <a class="checkout-text item-left" href="/cart">View Cart</a>
                    <a class="checkout-text item-right" href="/checkout">Checkout</a>
                    <br>
    							</li>
    					</ul>
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
            <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar">
            <br><br>
            <h6>Upload a different photo...</h6>
            <input type="file" class="text-center center-block file-upload">
          </div></hr><br>

            <div class="panel panel-default">
              <h5>Quick Stats </h5>
            <ul class="list-group">
              <li class="list-group-item text-left"><span class="pull-left"><strong>Orders</strong></span> 13</li>
              <li class="list-group-item text-left"><span class="pull-left"><strong>Restaurants</strong></span> 7</li>
              <li class="list-group-item text-left"><span class="pull-left"><strong>Overall Rating</strong></span> 4.5</li>
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
                <h1>User name</h1>
              </div>
              <ul class="nav nav-tabs" id="myTab" role="tablist">
                  <li class="nav-item">
                      <a class="nav-link active" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">My Profile</a>
                  </li>

                  <li class="nav-item">
                      <a class="nav-link" id="orders-tab" data-toggle="tab" href="#orders" role="tab" aria-controls="orders" aria-selected="true">My Orders</a>
                  </li>

              </ul>


            <div class="tab-content profile-tab" id="myTabContent">



                  <div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                  <!-- <div class="tab-pane" id="account"> -->
                    <hr>
                        <form class="form" action="##" method="post" id="registrationForm">
                          <div class="row">
                            <div class="form-group col-6">

                                <div class="col-12">
                                    <label for="username"><h5>Username</h5></label>
                                    <input type="username" class="form-control" name="username" id="username" value="{{netid}}" title="enter your username.">
                                </div>
                            </div>

                          </div>
                          <div class="row">
                            <div class="form-group col-6">

                                <div class="col-12">
                                    <label for="password"><h5>Password</h5></label>
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
                                <h4 class="ml-3"> About Me </h4>
                              </div>
                              <div class="form-group col-6">
                                  <div class="col-12">
                                      <label for="p_first_name"><h5>First Name</h5></label>
                                      <input type="text" class="form-control" name="p_first_name" id="p_first_name" value="{{name[0]}}" title="enter your first name if any.">
                                  </div>
                              </div>
                              <div class="form-group col-6">
                                  <div class="col-12">
                                    <label for="p_last_name"><h5>Last Name</h5></label>
                                      <input type="text" class="form-control" name="p_last_name" id="p_last_name" value="{{name[1]}}" title="enter your last name if any.">
                                  </div>
                              </div>
                              <div class="form-group col-6">

                                  <div class="col-12">
                                      <label for="p_email"><h5>Email</h5></label>
                                      <input type="text" class="form-control" name="p_email" id="p_email" value="{{netid}}@princeton.edu" title="enter your email if any.">
                                  </div>
                              </div>
                              <div class="form-group col-6">

                                  <div class="col-12">
                                    <label for="p_phone"><h5>Phone Number</h5></label>
                                      <input type="text" class="form-control" name="p_phone" id="p_phone" value="{{phone}}" title="enter your phone number if any.">
                                  </div>
                              </div>
                          </div>

                          <hr>
                          <div class="row">
                              <div class="col-12">
                                <h4 class="ml-3"> Allergies </h4>
                              </div>
                              <div class="form-group col-12">
                                  <div class="col-12">
                                      <label for="s_first_name"><h5>List Allergies</h5></label>
                                      <input type="text" class="form-control" name="s_first_name" id="s_first_name" value="{{allergies}}" title="enter your first name if any.">
                                  </div>
                              </div>
                          </div>

                          <hr>
                          <div class="row">
                              <div class="col-12">
                                <h4 class="ml-3"> Delivery Preferences </h4>
                              </div>
                              <div class="form-group col-12">
                                  <div class="col-12">
                                      <label for="s_first_name"><h5>Preferred Delivery Location</h5></label>
                                      <input type="text" class="form-control" name="s_first_name" id="s_first_name" value="{{address}}" title="enter your first name if any.">
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

                    <div class="tab-pane fade show" id="orders" role="tabpanel" aria-labelledby="orders-tab">

                      <hr>
                      <div class="row">
                        <h2>Orders Pending Approval</h2>
                      </div>
                      <div class="row">
                        <div class="col-10">
                          <h4 class="float-left" href="#">Order #94050</h4>
                        </div>
                        <div class="col-2">
                          <button type="button" class="btn btn-info restuarant_list_button float-right" data-toggle="modal" data-target="#ordernumber">
                            View order
                          </button>
                        </div>
                      </div>
                      <div class="row my-0">
                        <div class="col-12">
                          <p class="mb-0">Placed on 12/7/2018 at 3:56PM</p>
                        </div>
                      </div>
                      <div class="card col-md-12 px-3 py-2 mb-3 border-dark">
                        <div class="row">
                          <div class="col-md-5 order-md-1">
                            <div class="row pl-2">
                              <h5>Delivery Time </h5>
                              <p class="text-muted">December 15, 2017 8:00AM</p>
                            </div>
                            <div class="row pl-2">
                              <h5>Location </h5>
                              <p class="text-muted">Murray Dodge Cafe</p>
                            </div>
                            <div class="row pl-2">
                              <h5>Catering Package(s) Selected </h5>
                              <p class="text-muted" href="#">Taco Assortment for Twenty People (2)</p>
                              <p class="text-muted" href="#">Sangria Party Mix (1)</p>
                              <p class="text-muted" href="#">Spicy Fajita Party Platter (1)</p>
                            </div>
                          </div>
                          <div class = "col-md-5 order-md-2">
                            <div class="row pl-2">
                              <h5>Restaurant Information </h5>
                              <p class="text-muted">Panera</p>
                              <p class="text-muted">hello@panera.com</p>
                              <p class="text-muted">123-345-6789</p>
                            </div>
                            <div class="row pl-2">
                              <h5>Customization </h5> <br>
                              <p class="text-muted" href="#">N/A</p>
                              <p class="text-muted" href="#">Sangria Party Mix (1)</p>
                              <p class="text-muted" href="#">Spicy Fajita Party Platter (1)</p>
                            </div>
                          </div>
                          <div class = "col-md-2 order-md-3">
                            <h5 class="text-success float-right">$100.00</h5>
                          </div>
                        </div>
                      </div>


                      <div class="row">
                        <div class="col-10">
                          <h4 class="float-left" href="#">Order #94055</h4>
                        </div>
                        <div class="col-2">
                          <button type="button" class="btn btn-info restuarant_list_button float-right" data-toggle="modal" data-target="#ordernumber">
                            View order
                          </button>
                        </div>
                      </div>
                      <div class="row my-0">
                        <div class="col-12">
                          <p class="mb-0">Placed on 12/7/2018 at 3:56PM</p>
                        </div>
                      </div>
                      <div class="card col-md-12 px-3 py-2 mb-3 border-dark">
                        <div class="row">
                          <div class="col-md-5 order-md-1">
                            <div class="row pl-2">
                              <h5>Delivery Time </h5>
                              <p class="text-muted">December 15, 2017 8:43AM</p>
                            </div>
                            <div class="row pl-2">
                              <h5>Location </h5>
                              <p class="text-muted">Murray Dodge Cafe</p>
                            </div>
                            <div class="row pl-2">
                              <h5>Catering Package(s) Selected </h5>
                              <p class="text-muted" href="#">Taco Assortment for Twenty People (2)</p>
                              <p class="text-muted" href="#">Sangria Party Mix (1)</p>
                              <p class="text-muted" href="#">Spicy Fajita Party Platter (1)</p>
                            </div>
                          </div>
                          <div class = "col-md-5 order-md-2">
                            <div class="row pl-2">
                              <h5>Restaurant Information </h5>
                              <p class="text-muted">Panera</p>
                              <p class="text-muted">hello@panera.com</p>
                              <p class="text-muted">123-345-6789</p>
                            </div>
                            <div class="row pl-2">
                              <h5>Customization </h5> <br>
                              <p class="text-muted" href="#">N/A</p>
                              <p class="text-muted" href="#">Sangria Party Mix (1)</p>
                              <p class="text-muted" href="#">Spicy Fajita Party Platter (1)</p>
                            </div>
                          </div>
                          <div class = "col-md-2 order-md-3">
                            <h5 class="text-success float-right">$100.00</h5>
                          </div>
                        </div>
                      </div>

                      <div class="row">
                        <h2>Orders To Be Delivered</h2>
                      </div>
                      <div class="row">
                        <div class="col-10">
                          <h4 class="float-left" href="#">Order #94050</h4>
                        </div>
                        <div class="col-2">
                          <button type="button" class="btn btn-info restuarant_list_button float-right" data-toggle="modal" data-target="#ordernumber">
                            View order
                          </button>
                        </div>
                      </div>
                      <div class="row my-0">
                        <div class="col-12">
                          <p class="mb-0">Placed on 12/7/2018 at 3:56PM</p>
                        </div>
                      </div>
                      <div class="card col-md-12 px-3 py-2 mb-3 border-dark">
                        <div class="row">
                          <div class="col-md-5 order-md-1">
                            <div class="row pl-2">
                              <h5>Delivery Time </h5>
                              <p class="text-muted">December 15, 2017 8:43AM</p>
                            </div>
                            <div class="row pl-2">
                              <h5>Location </h5>
                              <p class="text-muted">Murray Dodge Cafe</p>
                            </div>
                            <div class="row pl-2">
                              <h5>Catering Package(s) Selected </h5>
                              <p class="text-muted" href="#">Taco Assortment for Twenty People (2)</p>
                              <p class="text-muted" href="#">Sangria Party Mix (1)</p>
                              <p class="text-muted" href="#">Spicy Fajita Party Platter (1)</p>
                            </div>
                          </div>
                          <div class = "col-md-5 order-md-2">
                            <div class="row pl-2">
                              <h5>Restaurant Information </h5>
                              <p class="text-muted">Panera</p>
                              <p class="text-muted">hello@panera.com</p>
                              <p class="text-muted">123-345-6789</p>
                            </div>
                            <div class="row pl-2">
                              <h5>Customization </h5> <br>
                              <p class="text-muted" href="#">N/A</p>
                              <p class="text-muted" href="#">Sangria Party Mix (1)</p>
                              <p class="text-muted" href="#">Spicy Fajita Party Platter (1)</p>
                            </div>
                          </div>
                          <div class = "col-md-2 order-md-3">
                            <h5 class="text-success float-right">$100.00</h5>
                          </div>
                        </div>
                      </div>


                      <div class="row">
                        <h2>Completed Orders</h2>
                      </div>
                      <div class="row">
                        <div class="col-10">
                          <h4 class="float-left" href="#">Order #94050</h4>
                        </div>
                        <div class="col-2">
                          <button type="button" class="btn btn-info restuarant_list_button float-right" data-toggle="modal" data-target="#ordernumber">
                            View order
                          </button>
                        </div>
                      </div>
                      <div class="row my-0">
                        <div class="col-12">
                          <p class="mb-0">Placed on 12/7/2018 at 3:56PM</p>
                        </div>
                      </div>
                      <div class="card col-md-12 px-3 py-2 mb-3 border-dark">
                        <div class="row">
                          <div class="col-md-5 order-md-1">
                            <div class="row pl-2">
                              <h5>Delivery Time </h5>
                              <p class="text-muted">December 15, 2017 8:43AM</p>
                            </div>
                            <div class="row pl-2">
                              <h5>Location </h5>
                              <p class="text-muted">Murray Dodge Cafe</p>
                            </div>
                            <div class="row pl-2">
                              <h5>Catering Package(s) Selected </h5>
                              <p class="text-muted" href="#">Taco Assortment for Twenty People (2)</p>
                              <p class="text-muted" href="#">Sangria Party Mix (1)</p>
                              <p class="text-muted" href="#">Spicy Fajita Party Platter (1)</p>
                            </div>
                          </div>
                          <div class = "col-md-5 order-md-2">
                            <div class="row pl-2">
                              <h5>Restaurant Information </h5>
                              <p class="text-muted">Panera</p>
                              <p class="text-muted">hello@panera.com</p>
                              <p class="text-muted">123-345-6789</p>
                            </div>
                            <div class="row pl-2">
                              <h5>Customization </h5> <br>
                              <p class="text-muted" href="#">N/A</p>
                              <p class="text-muted" href="#">Sangria Party Mix (1)</p>
                              <p class="text-muted" href="#">Spicy Fajita Party Platter (1)</p>
                            </div>
                          </div>
                          <div class = "col-md-2 order-md-3">
                            <h5 class="text-success float-right">$100.00</h5>
                          </div>
                        </div>
                      </div>

                    </div>


                    <!-- Modal -->
                    <div class="modal fade" id="ordernumber" tabindex="-1" role="dialog" aria-labelledby="newListingTitle" aria-hidden="true">
                      <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h3 class="modal-title" id="ordernumber">Order Number</h3>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">
                            <div class="row">

                              <div class="col-4">
                                <h5>Order Placed on</h5>
                              </div>
                              <div class="col-8">
                                <p>Friday, December 7th, 3:56pm</p>
                              </div>


                              <div class="col-4">
                                <h5>Delivery Time</h5>
                              </div>
                              <div class="col-8">
                                <p>Saturday, December 17th, 4:30pm</p>
                              </div>


                              <div class="col-4">
                                <h5>Location</h5>
                              </div>
                              <div class="col-8">
                                <p>CS Tea Room</p>
                              </div>


                              <div class="col-4">
                                <h5>Restaurant</h5>
                              </div>
                              <div class="col-8">
                                <p>Panera</p>
                              </div>

                              <div class="col-4">
                                <h5>Restaurant Phone Number</h5>
                              </div>
                              <div class="col-8">
                                <p>(083)-893-3920</p>
                              </div>

                              <div class="col-4">
                                <h5>Restaurant Email</h5>
                              </div>
                              <div class="col-8">
                                <p>hello@panera.com</p>
                              </div>

                            </div>

                            <div class="row">
                              <div class="col-4">
                                <h5>Items Ordered</h5>
                              </div>
                              <div class="col-8">
                              </div>


                              <div class="col-4">
                                <img class="d-block w-100" src="static/img/panera.jpg"
                                  alt="First slide">
                              </div>
                              <div class="col-6">
                                <h6>Panera Breakfast Platter</h6>
                                <p>20 servings</p>
                                <p><span class="text-black">Quantity: </span> 2 </p>
                                <p><span class="text-black">Customizations: </span> Extra cream cheese </p>
                              </div>
                              <div class="col-2">
                                <p>$50.00 ea </p>
                                <p><span class="text-black">Subtotal: </span> $100.00 </p>
                              </div>

                              <div class="col-4">
                                <img class="d-block w-100" src="static/img/panera.jpg"
                                  alt="First slide">
                              </div>
                              <div class="col-6">
                                <h6>Panera Coffee Tray</h6>
                                <p>20 servings</p>
                                <p><span class="text-black">Quantity: </span> 3 </p>
                                <p><span class="text-black">Customizations: </span> Extra cream cheese </p>
                              </div>
                              <div class="col-2">
                                <p>$30.00 ea </p>
                                <p><span class="text-black">Subtotal: </span> $90.00 </p>
                              </div>



                              <div class="col-4">
                                <img class="d-block w-100" src="static/img/panera.jpg"
                                  alt="First slide">
                              </div>
                              <div class="col-6">
                                <h6>Panera Bakery Tray</h6>
                                <p>20 servings</p>
                                <p><span class="text-black">Quantity: </span> 2 </p>
                                <p><span class="text-black">Customizations: </span> Extra cream cheese </p>
                              </div>
                              <div class="col-2">
                                <p>$40.00 ea </p>
                                <p><span class="text-black">Subtotal: </span> $80.00 </p>
                              </div>

                              <div class="col-10">
                              </div>
                              <div class="col-2">
                                <h6>Total:</h6>
                                <p>$170.00</p>
                              </div>

                            </div>

                           <br>
                          </div>
                          <div class="modal-footer">
                            <div class="row">


                              <div class="col-6">
                                <div class="text-center item-right">
                                  <button class="btn btn-danger">Reject</button>
                                </div>
                              </div>


                              <div class="col-6">
                                <div class="text-center item-right">
                                  <button class="btn btn-success">Approve</button>
                                </div>
                              </div>

                            </div>
                          </div>
                        </div>
                      </div>
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


      <script src="static/js/clockpicker.js"></script>
      <script type="text/javascript" src="static/dist/bootstrap-clockpicker.min.js"></script>
      <!-- Bootstrap core JavaScript -->
      <script src="static/vendor/jquery/jquery.min.js"></script>
      <script src="static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
