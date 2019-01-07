<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>TigerMeals Delivery - Home</title>
    <link rel='icon' href='/static/img/takeout.ico'></link>
    <!-- Bootstrap core CSS -->
    <link href="/static/css/bootstrap-lux.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/static/css/shop-homepage.css" rel="stylesheet">
    <link href="/static/css/bootstrap-slider.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    <!-- Custom fonts for this template -->
    <link href="/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

    <!-- Plugin CSS -->
    <link href="/static/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/static/css/creative.min.css" rel="stylesheet">

  </head>

  <body id="page-top">

    {% include 'nav_restaurant.tpl' %}

    <script>
      document.getElementById('nav-home').classList.add('active');
    </script>

    <section class="jumbotron text-center">
      <div class="container">
        <h1 class="jumbotron-heading text-light">Welcome to TigerMeals Delivery!</h1>
        <p class="lead text-light">Our mission is to connect local restaurants to the various RCA's, club leaders, and student organizers across the Princeton community to make the catering process as easy as possible.</p>
        <p>
          <a href="/listings" class="btn btn-primary mt-2 mb-0">Manage my listings</a>
          <button type="button" class="btn btn-secondary mt-2 mb-0">Learn more</button>
        </p>
      </div>
    </section>


    <div class="container how_it_works">
      <div class="py-5 px-5">
        <div class="col-lg-12">
          <h2 class="my-4 text-center">How It Works</h2>
          <!-- <p class="text-black">We are at your service!</p> -->
          <div class="container">
            <div class="row">
              <div class="col-lg-3 col-md-6 text-center">
                <div class="service-box mt-5 mx-auto">
                  <i class="fas fa-4x fa-mouse-pointer text-danger mb-3 sr-icon-1"></i>
                  <h4 class="mb-3 text-primary">List</h4>
                  <p class="text-dark mb-0">List your restaurant's catering packages on our website.</p>
                </div>
              </div>
              <div class="col-lg-3 col-md-6 text-center">
                <div class="service-box mt-5 mx-auto">
                  <i class="fas fa-4x fa-utensils text-danger mb-3 sr-icon-2"></i>
                  <h4 class="mb-3 text-primary">Manage</h4>
                  <p class="text-primary mb-0">Manage orders sent in real-time by students.</p>
                </div>
              </div>
              <div class="col-lg-3 col-md-6 text-center">
                <div class="service-box mt-5 mx-auto">
                  <i class="fas fa-4x fa-truck text-danger mb-3 sr-icon-4"></i>
                  <h4 class="mb-3 text-primary">Deliver</h4>
                  <p class="text-primary mb-0">Deliver directly to the Princeton campus!</p>
                </div>
              </div>
              <div class="col-lg-3 col-md-6 text-center">
                <div class="service-box mt-5 mx-auto">
                  <i class="fas fa-4x fa-dollar-sign text-danger mb-3 sr-icon-3"></i>
                  <h4 class="mb-3 text-primary">Profit</h4>
                  <p class="text-primary mb-0">Gain an increased presence (and increased profits) on the Princeton community!</p>
                </div>
              </div>

            </div>
          </div>

        </div>
      </div>
    </div>

    <div class="borders-top-bottom mt-0">
      <div class="container">
        <div class="py-5 px-5">
          <div class="col-lg-12">
            <h2 class="my-4 text-center">FAQ</h2>
            <!-- <p class="text-black">We are at your service!</p> -->
            <section class="accordion-section clearfix mt-3" aria-label="Question Accordions">
              <div class="container">

                  <div class="panel panel-default">
              		  <div class="panel-heading p-3 mb-3" role="tab" id="heading2">
              			<h5 class="panel-title mb-0">
              			  <a class="collapsed" role="button" title="" data-toggle="collapse" data-parent="#accordion" href="#collapse2" aria-expanded="true" aria-controls="collapse2">
              				How do I check the status of my orders?
              			  </a>
              			</h5>
              		  </div>
              		  <div id="collapse2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading2">
              			<div class="panel-body px-3 mb-4">
              			  <p>Under <a href="/orders" class="text-danger">Orders</a>, you can check your order status for pending, active, and delivered orders.</p>
              			</div>
              		  </div>
              		</div>


                  <div class="panel panel-default">
              		  <div class="panel-heading p-3 mb-3" role="tab" id="heading3">
              			<h5 class="panel-title mb-0">
              			  <a class="collapsed" role="button" title="" data-toggle="collapse" data-parent="#accordion" href="#collapse3" aria-expanded="true" aria-controls="collapse3">
              				How long do I have to approve an order?
              			  </a>
              			</h5>
              		  </div>
              		  <div id="collapse3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading3">
              			<div class="panel-body px-3 mb-4">
              			  <p>You will have 48 hours to approve an order. If the order is not approved by then, the order will automatically be cancelled.</p>
              			</div>
              		  </div>
              		</div>


              		<div class="panel panel-default">
              		  <div class="panel-heading p-3 mb-3" role="tab" id="heading4">
              			<h5 class="panel-title mb-0">
              			  <a class="collapsed" role="button" title="" data-toggle="collapse" data-parent="#accordion" href="#collapse4" aria-expanded="true" aria-controls="collapse4">
              				How does payment get processed?
              			  </a>
              			</h5>
              		  </div>
              		  <div id="collapse4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading4">
              			<div class="panel-body px-3 mb-4">
              			  <p>We process payment through <a href="https://stripe.com/" class="text-danger">Stripe</a> as well as through cash. Please create a <a href="https://stripe.com/" class="text-danger">Stripe</a> account to receive your payment.</p>
              			</div>
              		  </div>
              		</div>

                  <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                    <div class="panel panel-default">
                		  <div class="panel-heading p-3 mb-3" role="tab" id="heading1">
                			<h5 class="panel-title mb-0">
                			  <a class="collapsed" role="button" title="" data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="true" aria-controls="collapse1">
                				When does a customer get charged for the order?
                			  </a>
                			</h5>
                		  </div>
                		  <div id="collapse1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading1">
                			<div class="panel-body px-3 mb-4">
                			  <p>The user only gets charged for the order once the restaurant approves it.</p>
                			</div>
                		  </div>
                		</div>

                  <div class="panel panel-default">
              		  <div class="panel-heading p-3 mb-3" role="tab" id="heading5">
              			<h5 class="panel-title mb-0">
              			  <a class="collapsed" role="button" title="" data-toggle="collapse" data-parent="#accordion" href="#collapse5" aria-expanded="true" aria-controls="collapse5">
              				Can a user modify the order once they have submitted it?
              			  </a>
              			</h5>
              		  </div>
              		  <div id="collapse5" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading5">
              			<div class="panel-body px-3 mb-4">
              			  <p>No, the user cannot modify an order once it is placed.</p>
              			</div>
              		  </div>
              		</div>

                  <div class="panel panel-default">
              		  <div class="panel-heading p-3 mb-3" role="tab" id="heading6">
              			<h5 class="panel-title mb-0">
              			  <a class="collapsed" role="button" title="" data-toggle="collapse" data-parent="#accordion" href="#collapse6" aria-expanded="true" aria-controls="collapse6">
              				Can the user cancel a pending order?
              			  </a>
              			</h5>
              		  </div>
              		  <div id="collapse6" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading6">
              			<div class="panel-body px-3 mb-4">
              			  <p>To cancel a pending order, a user must contact the restaurant directly.</p>
              			</div>
              		  </div>
              		</div>

                  <div class="panel panel-default">
              		  <div class="panel-heading p-3 mb-3" role="tab" id="heading7">
              			<h5 class="panel-title mb-0">
              			  <a class="collapsed" role="button" title="" data-toggle="collapse" data-parent="#accordion" href="#collapse6" aria-expanded="true" aria-controls="collapse7">
              				How can I create a new catering package listing?
              			  </a>
              			</h5>
              		  </div>
              		  <div id="collapse7" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading7">
              			<div class="panel-body px-3 mb-4">
                      <p>Under <a href="/listings" class="text-danger">Listings</a>, you can modify your existing listings, create new listings, and inactivate existing listings.</p>
              			</div>
              		  </div>
              		</div>

            	  </div>

              </div>
            </section>

          </div>
        </div>
      </div>
    </div>


    <div class="container">
      <div class="pt-5 px-5 ">
        <!-- Team Members Row -->
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="my-4 text-center">Our Team</h2>
          </div>
          <div class="col-lg-3 col-sm-6 text-center mb-4">
            <img class="img-fluid d-block mx-auto mb-2" src="https://scontent-lga3-1.xx.fbcdn.net/v/t1.0-9/45581789_344937272929889_7973460369588879360_n.jpg?_nc_cat=111&_nc_ht=scontent-lga3-1.xx&oh=52266d037a0e0eb851e7bd155380d443&oe=5C3DB036" alt="">
            <h4>Vinay Ramesh</h4>
            <h5><small>BSE COS '20</small></h5>
          </div>
          <div class="col-lg-3 col-sm-6 text-center mb-4">
            <img class="img-fluid d-block mx-auto mb-2" src="https://scontent-lga3-1.xx.fbcdn.net/v/t1.0-1/c150.14.630.630/s320x320/21272407_1609338289117127_4836876658271716262_n.jpg?_nc_cat=103&_nc_ht=scontent-lga3-1.xx&oh=5cc81e7367e169b0948ce9c6da8829da&oe=5C3F216D" alt="">
            <h4>Aliyah Taylor</h4>
            <h5><small>BSE COS '19</small></h5>
          </div>
          <div class="col-lg-3 col-sm-6 text-center mb-4">
            <img class="img-fluid d-block mx-auto mb-2" src="static/img/janetheadshot.jpg" alt="">
            <h4>Janet Lee</h4>
            <h5><small>AB COS '20</small></h5>
          </div>
          <div class="col-lg-3 col-sm-6 text-center mb-4">
            <img class="img-fluid d-block mx-auto mb-2" src="https://scontent-lga3-1.xx.fbcdn.net/v/t1.0-1/p320x320/29186842_2038620979499487_5184330447475179520_n.jpg?_nc_cat=111&_nc_ht=scontent-lga3-1.xx&oh=3234a713e22dbceffb182c5087b28a32&oe=5C73245E" alt="">
            <h4>Niranjan Shankar</h4>
            <h5><small>BSE COS '20</small></h5>
          </div>
        </div>
        <div class="row justify-content-center">
          <div class="col-lg-3 col-sm-6 text-center mb-4">
            <img class="img-fluid d-block mx-auto mb-2" src="https://www.cs.princeton.edu/~rdondero/images/rdondero.jpg" alt="">
            <h4>Professor Robert Dondero, Ph.D</h4>
            <h5><small>COS 333 Lead Course Instructor</small></h5>
          </div>
          <div class="col-lg-3 col-sm-6 text-center mb-4">
            <img class="img-fluid d-block mx-auto mb-2" src="https://scontent-lga3-1.xx.fbcdn.net/v/t1.0-9/32829734_10216759133919484_8628687231508283392_n.jpg?_nc_cat=102&_nc_ht=scontent-lga3-1.xx&oh=f73457d94e63ba615886cc42db2fb862&oe=5C6E956E" alt="">
            <h4>Mohamed El-Dirany</h4>
            <h5><small>COS 333 Course Teacher Assistant</small></h5>
          </div>
        </div>
      </div>
    </div>

    <div>
      <div class="row px-5 mt-1 mb-3 justify-content-center">
        <p>Questions? Contact us at <a href="mailto:tigermealsdelivery@gmail.com">tigermealsdelivery@gmail.com</a>.</p>
      </div>
    </div>
  </div>


    <footer class="py-4 red-bar">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; TigerMeals Delivery 2018</p>
      </div>
      <!-- /.container -->
    </footer>


    <!-- Bootstrap core JavaScript -->
    <script src="/static/vendor/jquery/jquery.min.js"></script>
    <script src="/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="/static/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="/static/vendor/scrollreveal/scrollreveal.min.js"></script>
    <script src="/static/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="js/creative.min.js"></script>

    <script>
        $("button").click(function() {
        $('html,body').animate({
            scrollTop: $(".how_it_works").offset().top - 50},
            'slow');
    });
    </script>

  </body>

</html>
