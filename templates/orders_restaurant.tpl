<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>TigerMeals Delivery - My Orders</title>
    <link rel='icon' href='/static/img/takeout.ico'></link>

    <!-- Bootstrap core CSS -->
    <link href="/static/css/bootstrap-lux.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/static/css/shop-homepage.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    <script type="text/javascript" src="/static/js/jquery-1.10.2.min.js"></script>

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
            <li class="nav-item-bar">
              <a class="nav-link" href="/about">About</a>
            </li>
            <li class="nav-item-bar">
              <a class="nav-link" href="/listings">My Meals</a>
            </li>
            <li class="nav-item-bar">
              <a class="nav-link" href="/account">My Account</a>
            </li>
            <li class="nav-item-bar active">
              <a class="nav-link" href="/orders">View Orders ({{length_orders}} Active)</a>
              <span class="sr-only">(current)</span>
            </li>
          </ul>
        </div>
      </div>
    </nav>


    <br>
    <!-- Page Content -->
    <div class="container">

      <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="https://www.princeton.edu/~oktour/virtualtour/korean/Images/Small/Shield.gif" alt="" width="72" height="72">
        <h2>My orders</h2>
        <p class="lead">Please view your orders below. We thank you for partnering with TigerMeals Delivery.</p>
      </div>

      <table id="pendingorders" class="table table-hover table-condensed">
  				<thead>
  					<tr style="color:black;">
                <h2>Pending Orders</h2>
  					</tr>
  				</thead>
					<tbody>
            {% for o in pending %}
              {% with order=o %}
                {% include 'display_order.tpl' %}
              {% endwith %}
            {% endfor %}
  					</tbody>
  					<tfoot>
  					</tfoot>
  				</table>
          {% for o in pending %}
            {% with order=o %}
              {% include 'order_modals.tpl' %}
            {% endwith %}
          {% endfor %}

          <table id="activeorders" class="table table-hover table-condensed">
              <thead>
                <tr style="color:black;">
                    <h2>Order To Be Delivered</h2>
                </tr>
              </thead>
              <tbody>
                {% for o in active %}
                  {% with order=o %}
                    {% include 'display_order.tpl' %}
                  {% endwith %}
                {% endfor %}
                </tbody>
                <tfoot>
                </tfoot>
              </table>
              {% for o in active %}
                {% with order=o %}
                  {% include 'order_modals.tpl' %}
                {% endwith %}
              {% endfor %}
		  </div>

    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-4 red-bar">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; TigerMeals Delivery 2018</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="/static/vendor/jquery/jquery.min.js"></script>
    <script src="/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
