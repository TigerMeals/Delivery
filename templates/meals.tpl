<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>TigerMeals Delivery - Shop Meals</title>
    <link rel='icon' href='takeout.ico'></link>

    <!-- Bootstrap core CSS -->
    <link href="/static/css/bootstrap-lux.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/static/css/shop-homepage.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    <script type="text/javascript" src="static/js/jquery-1.10.2.min.js"></script>

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
              <a class="nav-link" href="http://localhost:8080/home?id={{id}}">Home</a>
            </li>
            <li class="nav-item-bar">
              <a class="nav-link" href="http://localhost:8080/about?id={{id}}">About</a>
            </li>
            <li class="nav-item-bar active">
              <a class="nav-link" href="http://localhost:8080/meals?id={{id}}">Meals</a>
            </li>
            <li class="nav-item-bar">
              <a class="nav-link" href="http://localhost:8080/account?id={{id}}">My Account</a>
            </li>
            <li class="nav-item-bar justify-content-end dropdown">
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
                            <button class="btn-sm btn-danger btn-cart fa fa-times"></button>
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
                    <a class="checkout-text item-left" href="http://localhost:8080/cart?id={{id}}">View Cart</a>
                    <a class="checkout-text item-right" href="http://localhost:8080/checkout?id={{id}}">Checkout</a>
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
    <form action = "filterCaterings" method = "get">
    <div class="container">

      <div class="row">

        <div class="col-lg-3">
          <div class="sticky-top">

          <h1 class="catering-header">Catering Packages</h1>
          <h4>Filter by</h4>

          <div class="accordion" id="accordionExample">
            <div class="card border-light bg-transparent">
              <!-- <div class="card-header bg-transparent" id="current">
                <h5 class="mb-0">
                    <div class="col-sm pl-0 float-left">Current filters: </div>
                </h5>
              </div> -->
              <div class="card-header bg-transparent" id="headingOne">
                <h5 class="mb-0">
                  <button class="btn btn-link no-pad float-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    <div class="col-sm pl-0 float-left">Restaurant </div>
                  </button>
                  <button class="btn btn-link no-pad float-right" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                  <div class="col-sm pr-0 float-right"><i class="fas fa-plus"></i></div>
                </button>
                </h5>
              </div>

               <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                <div class="card-body">
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" name = "KungFuTea" id="KungFuTea" {{'checked="checked"' if KungFuTea else ""}}>
                    <label class="form-check-label" for="KungFuTea">
                      Kung Fu Tea
                    </label> <br>
                    <input class="form-check-input" type="checkbox" name = "Panera" id="Panera" {{'checked="checked"' if Panera else ""}}>
                    <label class="form-check-label" for="Panera">
                      Panera
                    </label> <br>
                    <input class="form-check-input" type="checkbox" name = "Tacoria" id="Tacoria" {{'checked="checked"' if Tacoria else ""}}>
                    <label class="form-check-label" for="Tacoria">
                      Tacoria
                    </label> <br>
                  </div>
                </div>
              </div>
            </div>
            <div class="card border-light bg-transparent">
              <div class="card-header bg-transparent" id="headingTwo">
                <h5 class="mb-0">
                  <button class="btn btn-link no-pad float-left" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                    <div class="col-sm pl-0 float-left">Cuisine </div>
                  </button>
                  <button class="btn btn-link no-pad float-right" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                  <div class="col-sm pr-0 float-right"><i class="fas fa-plus"></i></div>
                </button>
                </h5>
              </div>
              <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                <div class="card-body">
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" name = "Asian"  id="Asian" {{'checked="checked"' if Asian else ""}}>
                    <label class="form-check-label" for="Asian">
                      Asian
                    </label> <br>
                    <input class="form-check-input" type="checkbox"  name = "American" id="American" {{'checked="checked"' if American else ""}}>
                    <label class="form-check-label" for="American">
                      American
                    </label> <br>
                    <input class="form-check-input" type="checkbox"  name = "Drinks" id="Drinks" {{'checked="checked"' if Drinks else ""}}>
                    <label class="form-check-label" for="Drinks">
                      Drinks
                    </label> <br>
                    <input class="form-check-input" type="checkbox"  name = "Healthy" id="Healthy" {{'checked="checked"' if Healthy else ""}}>
                    <label class="form-check-label" for="Healthy">
                      Healthy
                    </label> <br>
                  </div>
              </div>
            </div>
            </div>
            <div class="card border-light bg-transparent">
              <div class="card-header bg-transparent" id="headingThree">
                <h5 class="mb-0">
                  <button class="btn btn-link no-pad float-left" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
                    <div class="col-sm pl-0 float-left">Dietary Restrictions </div>
                  </button>
                  <button class="btn btn-link no-pad float-right" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
                  <div class="col-sm pr-0 float-right"><i class="fas fa-plus"></i></div>
                </button>
                </h5>
              </div>
              <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                <div class="card-body">
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" name = "GLFree" id="GLFree" {{'checked="checked"' if GLFree else ""}}>
                    <label class="form-check-label" for="GLFree">
                      Gluten Free
                    </label> <br>
                    <input class="form-check-input" type="checkbox" name = "Kosher" id="Kosher" {{'checked="checked"' if Kosher else ""}}>
                    <label class="form-check-label" for="Kosher">
                      Kosher
                    </label> <br>
                    <input class="form-check-input" type="checkbox" name = "Vegan" id="Vegan" {{'checked="checked"' if Vegan else ""}}>
                    <label class="form-check-label" for="Vegan">
                      Vegan
                    </label> <br>
                    <input class="form-check-input" type="checkbox" name = "Vegetarian" id="Vegetarian" {{'checked="checked"' if Vegetarian else ""}}>
                    <label class="form-check-label" for="Vegetarian">
                      Vegetarian
                    </label> <br>
                  </div>
              </div>
            </div>
          </div>
            <div class="card border-light bg-transparent">
              <div class="card-header bg-transparent" id="headingFour">
                <h5 class="mb-0">
                  <button class="btn btn-link no-pad float-left" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="true" aria-controls="collapseFour">
                    <div class="col-sm pl-0 float-left">Serving Size </div>
                  </button>
                  <button class="btn btn-link no-pad float-right" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="true" aria-controls="collapseFour">
                  <div class="col-sm pr-0 float-right"><i class="fas fa-plus"></i></div>
                </button>
                </h5>
              </div>
              <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
                <div class="card-body">
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" name = "serving025" id="serving025" {{'checked="checked"' if serving025 else ""}}>
                    <label class="form-check-label" for="serving025">
                      0-25
                    </label> <br>
                    <input class="form-check-input" type="checkbox" name = "serving2550" id="serving2550" {{'checked="checked"' if serving2550 else ""}}>
                    <label class="form-check-label" for="serving2550">
                      25-50
                    </label> <br>
                    <input class="form-check-input" type="checkbox" name = "serving5075" id="serving5075" {{'checked="checked"' if serving5075 else ""}}>
                    <label class="form-check-label" for="serving5075">
                      50-75
                    </label> <br>
                    <input class="form-check-input" type="checkbox" name = "serving75100" id="serving75100" {{'checked="checked"' if serving75100 else ""}}>
                    <label class="form-check-label" for="serving75100">
                      75-100
                    </label> <br>
                    <input class="form-check-input" type="checkbox" name = "serving100" id="serving100" {{'checked="checked"' if serving100 else ""}}>
                    <label class="form-check-label" for="serving100">
                      100+
                    </label> <br>
                  </div>
                </div>
              </div>
            </div>
            <div class="card border-white bg-transparent">
              <div class="card-header border-white bg-transparent" id="headingFive">
                <h5 class="mb-0">
                  <div class="float-right">
                  <input class="btn-sm btn-primary" type="submit" value="Apply Filters">
                </div>
                </h5>
              </div>
            </div>
          </div>
        </div>
        </div>
        </form>

        <div class="col-lg-9">

          <div id="carouselExampleIndicators" class="carousel slide mt-4 mb-2" data-ride="carousel">
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

          <div class="sticky-top">
          <div class="row">
            <div class="col-lg-8 col-md-12 mb-8">
              <div class="sticky-top">
                <h2>Catering Packages</h2>
                <span class="ml-2">(12 results)</span>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4 float-right">
              <div class="sticky-top">
                <div class="dropdown float-right">
                  <a class="btn btn-primary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Sort by...
                  </a>

                  <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink">
                    <a class="dropdown-item active" href="#">Featured</a>
                    <a class="dropdown-item" href="http://localhost:8080/meals/popularitySort?id={{id}}">Most popular</a>
                    <a class="dropdown-item" href="http://localhost:8080/meals/servingLowHighSort?id={{id}}">Number of servings (Low to High)</a>
                    <a class="dropdown-item" href="http://localhost:8080/meals/servingHighLowSort?id={{id}}">Number of servings (High to Low)</a>
                    <a class="dropdown-item" href="http://localhost:8080/meals?id={{id}}">Price low to high</a>
                    <a class="dropdown-item" href="http://localhost:8080/meals/priceHighLowSort?id={{id}}">Price high to low</a>
                    <a class="dropdown-item" href="http://localhost:8080/meals/mostRecentlyAddedSort?id={{id}}"> Most Recently added</a>
                    <a class="dropdown-item" href="http://localhost:8080/meals/leastRecentlyAddedSort?id={{id}}"> Least Recently added</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

          <div class="row">

            {% for m in meals %}
              {% with meal=m %}
                {% include 'display_meal.tpl' %}
              {% endwith %}
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
        <p class="m-0 text-center text-white">Copyright &copy; TigerMeals Delivery 2018</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="/static/vendor/jquery/jquery.min.js"></script>
    <script src="/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    
    <script>

    var date = new Date();
    var seed = date.getSeconds();
    var request = null;

    function filterServingSize(){
      var servingFilter1 = "";
      var servingFilter2 = "";
      var servingFilter3 = "";
      var servingFilter4 = "";
      var servingFilter5 = "";

      if (document.getElementById('0-25').checked == true){
        servingFilter1 = "0-25";
      }
      if (document.getElementById('25-50').checked == true){
        servingFilter2 = "25-50";
      }
      if (document.getElementById('50-75').checked == true){
        servingFilter3 = "50-75";
      }
      if (document.getElementById('75-100').checked == true){
        servingFilter4 = "75-100";
      }
      if (document.getElementById('100+').checked == true){
        servingFilter5 = "100+";
      }

      servingFilter1 = encodeURIComponent(servingFilter1);
      servingFilter2 = encodeURIComponent(servingFilter2);
      servingFilter3 = encodeURIComponent(servingFilter3);
      servingFilter4 = encodeURIComponent(servingFilter4);
      servingFilter5 = encodeURIComponent(servingFilter5);

      var url = "/allergyFiltering?allergen1=" + allergen1+ "&allergen2=" + allergen2 + "&allergen3=" + allergen3 + "&allergen4=" + allergen4 + "&messageId=" + messageId;

      if (request != null) request.abort();

      request = createAjaxRequest();
      if (request == null) return;
      request.onreadystatechange = processReadyStateChange;
      request.open("GET", url);
      request.send(null);

    }

    function filterAllergens(){
      var allergen1 = "";
      var allergen2 = "";
      var allergen3 = "";
      var allergen4 = "";

      if (document.getElementById('gf').checked == true){
        allergen1 = "Gluten Free";
      }
      if (document.getElementById('kosher').checked == true){
        allergen2 = "Kosher";
      }
      if (document.getElementById('vegan').checked == true){
        allergen3 = "Vegan";
      }
      if (document.getElementById('vegetarian').checked == true){
        allergen4 = "Vegetarian";
      }

      allergen1 = encodeURIComponent(allergen1);
      allergen2 = encodeURIComponent(allergen2);
      allergen3 = encodeURIComponent(allergen3);
      allergen4 = encodeURIComponent(allergen4);
    

      var url = "/allergyFiltering?allergen1=" + allergen1+ "&allergen2=" + allergen2 + "&allergen3=" + allergen3 + "&allergen4=" + allergen4 + "&messageId=" + messageId;

      if (request != null) request.abort();

      request = createAjaxRequest();
      if (request == null) return;
      request.onreadystatechange = processReadyStateChange;
      request.open("GET", url);
      request.send(null);

    }
    function processReadyStateChange()
         {
            var STATE_UNINITIALIZED = 0;
            var STATE_LOADING       = 1;
            var STATE_LOADED        = 2;
            var STATE_INTERACTIVE   = 3;
            var STATE_COMPLETED     = 4;
            
            if (this.readyState != STATE_COMPLETED)
               return;
            
            if (this.status != 200)  // Request succeeded?
            {  
               //alert(
               //   "AJAX error: Request failed: " + this.statusText);
               return;
            }
            
            if (this.responseText == null)  // Data received?
            {  
               alert("AJAX error: No data received");
               return;
            }

            var classesText = 
                 document.getElementById("classesResults");
            classesText.innerHTML = this.responseText;
         }

         function createAjaxRequest() {
            var req;
                       
            try  // Some browser other than Internet Explorer
            {
               req = new XMLHttpRequest();
            }
            catch (e1) 
            {    
               try  // Internet Explorer 6+
               {
                  req = new ActiveXObject("Msxml2.XMLHTTP");
               }
               catch (e2) 
               {  
                  try  // Internet Explorer 5
                  { 
                     req = new ActiveXObject("Microsoft.XMLHTTP"); 
                  }
                  catch (e3)
                  {  
                     req = false;
                  }
               }
            }
            return req;
         }
         </script>

  </body>

</html>
