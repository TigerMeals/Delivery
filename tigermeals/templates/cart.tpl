<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>TigerMeals Delivery - View Cart</title>
    <link rel='icon' href='static/img/takeout.ico'></link>

    <!-- Bootstrap core CSS -->
    <link href="static/css/bootstrap-lux.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="static/css/shop-homepage.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>

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
      <div class="container-fluid container">
        <div class="row">
          <div class="col-12">
            <h2 class="pt-2">Review Cart</h2>
          </div>
        </div>
  			<table id="cart" class="table table-hover table-condensed">
  				<thead>
    				<tr>
    					<th style="width:50%; color:black;">Product</th>
    					<th style="width:10%; color:black;">Price</th>
    					<th style="width:8%; color:black;">Quantity</th>

    					<th style="width:10%; color:black;" class="text-center">Subtotal</th>
    					<th style="width:16%; color:black;">Serving Size</th>
    					<th style="width:6%"></th>
    				</tr>
  			</thead>
  			<tbody>
  				{% for i in range(0, length_cart) %}
  				<tr>
  					<td data-th="Product">
  						<div class="row">
  							<div class="col-sm-5 hidden-xs"><img src="{{food_images[i]}}" alt="..." class="img-cart"/></div>
  							<div class="col-sm-7">
  								<h4 class="px-4">{{food_titles[i]}}</h4>
  								<p class="px-4">{{food_descriptions[i]}}</p>
  							</div>
  						</div>
  					</td>
  					<td data-th="Price">$<span id = "cart_table_price{{i}}"></span></td>
            <!-- Below needed so that price displays with 2 decimal points. -->
            <script>
              var val = parseFloat({{food_prices[i]}}).toFixed(2);
              document.getElementById('cart_table_price{{i}}').innerHTML = val;
            </script>
  					<td data-th="Quantity">

              <select id="quantity{{food_ids[i]}}" class="form-control" name="cc_exp_mo" size="0" onchange="handleEdit(this.value, {{food_ids[i]}})">
                  <option value="01">1</option>
                  <option value="02">2</option>
                  <option value="03">3</option>
                  <option value="04">4</option>
                  <option value="05">5</option>
                  <option value="06">6</option>
                  <option value="07">7</option>
                  <option value="08">8</option>
                  <option value="09">9</option>
                  <option value="10">10</option>
              </select>
              <script>
                var food_quantity = {{food_multiplier[i]}};
                var mySelect = document.getElementById('quantity{{food_ids[i]}}');

                for(var k, j = 0; k = mySelect.options[j]; j++) {
                    if(k.value == food_quantity) {
                        mySelect.selectedIndex = j;
                        break;
                    }
                }
                function handleEdit(value, food_id) {
                  console.log(value)
                  console.log({{food_id}})
                  window.location.href = "/cart/edit-quantity/" + value + "/" + food_id;
                }
              </script>
  					</td>
  					<td data-th="Subtotal" class="text-center">$<span id = "cart_table_subtotal{{i}}"></span></td>

            <!-- Below needed so that price displays with 2 decimal points. -->
            <script>
              var val = parseFloat({{food_subtotals[i]}}).toFixed(2);
              document.getElementById('cart_table_subtotal{{i}}').innerHTML = val;
            </script>
  					<td data-th="Serving Size" class= "text-center">
  					{{food_quantity_feds[i]}}</td>
  					<td class="actions" data-th="">
  					<form method="post"action="/cart/delete/{{food_ids[i]}}">
  						<button type="submit"id="delete{{food_ids[i]}}"class="btn btn-danger btn-sm"><i class="fa fa-trash-alt"></i></button>
  					</form>
  					</td>
  				</tr>
  				{% endfor %}
  			</tbody>


  			<tfoot>
  				<tr class="visible-xs">
  					<td colspan="3" class="hidden-xs"></td>
  					<td class="hidden-xs text-center"><strong>$<span id = "total_table"></span></strong></td>

            <!-- Below needed so that price displays with 2 decimal points. -->
            <script>
              var val = parseFloat({{total}}).toFixed(2);
              document.getElementById('total_table').innerHTML = val;
            </script>
  				</tr>
  				<!-- <tr>
  					<td><a href="/meals" class="btn btn-outline-primary"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
  					<td colspan="2" class="hidden-xs"></td>
  					<td class="hidden-xs text-center"></td>
  					<td><a href="/checkout" class="btn btn-success btn-block">Checkout <i class="fa fa-angle-right"></i></a></td>
  				</tr> -->
  			</tfoot>
  		</table>
		</div>

    <div class="container-fluid container">
      <div class="row">
        <div class="col-12">
          <h2>Delivery Information</h2>
        </div>

        <div class="col-lg-6 col-md-6 mb-3">
          <label for="date">Delivery Date</label>
          <input type="date" class="form-control" id="dateCard" name="dateCard" required>
          <div class="invalid-feedback">
            Please enter a valid date.
          </div>
        </div>
        <div class="col-lg-6 col-md-6 mb-3">
          <label for="time">Delivery Time</label>
          <input type="time" class="form-control" id="timeCard" name="timeCard" value="12:00" required>
          <div class="invalid-feedback">
            Please enter a valid time.
          </div>
        </div>
        <div class="col-lg-6 col-md-6 mb-3">
          <label for="date">Delivery Location</label>
          <input type="text" class="form-control" id="locationCard" name="locationCard" required>
          <div class="invalid-feedback">
            Please enter a valid location.
          </div>
        </div>
        <div class="col-lg-12 col-md-6 mb-3">
          <label for="date">Delivery Instructions</label>
          <input type="text" class="form-control" id="instructionsCard" name="instructionsCard" required>
        </div>
      </div>
    </div>

    <div class="container-fluid container mb-5">
      <div class="row">
        <div class="col-6 justify-content-left">
          <a href="/meals" class="btn btn-outline-primary"><i class="fa fa-angle-left"></i> Continue Shopping</a>
        </div>
        <div class="col-6 justify-content-right text-right">
          <a href="/checkout" class="text-right btn btn-success">Checkout <i class="fa fa-angle-right"></i></a>
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

  </div><!-- /#page-content-wrapper -->

</div> <!-- #wrapper -->

    <!-- Bootstrap core JavaScript -->
    <script src="static/vendor/jquery/jquery.min.js"></script>
    <script src="static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    {% include 'handle_toggle.tpl' %}

  </body>

</html>
