<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>TigerMeals Delivery - About Us</title>

    <!-- Bootstrap core CSS -->
    <link href="static/css/bootstrap-lux.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="static/css/shop-homepage.css" rel="stylesheet">
    <link href="static/css/boostrap-slider.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    <!-- use the nordstrom style - have dropdown filters per restaurant/allergies/cuisine type/number of Servings
    wich checkboxes
    and have an upper display show which filters are applied

    then have a sort by dropdown bar in the upper right
    -->

  </head>


  <body>

    <!-- Navigation -->
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
            <li class="nav-item-bar active">
              <a class="nav-link" href="http://localhost:8080/about?id={{id}}">About</a>
            </li>
            <li class="nav-item-bar">
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

    <!-- Page Content -->
    <div class="container">

      <!-- Introduction Row -->
      <h1 class="my-4">About Us
        <small>It's Nice to Meet You!</small>
      </h1>
      <p>We are a committed and driven group of students who want to make a difference in the way we eat on campus. Our mission is to connect local restaurants to the various RCA's, club leaders, and student organizers across the Princeton community.</p>

      <!-- Team Members Row -->
      <div class="row">
        <div class="col-lg-12">
          <h2 class="my-4">Our Team</h2>
        </div>
        <div class="col-lg-4 col-sm-6 text-center mb-4">
          <img class="rounded-circle img-fluid d-block mx-auto" src="https://scontent-lga3-1.xx.fbcdn.net/v/t1.0-9/45581789_344937272929889_7973460369588879360_n.jpg?_nc_cat=111&_nc_ht=scontent-lga3-1.xx&oh=52266d037a0e0eb851e7bd155380d443&oe=5C3DB036" alt="">
          <h3>Vinay Ramesh
            <small>Project Leader</small>
          </h3>
          <p>Primarily worked on front-end development on this application, saw over the timeline and created weekly deliverables. Created the template from which our backend is based on.</p>
        </div>
        <div class="col-lg-4 col-sm-6 text-center mb-4">
          <img class="rounded-circle img-fluid d-block mx-auto" src="https://scontent-lga3-1.xx.fbcdn.net/v/t1.0-1/c150.14.630.630/s320x320/21272407_1609338289117127_4836876658271716262_n.jpg?_nc_cat=103&_nc_ht=scontent-lga3-1.xx&oh=5cc81e7367e169b0948ce9c6da8829da&oe=5C3F216D" alt="">
          <h3>Aliyah Taylor
            <small>Backend Wiz</small>
          </h3>
          <p>Wrote the entire backend model and database, and heavily involved in the front-end development of the application, namely the restaurant version of the user interface.</p>
        </div>
        <div class="col-lg-4 col-sm-6 text-center mb-4">
          <img class="rounded-circle img-fluid d-block mx-auto" src="https://scontent-lga3-1.xx.fbcdn.net/v/t1.0-1/p320x320/41562934_2113300308700754_981269520259743744_n.jpg?_nc_cat=111&_nc_ht=scontent-lga3-1.xx&oh=2923b34d1cda7dd993c6740c5c1dcf55&oe=5C42DA8C" alt="">
          <h3>Janet Lee
            <small>Frontend Wiz</small>
          </h3>
          <p>Created the templates from which we created the main look and design of the application, providing insight to the rest of the team on design decisions and knowledge of the Bootstrap framework.</p>
        </div>
        <div class="col-lg-4 col-sm-6 text-center mb-4">
          <img class="rounded-circle img-fluid d-block mx-auto" src="https://scontent-lga3-1.xx.fbcdn.net/v/t1.0-1/p320x320/29186842_2038620979499487_5184330447475179520_n.jpg?_nc_cat=111&_nc_ht=scontent-lga3-1.xx&oh=3234a713e22dbceffb182c5087b28a32&oe=5C73245E" alt="">
          <h3>Niranjan Shankar
            <small>General Wiz</small>
          </h3>
          <p>Created the Restful API that allows the main application to communicate with our backend database and model. Later became involved heavily in frontend development.</p>
        </div>
        <div class="col-lg-4 col-sm-6 text-center mb-4">
          <img class="rounded-circle img-fluid d-block mx-auto" src="https://www.cs.princeton.edu/~rdondero/images/rdondero.jpg" alt="">
          <h3>Professor Robert Dondero, Ph.D
            <small>COS 333 Lead Course Instructor</small>
          </h3>
          <p>Provided mentorship and guidance throughout the project. Equipped us with the knowledge and tools necessary to embark on a project like this one.</p>
        </div>
        <div class="col-lg-4 col-sm-6 text-center mb-4">
          <img class="rounded-circle img-fluid d-block mx-auto" src="https://scontent-lga3-1.xx.fbcdn.net/v/t1.0-9/32829734_10216759133919484_8628687231508283392_n.jpg?_nc_cat=102&_nc_ht=scontent-lga3-1.xx&oh=f73457d94e63ba615886cc42db2fb862&oe=5C6E956E" alt="">
          <h3>Mohamed El-Dirany
            <small>COS 333 Course Teacher Assistant</small>
          </h3>
          <p>Serving as our immediate point of contact, Mohamed met with the team on a weekly basis to provide suggesstions, deliverables, and insight to the project. He is essential to the success of this project.</p>
        </div>

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
    <script src="static/vendor/jquery/jquery.min.js"></script>
    <script src="static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script>
    // // Instantiate a slider
    // var mySlider = new Slider("input.slider", {
    //  // initial options object
    // });
    //var slider = new Slider('#ex2', {});
    // var slider = new Slider('#numservings', {});
    // // Call a method on the slider
    // var value = mySlider.getValue();
    //
    // // For non-getter methods, you can chain together commands
    // mySlider
    //  .setValue(5)
    //  .setValue(7);
    </script>
  </body>

</html>
