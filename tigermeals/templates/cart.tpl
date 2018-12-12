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
            <li class="nav-item-bar">
              <a class="nav-link" href="/meals">Meals</a>
            </li>
            <li class="nav-item-bar">
              <a class="nav-link" href="/account">My Account</a>
            </li>
            <li class="nav-item-bar active justify-content-end dropdown">
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

<br>
		<!-- Page Content -->
		<div class="container">

			<table id="cart" class="table table-hover table-condensed">
		    				<thead>
									<tr>
									<th style="padding-top:1rem; padding-bottom:0rem; border-top:0rem;border-bottom:0rem;"> <h2> View Cart </h2> </th>
								</tr>
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

                    <select id="quantity{{food_ids[i]}}" class="form-control" name="cc_exp_mo" size="0">
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

                      for(var i, j = 0; i = mySelect.options[j]; j++) {
                          if(i.value == food_quantity) {
                              mySelect.selectedIndex = j;
                              break;
                          }
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
										<button class="btn btn-info btn-sm"><i class="fa fa-sync-alt"></i></button>
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
								<tr>
									<td><a href="/meals" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
									<td colspan="2" class="hidden-xs"></td>
									<td class="hidden-xs text-center"></td>
									<td><a href="/checkout" class="btn btn-success btn-block">Checkout <i class="fa fa-angle-right"></i></a></td>
								</tr>
							</tfoot>
						</table>
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

  </body>

</html>
