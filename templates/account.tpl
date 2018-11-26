<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="This is the page in which users will checkout after they have filled up their cart">
    <meta name="author" content="TigerMeals Delivery Team">

    <title>TigerMeals Delivery - Checkout</title>

    <!-- Bootstrap core CSS -->
    <link href="static/css/bootstrap-lux.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="static/css/shop-homepage.css" rel="stylesheet">
    <link href="static/css/boostrap-slider.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
            <li class="nav-item-bar">
              <a class="nav-link" href="http://localhost:8080/meals?id={{id}}">Meals</a>
            </li>
            <li class="nav-item-bar active">
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
                        <img src="{{food_images[i]}}" alt="" />
                        <span class="item-info">
                            <span>{{food_titles[i]}}</span>
                            <span>price: {{food_prices[i]}}</span>
                        </span>
                    </span>
                    <span class="item-right">
                        <button class="btn-sm btn-danger btn-cart fa fa-times"></button>
                    </span>
                </span>
              </li>

              <li class="divider"></li>
              <li>
                <span class="checkout-text item-right">Subtotal: {{food_subtotals[i]}}</span><br>
            {% endfor %}
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


        <div class="container emp-profile">
            <form method="post">
                <div class="py-4 row">
                    <div class="col-md-4">
                        <div class="profile-img">
                            <img id = "profile_pic" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgnTI_dxbxYhNiG78v3xUdesv39ENVZpZZWathPB9Zi9dC5xFg" alt=""/>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="profile-head">
                                    <h6 class="text-dark">
                                        <strong>Princeton University TigerMeals Account Page</strong>
                                    </h6>
                                    <hr>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-work">
                            <p>Princeton University Dining Options</p>
                            <a class="text-info" href="https://dining.princeton.edu/where-eat">Princeton Retail & Dining Halls</a><br/>
                            <a class="text-info" href="https://dining.princeton.edu/where-eat/hours-operation">Hours of Operation</a><br/>
                            <hr>
                                <p>Toggle Preferences</p>
                                <a class="text-info" href="">Email</a><br/>
                                <a class="text-info" href="">Phone</a><br/>
                                <a class="text-info" href="">Preferred Delivery Address</a><br/>
                                <a class="text-info" href="">Listed Allergies</a><br/>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Name</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>{{name}}</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>NetID</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>{{netid}}</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Email</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>{{email}}</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Phone</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>{{phone}}</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Preferred Delivery Address</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>{{address}}</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Listed Allergies</label>
                                            </div>
                                            <div class="col-md-6">
                                                <label>{{allergies}}</label>
                                            </div>
                                        </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <footer class="fixed-bottom py-4 red-bar">
          <div class="container">
            <p class="m-0 text-center text-white">Copyright &copy; TigerMeals Delivery 2018</p>
          </div>
          <!-- /.container -->
        </footer>
</body>
</html>
