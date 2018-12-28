
    <!-- Navigation -->
    <nav class="navbar navbar-expand-md navbar-dark bg-danger fixed-top">
      <a class="navbar-brand" href="/home">TigerMeals Delivery</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="nav navbar-nav ml-auto">
          <li class="nav-item-bar" id="nav-home">
            <a class="nav-link" href="/home">Home</a>
          <li class="nav-item-bar" id="nav-about">
            <a class="nav-link" href="/about">About</a>
          </li>
          <li class="nav-item-bar" id="nav-meals">
            <div class="dropdown" id="nav-meals-dropdown">
              <a class="nav-link btn-danger dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown"  aria-expanded="false">
                Meals
              </a>
              <div class="dropdown-menu dropdown-content" aria-labelledby="dropdownMenuLink">
                <a class="dropdown-item" href="/meals">View all Meals</a>
                <a class="dropdown-item" href="/meals/restaurant">View by Restaurant</a>
              </div>
            </div>
          </li>
          <li class="nav-item-bar" id="nav-account">
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