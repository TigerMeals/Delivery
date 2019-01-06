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
  {% include 'nav.tpl' %}


  <!-- Page Content -->
  <div id="page-content-wrapper">

    <div class="container-fluid container">
      <main class="page payment-page">
        <section class="payment-form dark">
          <div class="container">
            <div class="block-heading">
              <img class="d-block mx-auto mb-4" src="https://www.princeton.edu/~oktour/virtualtour/korean/Images/Small/Shield.gif" alt="" width="72" height="72">
              <h2 class='text-primary'>Checkout</h2>
              <p>Please review your order below and proceed with payment. We thank you for shopping with TigerMeals Delivery.</p>
            </div>
            <form id="main_form">
              <div class="products">
                <h3 class="title">Review Your Order</h3>
                {% for i in range(0, length_cart) %}
                <div class="item">
                  <span class="price"><span id ="money{{food_ids[i]}}"onload="editPrices()"class="text-muted"></span></span>
                  <p class="item-name">{{food_titles[i]}} x {{food_multiplier[i]}}</p>
                  <p class="item-description">{{food_descriptions[i]}}</p>
                  <p class="item-description">INSERT CUSTOMIZATION HERE ONLY IF IT EXISTS</p>
                </div>
                <script>
                  var val = parseFloat({{food_prices[i]}}).toFixed(2);
                  document.getElementById('money{{food_ids[i]}}').innerHTML = "$" + val
                </script>
                {% endfor %}
                <div class="subtotal">Subtotal<span class="price">$320</span></div>
                <div class="delivery_fee">Delivery Fee<span class="price">$5.00</span></div>
                <div class="total">Total<span class="price">$<span id="CheckoutSumTotal"></span></span></div>
              </div>


              <div class="delivery-details">
                <h3 class="title">Delivery Information</h3>
                <div class="item">
                  <p class="item-name">ADD DAY AND TIME HERE</p>
                </div>
                <div class="item">
                  <p class="item-name">ADD LOCATION HERE</p>
                </div>
                <div class="item">
                  <p class="item-name">ADD DELIVERY INSTRUCTIONS HERE IF THEY EXIST</p>
                </div>
              </div>


              <div class = "card-details" >
                <div class="row mb-2">
                  <h3 class="ml-3 title">Payment</h3>
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
                      <h5 class="mb-3">Card Payment</h5>
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
                     <form id="checkout_form" action="/ordered" method="POST" class="needs-validation mx-3 my-2" novalidate>
                      <br>
                      <h5 class="mb-3">Cash Payment</h5>

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

                        <hr class="mb-4">
                          <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="save-info">
                            <label class="custom-control-label" for="save-info">Save this information for next time</label>
                          </div>

                      </div>
                      <p><button class="btn btn-primary btn-lg btn-block" type="submit" id = "checkout_button" form="checkout_form">Place your order</button></p>
                      <br>
                      <br>
                    </form>
                    </div>
               </div>
              </div>
              </div>
            </form>
          </div>
        </section>
      </main>

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
    {% include 'handle_toggle.tpl' %}
    <script>
    function getMinDate() {
      var today = new Date();
      today.setDate(today.getDate() + 2);
      var dd = today.getDate();
      var mm = today.getMonth()+1;
      var yyyy = today.getFullYear();
      if (dd < 10) {
        dd = '0' + dd
      }
      if (mm < 10) {
        mm = '0' + mm
      }
      date = yyyy + '-' + mm + '-' + dd;
      return date;
    }
    // document.getElementById("date-cash").setAttribute("min", getMinDate());
    // document.getElementById("date-stripe").setAttribute("min", getMinDate());
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
