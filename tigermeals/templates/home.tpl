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

    <!-- Navigation -->
    <!-- Navigation -->
    <nav class="navbar red-bar navbar-expand-lg navbar-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="/">TigerMeals Delivery</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item-bar active">
              <a class="nav-link" href="/home">Home</a>
              <span class="sr-only">(current)</span>
            </li>
            <li class="nav-item-bar">
              <a class="nav-link" href="/about">About</a>
            </li>
            <li class="nav-item-bar">
            <div class="dropdown">
              <a class="nav-link btn-danger dropdown-toggle" href="/meals" role="button" id="dropdownMenuLink" data-toggle="dropdown"  aria-expanded="false">
                Meals
              </a>

              <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                <a class="dropdown-item" href="/meals">View all Meals</a>
                <a class="dropdown-item" href="/meals/restaurant">View by Restaurant</a>
              </div>
            </div>
            </li>
            <li class="nav-item-bar">
            <div class="dropdown">
              <a class="nav-link btn-danger dropdown-toggle" href="/account" role="button" id="logoutLink" data-toggle="dropdown"  aria-expanded="false">
                My Account
              </a>

              <div class="dropdown-menu" aria-labelledby="logoutLink">
                <a class="dropdown-item" href="/account">My account</a>
                <a class="dropdown-item" href="/logout">Logout</a>
              </div>
            </div>
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
                          <form method="post"action="/cart/delete/{{food_ids[i]}}">
                            <button class="btn-sm btn-danger btn-cart fa fa-times"></button>
                          </form>
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
                    <a class="checkout-text item-left" href="/cart">View Cart</a>

                    <a class="checkout-text item-right" href="/checkout">Checkout</a>
                    <br>
                  </li>
              </ul>
            </li>
              </ul>
            </div>
          </div>
        </nav>


    <div class="container">
      <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="https://www.princeton.edu/~oktour/virtualtour/korean/Images/Small/Shield.gif" alt="" width="72" height="72">
        <h2>Welcome to TigerMeals!</h2>
      </div>


      <section class="bg-orange text-white">
        <div class="py-3">
        <img style="width:50%" class ="d-block mx-auto mb-4" src='https://i.etsystatic.com/6245917/r/il/58adec/992813431/il_570xN.992813431_dvm1.jpg'>
        </div>
    </section>


      <section id="services">
        <div class="container">
          <div class="row">
            <div class="col-lg-12 text-center">
              <h2 class="section-heading text-warning">At Your Service</h2>
              <hr class="my-4">
            </div>
          </div>
            <div class="col-lg-12 text-center">
                  <div class="card border-light h-100">
                    <a href="#" data-toggle="modal" data-target="#1"><img class="card-img-top" alt=""></a>
                    <div class="card-body">
                      <h5 class="card-title">
                        New User? Check out our website <a href="#" data-toggle="modal" data-target="#1"> tutorial</a>
                      </h5>
                      <!-- Below is needed so that the price displays with two decimal points. -->
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
                      <!--<img class ="d-block mx-auto mb-4" src='https://res.cloudinary.com/djclzxoun/image/upload/v1544946581/MyAccount.png' width="200" height="400"> -->
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
                      <!--<img class ="d-block mx-auto mb-4" src='https://res.cloudinary.com/djclzxoun/image/upload/v1544946581/MyAccount.png' width="200" height="400"> -->
                        <div class="modal-footer">
                          <button type="button" data-toggle="modal" data-target="#12" data-dismiss="modal"> Previous Tip</button>
                          <button type="button" data-toggle="modal" data-dismiss="modal">End Tutorial</button>
                        </div>
                    </div>
                  </div>
                </div>
        </div>
        <div class="container">
          <div class="row">
            <div class="col-lg-3 col-md-6 text-center">
              <div class="service-box mt-5 mx-auto">
                <i class="fas fa-4x fa-gem text-primary mb-3 sr-icon-1"></i>
                <h3 class="mb-3 text-warning">Reliable Catering</h3>
                <p class="text-muted mb-0">Our partners are well-rated by the members of the Princeton community.</p>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 text-center">
              <div class="service-box mt-5 mx-auto">
                <i class="fas fa-4x fa-paper-plane text-primary mb-3 sr-icon-2"></i>
                <h3 class="mb-3 text-warning">Delivery</h3>
                <p class="text-muted mb-0">Of course, the food is delivered.</p>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 text-center">
              <div class="service-box mt-5 mx-auto">
                <i class="fas fa-4x fa-code text-primary mb-3 sr-icon-3"></i>
                <h3 class="mb-3 text-warning">Up to Date</h3>
                <p class="text-muted mb-0">We update menus to keep things fresh.</p>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 text-center">
              <div class="service-box mt-5 mx-auto">
                <i class="fas fa-4x fa-heart text-primary mb-3 sr-icon-4"></i>
                <h3 class="mb-3 text-warning">Made with Love</h3>
                <p class="text-muted mb-0">You have to make your food with love these days!</p>
              </div>
            </div>
          </div>
        </div>
      </section>
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

    <!-- Plugin JavaScript -->
    <script src="static/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="static/vendor/scrollreveal/scrollreveal.min.js"></script>
    <script src="static/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="js/creative.min.js"></script>

  </body>

</html>
