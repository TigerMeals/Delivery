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
    <link href="/static/css/restaurant.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    <script type="text/javascript" src="/static/js/jquery-1.10.2.min.js"></script>

  </head>

  <body>

    {% include 'nav_restaurant.tpl' %}

    <script>
      document.getElementById('nav-orders').classList.add('active');
    </script>

    <div class="restaurant-container">
      <!-- Page Content -->
      <div class="container">

        <div class="py-5 text-center">
          <img class="d-block mx-auto mb-4" src="https://www.princeton.edu/~oktour/virtualtour/korean/Images/Small/Shield.gif" alt="" width="72" height="72">
          <h2>My orders</h2>
          <p class="lead">Please view your orders below. We thank you for partnering with TigerMeals Delivery.</p>
        </div>

        <ul class="nav nav-tabs">
          <li class="active nav-item"><a data-toggle="tab" href="#pending">Pending</a></li>
          <li class="nav-item"><a data-toggle="tab" href="#active">Active</a></li>
          <li class="nav-item"><a data-toggle="tab" href="#delivered" >Delivered</a></li>
          <li class="nav-item"><a data-toggle="tab" href="#denied" >Denied</a></li>
        </ul>
        <div class="tab-content">
          <div id="pending" class="tab-pane fade show active">
            <br>
            <table id="pendingorders" class="table table-hover table-condensed">
              <thead>
                <tr style="color:black;">
                    <h2 class="mb-1">Orders Pending Approval</h2>
                    <h4><small>Please approve or deny these orders as soon as possible!</small></h4>
                </tr>
              </thead>
      					<tbody>
                  {% for o in pending %}
                    {% with order=o %}
                      {% include 'display_order.tpl' %}
                    {% endwith %}
                  {% endfor %}

                  {% if not pending[0] %}
                  <tr>
                    <td>
                      <p class="text-primary float-left">You do not have any pending orders at this time. </p>
                    </td>
                  </tr>
                  {% endif %}
        					</tbody>
        					<tfoot>
        					</tfoot>
        				</table>
                {% for o in pending %}
                  {% with order=o %}
                    {% include 'order_modals.tpl' %}
                  {% endwith %}
                {% endfor %}
          </div>
          <div id="active" class="tab-pane fade">
            <br>
            <table id="activeorders" class="table table-hover table-condensed">
                <thead>
                  <tr style="color:black;">
                      <h2>Orders To Be Delivered</h2>
                  </tr>
                </thead>
                <tbody>
                  {% for o in active %}
                    {% with order=o %}
                      {% include 'display_order.tpl' %}
                    {% endwith %}
                  {% endfor %}

                  {% if not active[0] %}
                  <tr>
                    <td>
                      <p class="text-primary float-left">You do not have any active orders at this time. </p>
                    </td>
                  </tr>
                  {% endif %}
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
            <div id="delivered" class="tab-pane fade">
              <br>
              <table id="deliveredorders" class="table table-hover table-condensed">
                  <thead>
                    <tr style="color:black;">
                        <h2>Delivered Orders</h2>
                    </tr>
                  </thead>
                  <tbody>
                    {% for o in delivered %}
                      {% with order=o %}
                        {% include 'display_order.tpl' %}
                      {% endwith %}
                    {% endfor %}

                    {% if not delivered[0] %}
                    <tr>
                      <td>
                        <p class="text-primary float-left">Your order history is empty. </p>
                      </td>
                    </tr>
                    {% endif %}
                    </tbody>
                    <tfoot>
                    </tfoot>
                  </table>
                  {% for o in delivered %}
                    {% with order=o %}
                      {% include 'order_modals.tpl' %}
                    {% endwith %}
                  {% endfor %}
            </div>
            <div id="denied" class="tab-pane fade">
            <br>
            <table id="deniedorders" class="table table-hover table-condensed">
                <thead>
                  <tr style="color:black;">
                      <h2>Denied Orders</h2>
                  </tr>
                </thead>
                <tbody>
                  {% for o in denied %}
                    {% with order=o %}
                      {% include 'display_order.tpl' %}
                    {% endwith %}
                  {% endfor %}

                  {% if not denied[0] %}
                  <tr>
                    <td>
                      <p class="text-primary float-left">You do not have any rejected orders at this time. </p>
                    </td>
                  </tr>
                  {% endif %}
                  </tbody>
                  <tfoot>
                  </tfoot>
                </table>
                {% for o in denied %}
                  {% with order=o %}
                    {% include 'order_modals.tpl' %}
                  {% endwith %}
                {% endfor %}
            </div>
          </div>
  		  </div>

      </div>
      <!-- /.container -->


    <!-- Footer -->
    <footer class="py-4 red-bar">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; TigerMeals Delivery 2019</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="/static/vendor/jquery/jquery.min.js"></script>
    <script src="/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
