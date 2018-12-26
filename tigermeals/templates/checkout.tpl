<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>TigerMeals Delivery - Checkout</title>
    <link rel='icon' href='/static/img/takeout.ico'></link>

    <!-- Bootstrap core CSS -->
    <link href="static/css/bootstrap-lux.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="static/css/shop-homepage.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

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

    <div id="wrapper" >

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

    <div class="container-fluid container">
      <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="https://www.princeton.edu/~oktour/virtualtour/korean/Images/Small/Shield.gif" alt="" width="72" height="72">
        <h2>Checkout form</h2>
        <p class="lead">Please complete your order below. We thank you for shopping with TigerMeals Delivery.</p>
      </div>

      <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
          <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span class="text-muted">Your cart</span>
            <span class="badge badge-secondary badge-pill">{{length_cart}}</span>
          </h4>
          <ul class="list-group mb-3">
            {% for i in range(0, length_cart) %}
            <li class="list-group-item d-flex justify-content-between lh-condensed">
            <table>
            <tr>
              <div>
                <td>
                <h6 class="mx-0">{{food_titles[i]}}</h6>
              </td>
              <td>
                <span class="text-muted">x{{food_multiplier[i]}}</span>

              </td>
              </div>
            </tr>
            <tr>
              <td>
              <small class="text-muted">{{food_descriptions[i]}}</small>
            </td>
            <td>
              <span id ="money{{food_ids[i]}}"onload="editPrices()"class="text-muted"></span>
              <script>
                var val = parseFloat({{food_prices[i]}}).toFixed(2);
                document.getElementById('money{{food_ids[i]}}').innerHTML = "$" + val
                  // document.getElementById('SumTotal').innerHTML = "Total: $" + val;
              </script>
            </td>
            </tr>
            </table>
            </li>
            {% endfor %}

            <li class="list-group-item d-flex justify-content-between bg-light">
              <div class="text-success">
                <h6 class="my-0">Promo code</h6>
                <small>EXAMPLECODE</small>
              </div>
              <span class="text-success">-$0</span>
            </li>
            <li class="list-group-item d-flex justify-content-between">
              <span>Total (USD)</span>
              <strong>$<span id="CheckoutSumTotal"></span></strong>
            </li>
          </ul>

          <form class="card p-2">
            <div class="input-group">
              <input type="text" class="form-control" placeholder="Promo code">
              <div class="input-group-append">
                <button class="btn btn-secondary">Redeem</button>
              </div>
            </div>
          </form>
        </div>

        <div class = "col-md-8 order-md-1" >
              <div class="row mb-2">
                <h1 class="ml-3">Payment</h1>
              </div>
              <ul class="nav nav-tabs" id="myTab" role="tablist">
                  <li class="nav-item">
                      <a class="nav-link active" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Pay with Credit or Debit Card</a>
                  </li>

                  <li class="nav-item">
                      <a class="nav-link" id="pending-orders-tab" data-toggle="tab" href="#pending-orders" role="tab" aria-controls="pending-orders" aria-selected="true"> Pay with Cash</a>
                  </li>

              </ul>


            <div class="tab-content profile-tab" id="myTabContent">



            <div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-tab">
              <form action="/charge" id = "stripe_payment_button" method="post" class="needs-validation" novalidate>
                <br>
                <h4 class="mb-3">Card Payment</h4>

                <p class="mb-3"><strong class="text-danger">Note that the Shipping Address that Stripe requests is the Delivery Address!</strong></p>

                <div class="col-md-6 mb-3">
                <label for="date">Delivery Date</label>
                <input type="date" class="form-control" id="dateCard" name="dateCard" required>
                <div class="invalid-feedback">
                  Please enter a valid date.
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="time">Delivery Time</label>
                <input type="time" class="form-control" id="timeCard" name="timeCard" value="12:00" required>
                <div class="invalid-feedback">
                  Please enter a valid time.
                </div>
              </div>
              <p class="text-danger">{{error}}</p>
              <article>
                  <label>
                    <span id="SumTotal">Total is ${{total}}.</span>
                  </label>
                </article>
                <script>
                  var val = parseFloat({{total}}).toFixed(2);
                  document.getElementById('SumTotal').innerHTML = "Total: $" + val;
                  document.getElementById('CheckoutSumTotal').innerHTML =  val;
                </script>

               <script src="https://checkout.stripe.com/checkout.js" class="stripe-button"
                        data-key={{key}}
                        data-amount=String({{total}} * 100)
                        data-description="Catering Payment"
                        data-image="https://stripe.com/img/documentation/checkout/marketplace.png"
                        data-shipping-address = "true"
                        data-zip-code="true"
                        data-name="TigerMeals Checkout"
                        data-locale="auto">
                </script>
              </form>
            <br>
            <br>
            <br>
          </div>

          <div class="tab-pane fade show" id="pending-orders" role="tabpanel" aria-labelledby="pending-orders-tab">
           <form id="checkout_form" action="/ordered" method="POST" class="needs-validation" novalidate>
            <br>
            <h4 class="mb-3">Cash Payment</h4>

            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="firstName">First Name</label>
                <input type="text" class="form-control" id="firstName" name="firstName" placeholder="" value="{{name[0]}}" required>
                <div class="invalid-feedback">
                  Valid first name is required.
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="lastName">Last Name</label>
                <input type="text" class="form-control" name="lastName" id="lastName" placeholder="" value="{{name[1]}}" required>
                <div class="invalid-feedback">
                  Valid last name is required.
                </div>
              </div>
            </div>

            <div class="mb-3">
              <label for="username">Net ID</label>
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">@</span>
                </div>
                <input type="text" class="form-control" id="username" name="username" placeholder="" value = "{{netid}}" required>
                <div class="invalid-feedback" style="width: 100%;">
                  Your username is required.
                </div>
              </div>
            </div>

            <div class="mb-3">
              <label for="email">Email<span class="text-muted">(Optional)</span></label>
              <input type="email" class="form-control" id="email" name="email" placeholder="" value = "{{email}}">
              <div class="invalid-feedback">
                Please enter a valid email address for shipping updates.
              </div>
            </div>

            <div class="mb-3">
              <label for="address">Delivery Address</label>
              <input type="text" class="form-control" id="address" name="address" placeholder="" value="{{address}}" required>
              <div class="invalid-feedback">
                Please enter your delivery address.
              </div>
            </div>

            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="date">Delivery Date</label>
                <input type="date" class="form-control" id="date" name="date" required>
                <div class="invalid-feedback">
                  Please enter a valid date.
                </div>
              </div>

              <div class="col-md-6 mb-3">
                <label for="time">Delivery Time</label>
                <input type="time" class="form-control" id="time" name="time" value="12:00" required>
                <div class="invalid-feedback">
                  Please enter a valid time.
                </div>
              </div>
              <hr class="mb-4">
                <div class="custom-control custom-checkbox">
                  <input type="checkbox" class="custom-control-input" id="save-info">
                  <label class="custom-control-label" for="save-info">Save this information for next time</label>
                </div>

            </div>
          </form>
          <br>
          <p><button class="btn btn-primary btn-lg btn-block" type="submit" id = "checkout_button" form="checkout_form">Continue to checkout</button></p>
          <br>
          <br>
          </div>

             <!--/tab-content-->

         </div><!--/tab-pane-->


        </div><!--/row-->
      </div>

      </div>
      <!--container-->

      <!-- Footer -->
      <footer class="py-4 red-bar">
        <div class="container">
          <p class="m-0 text-center text-white">Copyright &copy; TigerMeals Delivery 2018</p>
        </div>
        <!-- /.container -->
      </footer>
    </div>
    <!--- page-content-wrapper -->


    </div>
    <!--- wrapper -->
      </div>
    </div>


    <!-- Bootstrap core JavaScript -->
    <script src="static/vendor/jquery/jquery.min.js"></script>
    <script src="static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
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
