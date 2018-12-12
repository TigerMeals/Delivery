<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>TigerMeals Delivery - My Meals</title>
    <link rel='icon' href='/static/img/takeout.ico'></link>

    <!-- Bootstrap core CSS -->
    <link href="/static/css/bootstrap-lux.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/static/css/shop-homepage.css" rel="stylesheet">
    <link href="/static/css/clockpicker.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/static/dist/bootstrap-clockpicker.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


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
              <a class="nav-link" href="/restaurant/home">Home</a>
            </li>
            <li class="nav-item-bar">
              <a class="nav-link" href="/restaurant/about">About</a>
            </li>
            <li class="nav-item-bar active">
              <a class="nav-link" href="/listings">My Meals</a>
                <span class="sr-only">(current)</span>
            </li>
            <li class="nav-item-bar">
              <a class="nav-link" href="/restaurant/account">My Account</a>
            </li>
            <li class="nav-item-bar">
              <a class="nav-link" href="/orders">View Orders ({{length_orders}} Active)</a>
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
        <h2>My Catering Packages</h2>
        <p class="lead">Please view your listings below. We thank you for partnering with TigerMeals Delivery.</p>
      </div>

      {% include 'add_new_listing.tpl' %}
      <table id="activerestaurantlistings" class="table table-hover table-condensed">
        <thead>
          <tr style="color:black;">
            <h2 class="float-left">My Active Listings</h2>
            <button type="button" class="btn btn-success float-right" data-toggle="modal" data-target="#newListing" aria-label="Close">Create a new listing</button>
          </tr>
        </thead>
        <tbody>
          {% for l in active_listings %}
            {% with listing=l %}
              {% include 'display_listings.tpl' %}
            {% endwith %}
          {% endfor %}
				</tbody>
				<tfoot>
				</tfoot>
			</table>
      {% for l in active_listings %}
        {% with listing=l %}
          {% include 'listings_modals.tpl' %}
        {% endwith %}
      {% endfor %}

      <table id="inactiverestaurantlistings" class="table table-hover table-condensed">
        <thead>
          <tr style="color:black;">
            <h2 class="float-left">My Inactive Listings</h2>
          </tr>
        </thead>
        <tbody>
          {% for l in inactive_listings %}
            {% with listing=l %}
              {% include 'display_listings.tpl' %}
            {% endwith %}
          {% endfor %}
        </tbody>
        <tfoot>
        </tfoot>
      </table>
      {% for l in inactive_listings %}
        {% with listing=l %}
          {% include 'listings_modals.tpl' %}
        {% endwith %}
      {% endfor %}
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
    <script src="static/js/clockpicker.js"></script>
    <script type="text/javascript" src="static/dist/bootstrap-clockpicker.min.js"></script>
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

    <!-- Modal -->
    <script>
      $(document).ready(function() {

          var readURL = function(input) {
              if (input.files && input.files[0]) {
                  var reader = new FileReader();

                  reader.onload = function (e) {
                      $('.avatar').attr('src', e.target.result);
                  }

                  reader.readAsDataURL(input.files[0]);
              }
          }

          $(".file-upload").on('change', function(){
              readURL(this);
          });
      });

    </script>

    <script type="text/javascript">
      var input = $('#input-a');
      input.commandlockpicker({
        autoclose: true
      });

      // Manual operations
      $('#button-a').click(function(e){
        // Have to stop propagation here
        e.stopPropagation();
        input.clockpicker('show')
                .clockpicker('toggleView', 'minutes');
      });
      $('#button-b').click(function(e){
        // Have to stop propagation here
        e.stopPropagation();
        input.clockpicker('show')
                .clockpicker('toggleView', 'hours');
      });
    </script>


    <script type="text/javascript">
    $('.clockpicker').clockpicker();
    </script>

  </body>

</html>
