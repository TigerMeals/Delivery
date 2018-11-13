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
				<a class="navbar-brand" href="#">TigerMeals Delivery</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse justify-content-end" id="navbarResponsive">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item-bar">
							<a class="nav-link" href="http://localhost:8080/home">Home</a>
						</li>
						<li class="nav-item-bar">
							<a class="nav-link" href="http://localhost:8080/about">About</a>
						</li>
						<li class="nav-item-bar">
							<a class="nav-link" href="http://localhost:8080/meals">Meals</a>
						</li>
						<li class="nav-item-bar">
							<a class="nav-link" href="http://localhost:8080/account">My Account</a>
						</li>
						<li class="nav-item-bar justify-content-end dropdown active">
					<a class="nav-link justify-content-end" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> View Cart (4) <i class="fa fa-caret-down"></i></a>
						<span class="sr-only">(current)</span>
					<ul class="dropdown-menu dropdown-menu-left dropdown-cart" role="menu">
							<li>
									<span class="item">
										<span class="item-left">
												<img src="http://www.prepbootstrap.com/Content/images/template/menucartdropdown/item_1.jpg" alt="" />
												<span class="item-info">
														<span>Item name</span>
														<span>price: $27.00</span>
												</span>
										</span>
										<span class="item-right">
												<button class="btn-sm btn-danger btn-cart fa fa-times"></button>
										</span>
								</span>
							</li>
							<li>
									<span class="item">
										<span class="item-left">
												<img src="http://www.prepbootstrap.com/Content/images/template/menucartdropdown/item_2.jpg" alt="" />
												<span class="item-info">
														<span>Item name</span>
														<span>price: $3.00</span>
												</span>
										</span>
										<span class="item-right">
												<button class="btn-sm btn-danger btn-cart fa fa-times"></button>
										</span>
								</span>
							</li>
							<li>
									<span class="item">
										<span class="item-left">
												<img src="http://www.prepbootstrap.com/Content/images/template/menucartdropdown/item_3.jpeg" alt="" />
												<span class="item-info">
														<span>Item name</span>
														<span>price: $12.00</span>
												</span>
										</span>
										<span class="item-right">
												<button class="btn-sm btn-danger btn-cart fa fa-times"></button>
										</span>
								</span>
							</li>
							<li>
									<span class="item">
										<span class="item-left">
												<img src="http://www.prepbootstrap.com/Content/images/template/menucartdropdown/item_4.jpg" alt="" />
												<span class="item-info">
														<span>Item name</span>
														<span>price: $7.00</span>
												</span>
										</span>
										<span class="item-right">
												<button class="btn-sm btn-danger btn-cart fa fa-times"></button>
										</span>
								</span>
							</li>
							<li class="divider"></li>
							<li>
								<span class="checkout-text item-right">Subtotal: $49.00</span><br>
                <a class="checkout-text item-left" href="http://localhost:8080/cart">View Cart</a>
                <a class="checkout-text item-right" href="http://localhost:8080/checkout">Checkout</a>
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
									<th style="width:62%; color:black;">Product</th>
									<th style="width:10%; color:black;">Price</th>
									<th style="width:8%; color:black;">Quantity</th>
									<th style="width:14%; color:black;" class="text-center">Subtotal</th>
									<th style="width:6%"></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td data-th="Product">
										<div class="row">
											<div class="col-sm-5 hidden-xs"><img src="static/img/panera.jpg" alt="..." class="img-cart"/></div>
											<div class="col-sm-7">
												<h4 class="nomargin">Panera Breakfast Bagels</h4>
												<p>Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet.</p>
											</div>
										</div>
									</td>
									<td data-th="Price">$1.99</td>
									<td data-th="Quantity">
                    <select class="form-control" name="cc_exp_mo" size="0">
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
									</td>
									<td data-th="Subtotal" class="text-center">1.99</td>
									<td class="actions" data-th="">
										<button class="btn btn-info btn-sm"><i class="fa fa-sync-alt"></i></button>
										<button class="btn btn-danger btn-sm"><i class="fa fa-trash-alt"></i></button>
									</td>
								</tr>
								<tr>
									<td data-th="Product">
										<div class="row">
											<div class="col-sm-5 hidden-xs"><img src="static/img/kft.jpg" alt="..." class="img-cart"/></div>
											<div class="col-sm-7">
												<h4 class="nomargin">Bubble Tea for 15</h4>
												<p>Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet.</p>
											</div>
										</div>
									</td>
									<td data-th="Price">$1.99</td>
									<td data-th="Quantity">
                    <select class="form-control" name="cc_exp_mo" size="0">
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
									</td>
									<td data-th="Subtotal" class="text-center">1.99</td>
									<td class="actions" data-th="">
										<button class="btn btn-info btn-sm"><i class="fa fa-sync-alt"></i></button>
										<button class="btn btn-danger btn-sm"><i class="fa fa-trash-alt"></i></button>
									</td>
								</tr>
								<tr>
									<td data-th="Product">
										<div class="row">
											<div class="col-sm-5 hidden-xs"><img src="static/img/tacoria.jpg" alt="..." class="img-cart"/></div>
											<div class="col-sm-7">
												<h4 class="nomargin">Taco Party Platter for 20</h4>
												<p>Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet.</p>
											</div>
										</div>
									</td>
									<td data-th="Price">$1.99</td>
									<td data-th="Quantity">
                    <select class="form-control" name="cc_exp_mo" size="0">
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
									</td>
									<td data-th="Subtotal" class="text-center">1.99</td>
									<td class="actions" data-th="">
										<button class="btn btn-info btn-sm"><i class="fa fa-sync-alt"></i></button>
										<button class="btn btn-danger btn-sm"><i class="fa fa-trash-alt"></i></button>
									</td>
								</tr>
							</tbody>
							<tfoot>
								<tr class="visible-xs">
									<td colspan="3" class="hidden-xs"></td>
									<td class="hidden-xs text-center"><strong>Total $1.99</strong></td>
								</tr>
								<tr>
									<td><a href="http://localhost:8080/meals" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
									<td colspan="2" class="hidden-xs"></td>
									<td class="hidden-xs text-center"></td>
									<td><a href="http://localhost:8080/checkout" class="btn btn-success btn-block">Checkout <i class="fa fa-angle-right"></i></a></td>
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