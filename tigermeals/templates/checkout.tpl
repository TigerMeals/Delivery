<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>TigerMeals Delivery - Checkout</title>

    <!-- Bootstrap core CSS -->
    <link href="static/css/bootstrap-lux.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="static/css/shop-homepage.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    <!-- use the nordstrom style - have dropdown filters per restaurant/allergies/cuisine type/number of Servings
    wich checkboxes
    and have an upper display show which filters are applied

    then have a sort by dropdown bar in the upper right
    -->

  </head>


  <body>

    <!-- Navigation -->
    <!-- Navigation -->
    <nav class="navbar red-bar navbar-expand-lg navbar-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="/">TigerMeals Delivery</a>
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
            <li class="nav-item-bar active">
            <div class="dropdown">
              <a class="nav-link btn-danger dropdown-toggle" href="/meals" role="button" id="dropdownMenuLink" data-toggle="dropdown"  aria-expanded="false">
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
                          <form method="post"action="/cart/delete/{{food_ids[i]}}">
                            <button class="btn-sm btn-danger btn-cart fa fa-times"></button>
                          </form>
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

    <div class="container">
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
              <span class="text-muted">${{food_prices[i]}}</span>
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
              <strong>${{total}}</strong>
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
        <div class="col-md-8 order-md-1" id = "payment_info">

            <h4 class="mb-3">Payment</h4>

            <div class="d-block my-3">

              <script>
                function show_form(paymentMethod){
                  document.getElementsByClassName('payment_form').style.display ='none'; //Hide forms
                  document.getElementById(paymentMethod).style.display='block'; //Show desired form
                  return true;
                }
              </script>
              <form>

                  <select id="selectC">
                      <option onclick="javascript:show_form('cash')">Credit Card</option>
                      <option onclick="javascript:show_form('debit')">Debit Card </option>
                      <option onclick="javascript:show_form('cash')">Cash</option>
                  </select>

                  <div class="payment_form" id="cash">
                      Form for Cash
                  </div>
                  <div class="payment_form" id="credit">
                      Form for Credit
                  </div>
                  <div class="payment_form" id="debit">
                      Form for Debit.
                  </div>

              </form>

              <form id="paymentForm">
                <div class="custom-control custom-radio">
                  <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" onclick="javascript:yesCash();" checked required>
                  <label class="custom-control-label" for="credit">Credit card</label>
                </div>
                <div class="custom-control custom-radio">
                  <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" onclick="javascript:yesCash();" required>
                  <label class="custom-control-label" for="debit">Debit card</label>
                </div>
                <div class="custom-control custom-radio">
                  <input id="cash" name="paymentMethod" type="radio" class="custom-control-input" onclick="javascript:yesCash();" required>
                  <label class="custom-control-label" for="cash">Cash</label>
                </div>
                  <script>
                    function yesCash() {
                      var cashPayment = false;
                      var paymentButtonVisible = false;
                      if (document.getElementById('cash').checked) {
                        cashPayment = true;
                        // document.getElementById('billing_info').style.visibility ='visible';
                        // document.getElementById('checkout_button').style.visibility ='visible';
                      }
                      // else {
                      //   document.getElementById('billing_info').style.visibility ='hidden';
                      //   document.getElementById('checkout_button').style.visibility ='hidden';
                      //
                      // }
                      if (document.getElementById('credit').checked || document.getElementById('debit').checked){
                        paymentButtonVisible = true;
                        // document.getElementById('payment_button').style.visibility = 'visible';
                      }
                      // else{
                      //   document.getElementById('payment_button').style.visibility = 'hidden';
                      // }
                    }
                  </script>
                </form>
                <script>

                </script>

        </div>

      {% if paymentButtonVisible %}
      <div class="col-md-8 order-md-1" id="payment_button">
            <form action="/charge" id="stripe_payment_button" method="post" class="needs-validation" novalidate>

                <article>
                  <label>
                    <span>Total is ${{total}}</span>
                  </label>
                </article>

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
              {% if error != '' %}
              <p>{{error}}</p>
              {% endif %}
               <script src="https://checkout.stripe.com/checkout.js" class="stripe-button btn-info"
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
        </div>
        {% endif %}

        <br>
        <br>
        <br>
        {% if cashPayment %}
        <div class="col-md-8 order-md-1" id="billing_info">

          <form id="checkout_form" action="/ordered?id={{user_id}}" method="POST" class="needs-validation" novalidate>
            <h4 class="mb-3">Cash Payment: Please complete this form</h4>
            <h5 class="mb-3">Shipping Address</h5>
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
              <label for="address">Address</label>
              <input type="text" class="form-control" id="address" name="address" placeholder="" value="{{address}}" required>
              <div class="invalid-feedback">
                Please enter your shipping address.
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
            <hr class="mb-4">

            </div>
          </form>
        </div>
          <hr class="mb-4">
          <p><button class="btn btn-primary btn-lg btn-block" type="submit" id = "checkout_button" form="checkout_form">Continue to checkout</button></p>
        {% endif %}

        </div>
      </div>
    </div>

    <!-- Footer -->

    <footer class="py-4 red-bar">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; TigerMeals Delivery 2018</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="static/vendor/jquery/jquery.min.js"></script>
    <script src="static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
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
