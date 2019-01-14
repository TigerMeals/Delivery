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
    <!-- Page Content -->
    <div class="container-fluid container">
      <div class="row">

        <div class="col-lg-3">
          <div class="sticky-top">

          <h2 class="mt-0 mb-3 meals-title-rest">Restaurants</h2>
          <h4>Filter by</h4>

          <div class="accordion" id="accordionExample">
            <div class="card border-light bg-transparent">
              <div class="card-header bg-transparent" id="headingTwo">
                <h5 class="mb-0">
                  <button class="btn btn-link no-pad float-left" type="button" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                    <div class="col-sm pl-0 float-left">Cuisine </div>
                  </button>
                </h5>
              </div>
              <div id="collapseTwo" aria-labelledby="headingTwo" data-parent="#accordionExample">
                <div class="card-body">
                  <div class="form-check">
                    <form id="filter" action="/meals/restaurant/filter" method="post">
                      <input class="form-check-input" type="checkbox" value="" name="American" id="American">
                      <label class="form-check-label" for="American">
                        American
                      </label> <br>
                      <input class="form-check-input" type="checkbox" value="" name="Asian" id="Asian">
                      <label class="form-check-label" for="Asian">
                        Asian
                      </label> <br>
                      <input class="form-check-input" type="checkbox" value="" name="Breakfast" id="Breakfast">
                      <label class="form-check-label" for="Breakfast">
                        Breakfast
                      </label> <br>
                      <input class="form-check-input" type="checkbox" value="" name="Chinese" id="Chinese">
                      <label class="form-check-label" for="Chinese">
                        Chinese
                      </label> <br>
                      <input class="form-check-input" type="checkbox" value="" name="Drinks" id="Drinks">
                      <label class="form-check-label" for="Drinks">
                        Drinks
                      </label> <br>
                      <input class="form-check-input" type="checkbox" value="" name="Healthy" id="Healthy">
                      <label class="form-check-label" for="Healthy">
                        Healthy
                      </label> <br>
                      <input class="form-check-input" type="checkbox" value="" name="Indian" id="Indian">
                      <label class="form-check-label" for="Indian">
                        Indian
                      </label> <br>
                      <input class="form-check-input" type="checkbox" value="" name="Italian" id="Italian">
                      <label class="form-check-label" for="Italian">
                        Italian
                      </label> <br>
                      <input class="form-check-input" type="checkbox" value="" name="Mexican" id="Mexican">
                      <label class="form-check-label" for="Mexican">
                        Mexican
                      </label> <br>
                    </form>
                  </div>
              </div>
            </div>
            </div>


            <div class="card border-white bg-transparent">
              <div class="card-header border-white bg-transparent" id="headingFive">
                <h5 class="mb-0">
                  <div class="float-right">
                  <input class="btn-sm btn-primary" type="submit" value="Apply Filters" form="filter">
                </div>
                  <!-- <button class="btn btn-link no-pad float-right" type="button" h>
                  <div class="col-sm pr-0 float-right">Apply Filters</div> -->
                </h5>
              </div>
            </div>


            <div class="card border-white bg-transparent">
              <div class="card-header border-white bg-transparent">
                 <a href="/meals" class="btn btn-outline-primary btn-block my-2 my-sm-0 text-center btn-view">View by Meals</a>
              </div>
            </div>



          </div>
        </div>
        </div>

        <div class="col-lg-9">

          <div id="carouselExampleIndicators" class="carousel slide mt-0 mb-0" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
              <div class="carousel-item active">
                <img class="d-block img-fluid w-900 meals-carousel" src="/static/img/mexican.jpg" alt="First slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid w-900 meals-carousel" src="/static/img/banhmi.jpg" alt="Second slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid w-900 meals-carousel" src="/static/img/dessert.jpg" alt="Third slide">
              </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>

          <div class="sticky-top sticky-catering">
          <div class="row">
            <div class="col-lg-6 col-md-12 mb-8">
              <h2 class="mb-0">Restaurants</h2>
              {% if restaurants_length == 1 %}
              <span class="ml-0 mt-0">({{restaurants_length}} result)</span>
              {% else %}
              <span class="ml-0 mt-0">({{restaurants_length}} results)</span>
              {% endif %}

              <!-- <h2>Restaurants</h2> -->
              <!-- <h4 class="ml-1">{{restaurants_length}} results</h4> -->
            </div>

            <div class="col-lg-6 mb-4 float-right">
              <form class="card card-sm border-white" action="/search_restaurants" method="post">
                  <div class="card-body border-white bg-transparent row no-gutters align-items-center px-0 py-0">
                      <div class="col-auto">
                          <!-- <i class="fas fa-search h4 text-body"></i> -->
                      </div>
                      <!--end of col-->
                      <div class="col">
                          <input class="form-control form-control-sm form-control-borderless" type="search" name="search_query"placeholder="Search restaurants" value="{{last_search}}">
                      </div>
                      <!--end of col-->
                      <div class="col-auto">
                          <button class="btn-sm btn-outline-success my-2 my-sm-0" type="submit">Search</button>

                      </div>
                      {% if error %}
                      <div class="col-12 text-danger mt-2">{{error}}</div>
                      {% endif %}
                      <!--end of col-->
                  </div>
              </form>
            </div>
          </div>
        </div>

          <div class="row">
            {% for r in restaurants %}
            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card border-light h-100">
                <a href="/meals/restaurant/{{r.restaurant_id}}"><img class="card-img-top" src="{{r.image}}" alt=""></a>
                <div class="card-body">
                  <h5 class="card-title">
                    <a href="/meals/restaurant/{{r.restaurant_id}}">{{r.name}}</a>
                  </h5>
                  <h6>{{r.address}}</h6>
                  <p>{{r.num_orders}} available catering packages</p>
                </div>
              </div>
            </div>
            {% endfor %}
          </div>
          <!-- /.row -->

        </div>
        <!-- /.col-lg-9 -->

      </div>
      <!-- /.row -->
    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-4 red-bar">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; TigerMeals Delivery 2019</p>
      </div>
      <!-- /.container -->
    </footer>
  </div>
  <!-- #page-content-wrapper -->

  </div>
  <!-- #wrapper -->

  <!-- Bootstrap core JavaScript -->
  <script src="/static/vendor/jquery/jquery.min.js"></script>
  <script src="/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  {% include 'handle_toggle.tpl' %}
  <script>
  {% for c in cuisines %}
    document.getElementById('{{c}}').checked = true;
  {% endfor %}
  </script>



  </body>

</html>
