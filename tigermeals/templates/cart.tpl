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

    {% include 'nav.tpl' %}
    <script>
      document.getElementById('nav-cart').classList.add('active');
    </script>

    <!-- Page Content -->
    <div id="page-content-wrapper">
      <div class="row">
          <div class="col-12 text-center">
            <h2 >Review Cart</h2>
          </div>
        </div>
      <div class="container-fluid container table-responsive-lg">

  			<table id="cart" class="table table-hover table-condensed text-center">
  				<thead>
    				<tr>
    					<th style="width:50%; color:black;">Product</th>
    					<th style="width:10%; color:black;">Price</th>
    					<th style="width:8%; color:black;">Quantity</th>

    					<th style="width:10%; color:black;">Subtotal</th>
    					<th style="width:16%; color:black;">Serving Size</th>
    					<th style="width:6%"></th>
    				</tr>
  			</thead>
  			<tbody>
  				{% for i in range(0, length_cart) %}
  				<tr>
  					<td data-th="Product">
  						<div class="row">
  							<div class="col-sm-5"><img src="{{food_images[i]}}" alt="..." class="img-fluid"/></div>
  							<div class="col-sm-7">
  								<h4 class="px-4">{{food_titles[i]}}</h4>
  								<p class="px-4">{{food_descriptions[i]}}</p>
                  {% if customizations[i] != 'N/A' %}
                  <p>Customizations:<span class="px-2 text-muted">{{customizations[i]}}</span></p>
                  {% endif %}
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

              <select id="quantity{{food_ids[i]}}" name="cc_exp_mo" size="0" onchange="handleEdit(this.value, {{food_ids[i]}})">
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
  			</tfoot>
  		</table>
		</div>

<form id="deliveryInfo" action="/checkout" method="post" class="form mt-3">
    <div class="container-fluid container">
      <div class="row">
        <div class="col-12">
          <h2>Delivery Information</h2>
        </div>

        <div class="col-lg-6 col-md-6 mb-3">
          <label for="date" class="text-primary">Delivery Date</label>
          <input type="date" class="form-control" id="dateCard" name="dateCard" required>
          <div class="invalid-feedback">
            Please enter a valid date.
          </div>
        </div>
        <div class="col-lg-6 col-md-6 mb-3">
          <label for="time" class="text-primary">Delivery Time</label>
          <input type="time" class="form-control" id="timeCard" name="timeCard" value="12:00" required>
          <div class="invalid-feedback">
            Please enter a valid time.
          </div>
        </div>
        <div class="col-lg-6 col-md-6 mb-3">
          <label for="text" class="text-primary">Delivery Location</label>
          <input type="text" value="{{location}}" class="form-control" id="locationCard" name="locationCard" required >
          <div class="invalid-feedback">
            Please enter a valid location.
          </div>
        </div>
        <div class="col-lg-12 col-md-6 mb-3">
          <p>
            <a data-toggle="collapse" href="#collapseExample"aria-expanded="false" aria-controls="collapseExample">
              Add delivery instructions <i class="fas fa-sm fa-plus text-primary sr-icon-1"></i>
            </a>
          </p>
          <div class="collapse" id="collapseExample">
              <input type="text" class="form-control form-control-lg" id="instructionsCard" name="instructionsCard" rows="3">
          </div>
        </div>
      </div>
    </div>

    <div class="container-fluid container d-none d-md-block mb-5 mt-4">
      <div class="row">
        <div class="col-md-6 col-xs-12 px-2 py-2 justify-content-left">
          <a href="/meals" class="btn btn-outline-primary"><i class="fa fa-angle-left"></i> Continue Shopping</a>
        </div>
        <div class="col-md-6 col-xs-12 px-2 py-2 justify-content-right text-right">
          <button type="submit" class="text-right btn btn-success">Go to payment <i class="fa fa-angle-right"></i></button>
        </div>
      </div>
    </div>

    <div class="container-fluid container mb-5 mt-4 d-xs-block d-md-none">
      <div class="row">
        <div class="col-md-6 col-xs-12 px-2 py-2">
          <a href="/meals" class="btn btn-outline-primary"><i class="fa fa-angle-left"></i> Continue Shopping</a>
        </div>
        <div class="col-md-6 col-xs-12 px-2 py-2">
          <button type="submit" class="text-right btn btn-success">Go to payment <i class="fa fa-angle-right"></i></button>
        </div>
      </div>
    </div>
  </form>

    <!-- Footer -->
    <footer class="py-4 red-bar">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; TigerMeals Delivery 2019</p>
      </div>
      <!-- /.container -->
    </footer>

  </div><!-- /#page-content-wrapper -->

</div> <!-- #wrapper -->

    <!-- Bootstrap core JavaScript -->
    <script src="static/vendor/jquery/jquery.min.js"></script>
    <script src="static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

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
    document.getElementById("dateCard").setAttribute("min", getMinDate());
    </script>

  </body>

</html>
