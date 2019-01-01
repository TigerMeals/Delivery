<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>TigerMeals Delivery - Home</title>
    <link rel='icon' href='static/img/takeout.ico'></link>
    <!-- Bootstrap core CSS -->
    <link href="static/css/bootstrap-lux.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="static/css/shop-homepage.css" rel="stylesheet">
    <link href="static/css/bootstrap-slider.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    <!-- Custom fonts for this template -->
    <link href="static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

    <!-- Plugin CSS -->
    <link href="static/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="static/css/creative.min.css" rel="stylesheet">

  </head>

  <body id="page-top">
    {% include 'nav.tpl' %}
    <script>
      document.getElementById('nav-home').classList.add('active');
    </script>

    <section class="jumbotron text-center">
      <div class="container">
        <h1 class="jumbotron-heading text-light">Welcome to TigerMeals Delivery!</h1>
        <p class="lead text-light">Our mission is to connect local restaurants to the various RCA's, club leaders, and student organizers across the Princeton community to make the catering process as easy as possible.</p>
        <p>
          <a href="/meals" class="btn btn-primary mt-2 mb-0">Browse meals</a>
          <a href="#how_it_works" class="btn btn-secondary mt-2 mb-0">Learn more</a>
        </p>
      </div>
    </section>

    <div class="container" id="how_it_works">
      <div class="py-5 px-5">
        <div class="col-lg-12">
          <h2 class="my-4 text-center">How It Works</h2>
          <!-- <p class="text-black">We are at your service!</p> -->
          <div class="container">
            <div class="row">
              <div class="col-lg-3 col-md-6 text-center">
                <div class="service-box mt-5 mx-auto">
                  <i class="fas fa-4x fa-mouse-pointer text-danger mb-3 sr-icon-1"></i>
                  <h4 class="mb-3 text-primary">Browse</h4>
                  <p class="text-dark mb-0">Choose from our wide selection of catering packages, from Princeton's most popular restaurants.</p>
                </div>
              </div>
              <div class="col-lg-3 col-md-6 text-center">
                <div class="service-box mt-5 mx-auto">
                  <i class="fas fa-4x fa-utensils text-danger mb-3 sr-icon-2"></i>
                  <h4 class="mb-3 text-primary">Order</h4>
                  <p class="text-primary mb-0">Order from one restaurant at a time. Schedule your order to be delivered anywhere on campus, at the time of your event.</p>
                </div>
              </div>
              <div class="col-lg-3 col-md-6 text-center">
                <div class="service-box mt-5 mx-auto">
                  <i class="fas fa-4x fa-hourglass-half text-danger mb-3 sr-icon-3"></i>
                  <h4 class="mb-3 text-primary">Wait</h4>
                  <p class="text-primary mb-0">Wait for the restaurant to approve your order - you don't get charged for the order until then!</p>
                </div>
              </div>
              <div class="col-lg-3 col-md-6 text-center">
                <div class="service-box mt-5 mx-auto">
                  <i class="fas fa-4x fa-smile-beam text-danger mb-3 sr-icon-4"></i>
                  <h4 class="mb-3 text-primary">Eat</h4>
                  <p class="text-primary mb-0">Get your food delivered directly to your event!</p>
                </div>
              </div>
            </div>
          </div>

        <div class="col-lg-12 mb-0 text-center">
            <div class="card border-light h-100">
              <a href="#" data-toggle="modal" data-target="#1"><img class="card-img-top" alt=""></a>
              <div class="card-body">
                <h5 class="card-title">
                  New User? Check out our website <a href="#" data-toggle="modal" data-target="#1"> tutorial!</a>
                </h5>
              </div>
            </div>
          </div>
          <div class="modal fade" id="1" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <center>Welcome to Tigermeals Delivery! Here are some tips on navigating our site.</center>
                </div>
                <br>
                <div class="modal-body">
                  Welcome to the start of the tutorial! We will walk you through the process of ordering a meal,
                  viewing your cart, and checking out items. Click outside the modal at any time to exit the tutorial.
              </div>
                  <div class="modal-footer">
                    <button type="button" data-toggle="modal" data-target="#2" data-dismiss="modal"> Next Tip</button>
                  </div>
              </div>
            </div>
          </div>

          <div class="modal fade" id="2" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <center>Welcome to Tigermeals Delivery! Here are some tips on navigating our site.</center>
                </div>
                <br>
                <div class="modal-body">
                Check out the meal packages we offer by clicking the "meals" option on the navbar. You can also click the "view by restaurants" tab under the meals navbar tab to see all the restaurants that offer packages.
              </div>
                <br>
                <img style="width:50%" class ="d-block mx-auto mb-4" src='https://res.cloudinary.com/djclzxoun/image/upload/v1544935604/navbarMeals.png'>
                  <div class="modal-footer">
                    <button type="button" data-toggle="modal" data-target="#1" data-dismiss="modal"> Previous Tip</button>
                    <button type="button" data-toggle="modal" data-target="#3" data-dismiss="modal"> Next Tip</button>
                  </div>
              </div>
            </div>
          </div>
          <div class="modal fade" id="3" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <center>Welcome to Tigermeals Delivery! Here are some tips on navigating our site.</center>
                </div>
                <div class = "modal-body">
                    Once you are on the meals page, add filters if you have any dietary restrictions or allergies to narrow down your meal options. Click the "Apply Filters" button to apply the filters you checked off.
                </div>
                <br>
                <img class ="d-block mx-auto mb-4" src='https://res.cloudinary.com/djclzxoun/image/upload/v1544940846/Filtering.png' width="200" height="260">
                  <div class="modal-footer">
                    <button type="button" data-toggle="modal" data-target="#2" data-dismiss="modal"> Previous Tip</button>
                    <button type="button" data-toggle="modal" data-target="#4" data-dismiss="modal"> Next Tip</button>
                  </div>
              </div>
            </div>
          </div>
          <div class="modal fade" id="4" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <center>Welcome to Tigermeals Delivery! Here are some tips on navigating our site.</center>
                </div>
                <div class = "modal-body">
                    You can also apply different sorts with the "Sort By" drop down on the right side of a page.
                </div>
                <br>
                <img class ="d-block mx-auto mb-4" src='https://res.cloudinary.com/djclzxoun/image/upload/v1544941112/Sorting.png' width="200" height="260">
                  <div class="modal-footer">
                    <button type="button" data-toggle="modal" data-target="#3" data-dismiss="modal"> Previous Tip</button>
                    <button type="button" data-toggle="modal" data-target="#5" data-dismiss="modal"> Next Tip</button>
                  </div>
              </div>
            </div>
          </div>
          <div class="modal fade" id="5" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <center>Welcome to Tigermeals Delivery! Here are some tips on navigating our site.</center>
                </div>
                <div class = "modal-body">
                    If you are interested in a particular package, click on an image of a catering package to view the information. Select a quantity and click "Add to Cart" to add this item to your cart.
                </div>
                    <br>
                    <img class ="d-block mx-auto mb-4" src='https://res.cloudinary.com/djclzxoun/image/upload/v1544943136/BubbleTeaModal.png' width="350" height="200">

                  <div class="modal-footer">
                    <button type="button" data-toggle="modal" data-target="#4" data-dismiss="modal"> Previous Tip</button>
                    <button type="button" data-toggle="modal" data-target="#6" data-dismiss="modal"> Next Tip</button>
                  </div>
              </div>
            </div>
          </div>
          <div class="modal fade" id="6" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <center>Welcome to Tigermeals Delivery! Here are some tips on navigating our site.</center>
                </div>
                <div class = "modal-body">
                    You can always view the catering packages you've added to your cart by clicking the "View Cart" tab in the navbar. If you want to update your order quantities and edit your orders, click the "View Cart" option in the dropdown to take you to the full view cart page.
                </div>
                <br>
                <img class ="d-block mx-auto mb-4" src='https://res.cloudinary.com/djclzxoun/image/upload/v1545001462/View_Cart_Drop_Down.png' width="400" height="300">
                  <div class="modal-footer">
                    <button type="button" data-toggle="modal" data-target="#5" data-dismiss="modal"> Previous Tip</button>
                    <button type="button" data-toggle="modal" data-target="#7" data-dismiss="modal"> Next Tip</button>
                  </div>
              </div>
            </div>
          </div>
          <div class="modal fade" id="7" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <center>Welcome to Tigermeals Delivery! Here are some tips on navigating our site.</center>
                </div>
                <div class = "modal-body">
                    Once you are on the view cart page, you can update your quantities by clicking the quantities bar, or remove an item from your cart by pressing the red delete button.
                </div>
                <br>
                <img class ="d-block mx-auto mb-4" src='https://res.cloudinary.com/djclzxoun/image/upload/v1544943573/FullCartPage.png' width="500" height="250">
                  <div class="modal-footer">
                    <button type="button" data-toggle="modal" data-target="#6" data-dismiss="modal"> Previous Tip</button>
                    <button type="button" data-toggle="modal" data-target="#8" data-dismiss="modal"> Next Tip</button>
                  </div>
              </div>
            </div>
          </div>
          <div class="modal fade" id="8" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <center>Welcome to Tigermeals Delivery! Here are some tips on navigating our site.</center>
                </div>
                <div class = "modal-body">
                    Once you have added all the meal packages you would like to order in your cart, you can navigate to the checkout page by clicking the green checkout button. You can also click the view cart drop down and click on "checkout".
                </div>
                  <div class="modal-footer">
                    <button type="button" data-toggle="modal" data-target="#7" data-dismiss="modal"> Previous Tip</button>
                    <button type="button" data-toggle="modal" data-target="#10" data-dismiss="modal"> Next Tip</button>
                  </div>
              </div>
            </div>
          </div>
          <div class="modal fade" id="10" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <center>Welcome to Tigermeals Delivery! Here are some tips on navigating our site.</center>
                </div>
                <div class = "modal-body">
                    One the checkout page, you can either choose to pay with card or cash by clicking the approriate tab. Remember to fill out a date and time before proceed with your payment. Note that you will only be charged when the restaurant approves your order.
                </div>
                <br>
                <img class ="d-block mx-auto mb-4" src='https://res.cloudinary.com/djclzxoun/image/upload/v1544946007/CheckoutForm.png' width="500" height="300">
                  <div class="modal-footer">
                    <button type="button" data-toggle="modal" data-target="#8" data-dismiss="modal"> Previous Tip</button>
                    <button type="button" data-toggle="modal" data-target="#11" data-dismiss="modal"> Next Tip</button>
                  </div>
              </div>
            </div>
          </div>
          <div class="modal fade" id="11" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <center>Welcome to Tigermeals Delivery! Here are some tips on navigating our site.</center>
                </div>
                <div class = "modal-body">
                    If you want to view your pending orders or update your profile, click the "Account" tab on the navbar. You can also use this to logout of your session whenever you wish.
                </div>
                <br>
                <img class ="d-block mx-auto mb-4" src='https://res.cloudinary.com/djclzxoun/image/upload/v1544946581/MyAccount.png' width="300" height="300">
                  <div class="modal-footer">
                    <button type="button" data-toggle="modal" data-target="#10" data-dismiss="modal"> Previous Tip</button>
                    <button type="button" data-toggle="modal" data-target="#12" data-dismiss="modal"> Next Tip</button>
                  </div>
              </div>
            </div>
          </div>
          <div class="modal fade" id="12" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <center>Welcome to Tigermeals Delivery! Here are some tips on navigating our site.</center>
                </div>
                <div class = "modal-body">
                    From here, you can edit your profile information, and update a new profile picture for your account. If you have specific dietary restrictions, list these here. Alternate between tabs to view your pending order, orders to be delivered, and your order history.
                </div>
                <br>

                  <div class="modal-footer">
                    <button type="button" data-toggle="modal" data-target="#11" data-dismiss="modal"> Previous Tip</button>
                    <button type="button" data-toggle="modal" data-target="#13" data-dismiss="modal"> Next Tip</button>
                  </div>
              </div>
            </div>
          </div>
          <div class="modal fade" id="13" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <center>Welcome to Tigermeals Delivery! Here are some tips on navigating our site.</center>
                </div>
                <div class = "modal-body">
                    You've reached the end of our tutorial! We hope you found this helpful. You are ready to start ordering!
                </div>
                <br>

                  <div class="modal-footer">
                    <button type="button" data-toggle="modal" data-target="#12" data-dismiss="modal"> Previous Tip</button>
                    <button type="button" data-toggle="modal" data-dismiss="modal">End Tutorial</button>
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

            	  <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                  <div class="panel panel-default">
              		  <div class="panel-heading p-3 mb-3" role="tab" id="heading1">
              			<h5 class="panel-title mb-0">
              			  <a class="collapsed" role="button" title="" data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="true" aria-controls="collapse1">
              				When do I get charged for my order?
              			  </a>
              			</h5>
              		  </div>
              		  <div id="collapse1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading1">
              			<div class="panel-body px-3 mb-4">
              			  <p>You only get charged for your order once the restaurant approves it.</p>
              			</div>
              		  </div>
              		</div>


                  <div class="panel panel-default">
              		  <div class="panel-heading p-3 mb-3" role="tab" id="heading2">
              			<h5 class="panel-title mb-0">
              			  <a class="collapsed" role="button" title="" data-toggle="collapse" data-parent="#accordion" href="#collapse2" aria-expanded="true" aria-controls="collapse2">
              				How do I check the status of my order?
              			  </a>
              			</h5>
              		  </div>
              		  <div id="collapse2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading2">
              			<div class="panel-body px-3 mb-4">
              			  <p>Under <a href="/account" class="text-danger">My Account</a>, you can check your order status under the tab <bold>"My Pending Orders."</bold></p>
              			</div>
              		  </div>
              		</div>


                  <div class="panel panel-default">
              		  <div class="panel-heading p-3 mb-3" role="tab" id="heading3">
              			<h5 class="panel-title mb-0">
              			  <a class="collapsed" role="button" title="" data-toggle="collapse" data-parent="#accordion" href="#collapse3" aria-expanded="true" aria-controls="collapse3">
              				How long does it take for a restaurant to approve my order?
              			  </a>
              			</h5>
              		  </div>
              		  <div id="collapse3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading3">
              			<div class="panel-body px-3 mb-4">
              			  <p>A restaurant will have 48 hours to approve your order. If the order is not approved by then, the order will automatically be cancelled.</p>
              			</div>
              		  </div>
              		</div>


              		<div class="panel panel-default">
              		  <div class="panel-heading p-3 mb-3" role="tab" id="heading4">
              			<h5 class="panel-title mb-0">
              			  <a class="collapsed" role="button" title="" data-toggle="collapse" data-parent="#accordion" href="#collapse4" aria-expanded="true" aria-controls="collapse4">
              				Can I order from more than one restaurant?
              			  </a>
              			</h5>
              		  </div>
              		  <div id="collapse4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading4">
              			<div class="panel-body px-3 mb-4">
              			  <p>No, you can only order from one restaurant at a time to ensure that payment goes through properly.</p>
              			</div>
              		  </div>
              		</div>

                  <div class="panel panel-default">
              		  <div class="panel-heading p-3 mb-3" role="tab" id="heading5">
              			<h5 class="panel-title mb-0">
              			  <a class="collapsed" role="button" title="" data-toggle="collapse" data-parent="#accordion" href="#collapse5" aria-expanded="true" aria-controls="collapse5">
              				Can I modify my order once I've submitted it?
              			  </a>
              			</h5>
              		  </div>
              		  <div id="collapse5" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading5">
              			<div class="panel-body px-3 mb-4">
              			  <p>No, you unfortunately cannot modify your order. We recommend calling the restaurant directly to make the necessary modifications or to cancel the order and place a new one.</p>
              			</div>
              		  </div>
              		</div>

                  <div class="panel panel-default">
              		  <div class="panel-heading p-3 mb-3" role="tab" id="heading6">
              			<h5 class="panel-title mb-0">
              			  <a class="collapsed" role="button" title="" data-toggle="collapse" data-parent="#accordion" href="#collapse6" aria-expanded="true" aria-controls="collapse6">
              				Can I cancel a pending order?
              			  </a>
              			</h5>
              		  </div>
              		  <div id="collapse6" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading6">
              			<div class="panel-body px-3 mb-4">
              			  <p>To cancel a pending order, please contact the restaurant directly.</p>
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

    <div class="conatiner">
      <div class="row px-5 mt-1 mb-3 justify-content-center">
        <p>Questions? Contact us at <a href="mailto:tigermealsdelivery@gmail.com">tigermealsdelivery@gmail.com</a>.</p>
      </div>
    </div>


  </div>
  <!----------------------------------------------------------------------------------------------------------->


  <!----------------------------------------------------------------------------------------------------------->
    <footer class="py-4 red-bar">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; TigerMeals Delivery 2018</p>
      </div>
      <!-- /.container -->
    </footer>


    <!-- Bootstrap core JavaScript -->
    <script src="static/vendor/jquery/jquery.min.js"></script>
    <script src="static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    {% include 'handle_toggle.tpl' %}

    <!-- Plugin JavaScript -->
    <script src="static/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="static/vendor/scrollreveal/scrollreveal.min.js"></script>
    <script src="static/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="js/creative.min.js"></script>

  </body>

</html>
