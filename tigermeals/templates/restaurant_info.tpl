<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>TigerMeals Delivery - Shop Meals</title>
    <link rel='icon' href='/static/img/takeout.ico'></link>

    <!-- Bootstrap core CSS -->
    <link href="/static/css/bootstrap-lux.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/static/css/shop-homepage.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    <script type="text/javascript" src="static/js/jquery-1.10.2.min.js"></script>

  </head>

  <body>

    {% include 'nav.tpl' %}
    <script>
      document.getElementById('nav-meals').classList.add('active');
      document.getElementById('nav-meals-dropdown').classList.add('active');
    </script>
    <!-- Page Content -->
    <div id="page-content-wrapper">
      <div class="container-fluid container">
      <!-- Portfolio Item Row -->
      <div class="row justify-content-end">
        <div class="col-md-8 col-sm-12">
          <img class="img-fluid" src="{{restaurant.image}}">
        </div>

        <div class="col-lg-4 col-md-12 col-sm-12">
          <h1 class="mb-2">{{restaurant.name}}</h1>
          <p>{{restaurant.description}}</p>


          <div class="row">
            <div class="col-4">
              <h6 class="mt-1 mb-0">Address</h6>
            </div>
            <div class="col-8">
              <p>{{restaurant.address}}</p>
            </div>
          </div>

          <div class="row">
            <div class="col-4">
              <h6 class="mt-1 mb-0">Phone</h6>
            </div>
            <div class="col-8">
              <p>{{restaurant.phone}}</p>
            </div>
          </div>

         {%if avgRating%}
          <div class="row">
            <div class="col-4">
              <h6 class="mt-1 mb-0">Average User Rating</h6>
            </div>
            <div class="col-8">
              <p><span id="rating"></span></p>
            </div>
          </div>
          <script>
          document.getElementById("rating").innerHTML = parseFloat({{avgRating}}).toFixed(1)
          </script>
        {% endif %}


          <div class="row">
            <div class="col-4">
              <h6 class="mt-1 mb-0">Website</h6>
            </div>
            <div class="col-8">
              <p><a href="http://{{restaurant.website}}">{{restaurant.website}}</a></p>
            </div>
          </div>

          <div class="row">
            <div class="col-4">
              <h6 class="mt-1 mb-0">Email</h6>
            </div>
            <div class="col-8">
              <p><a href="mailto:{{restaurant.email}}">{{restaurant.email}}</a></p>
            </div>
          </div>

          <div class="row">
            <div class="col-12">
              <h6 class="mt-1 mb-1">Hours of Operation</h6>
            </div>
            <!-- <div class="row"> -->

            <div class="col-4">
              <h6 class="mt-1 mb-0"><small>Sunday </small></h6>
            </div>
            <div class="col-8">
              <p class="mt-0 mb-0">{{hours[0]}} - {{hours[1]}}</p>
            </div>

            <div class="col-4">
              <h6 class="mt-1 mb-0"><small>Monday </small></h6>
            </div>
            <div class="col-8">
              <p class="mt-0 mb-0">{{hours[2]}} - {{hours[3]}}</p>
            </div>

            <div class="col-4">
              <h6 class="mt-1 mb-0"><small>Tuesday </small></h6>
            </div>
            <div class="col-8">
              <p class="mt-0 mb-0">{{hours[4]}} - {{hours[5]}}</p>
            </div>

            <div class="col-4">
              <h6 class="mt-1 mb-0"><small>Wednesday </small></h6>
            </div>
            <div class="col-8">
              <p class="mt-0 mb-0">{{hours[6]}} - {{hours[7]}}</p>
            </div>

            <div class="col-4">
              <h6 class="mt-1 mb-0"><small>Thursday </small></h6>
            </div>
            <div class="col-8">
              <p class="mt-0 mb-0">{{hours[8]}} - {{hours[9]}}</p>
            </div>

            <div class="col-4">
              <h6 class="mt-1 mb-0"><small>Friday </small></h6>
            </div>
            <div class="col-8">
              <p class="mt-0 mb-0">{{hours[10]}} - {{hours[11]}}</p>
            </div>

            <div class="col-4">
              <h6 class="mt-1 mb-0"><small>Saturday</small></h6>
            </div>
            <div class="col-8">
              <p class="mt-0 mb-0">{{hours[12]}} - {{hours[13]}}</p>
            </div>
          </div>
        </div>


      </div>
      <!-- /.row -->
      <!-- Related Projects Row -->
      <h3 class="my-4">Available Catering Packages</h3>
      <div class="row">
        {% if hasMeals %}
          {% for m in meals %}
            {% with meal=m %}
              {% if m.active %}
                {% include 'display_meal.tpl' %}
              {% endif %}
            {% endwith %}
          {% endfor %}
        {% endif %}
        {% if not hasMeals %}
        <div class="col-12">
          <span class="text-primary">This restaurant doesn't have any available catering packages yet. 😢</span>
        </div>
        <br>
        <br>
        <br>
        {% endif %}
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

  </div><!-- /#page-content-wrapper -->
</div><!-- /#wrapper -->



    <!-- Bootstrap core JavaScript -->
    <script src="/static/vendor/jquery/jquery.min.js"></script>
    <script src="/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    {% include 'handle_toggle.tpl' %}
  </body>

</html>
