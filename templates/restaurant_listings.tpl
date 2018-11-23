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

    <script type="text/javascript" src="/static/js/jquery-1.10.2.min.js"></script>

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
              <a class="nav-link" href="/?id={{id}}">Home</a>
            <li class="nav-item-bar">
              <a class="nav-link" href="/about?id={{id}}">About</a>
            </li>
            <li class="nav-item-bar active">
              <a class="nav-link" href="/listings?id={{id}}">My Meals</a>
                <span class="sr-only">(current)</span>
            </li>
            <li class="nav-item-bar">
              <a class="nav-link" href="/account?id={{id}}">My Account</a>
            </li>
            <li class="nav-item-bar">
              <a class="nav-link" href="/orders?id={{id}}">View Orders (4 Active)</a>
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

      <!-- Modal -->
      <div class="modal fade" id="newListing" tabindex="-1" role="dialog" aria-labelledby="newListingTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h3 class="modal-title" id="newListingTitle">Create a new listing</h3>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="row">
                <div class="col-lg-4 col-md-4">
                  <img class="d-block w-100" src="/static/img/panera.jpg"
                    alt="First slide">
                </div>
                <div class="col-lg-8 col-md-8">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Title</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Panera Breakfast Bagels">
                  </div>
                  <div class="form-group">
                     <label for="exampleInputPassword1">Description</label>
                     <textarea class="form-control" id="exampleInputPassword1" rows="2" placeholder="Yummy yum yum bagels."></textarea>
                  </div>
                  <div class="row">
                   <div class="form-group col-6">
                     <label for="price">Price ($)</label>
                     <input type="number" class="form-control" id="price" placeholder="15.00">
                   </div>
                   <div class="form-group col-6">
                     <label for="quantity">Quantity served</label>
                     <input type="number" class="form-control" id="quantity" placeholder="30">
                   </div>
                   <div class="form-group col-12">  <!-- Checkbox Group !-->
                     <label class="control-label">Dietary Restrictions</label>
                     <div class="row">
                       <div class="col-4">
                         <div class="checkbox">
                           <label>
                           <input type="checkbox" name="allergens" value="dairy">
                           Contains dairy
                           </label>
                         </div>
                         <div class="checkbox">
                           <label>
                           <input type="checkbox"  name="allergens" value="meat">
                           Contains meat
                           </label>
                         </div>
                       </div>
                       <div class="col-4">
                         <div class="checkbox">
                           <label>
                           <input type="checkbox"  name="allergens" value="eggs">
                           Contains eggs
                           </label>
                         </div>
                         <div class="checkbox">
                           <label>
                           <input type="checkbox"  name="allergens" value="kosher">
                           Kosher
                           </label>
                         </div>
                       </div>
                       <div class="col-4">
                         <div class="checkbox">
                           <label>
                           <input type="checkbox"  name="allergens" value="eggs">
                           Contains eggs
                           </label>
                         </div>
                         <div class="checkbox">
                           <label>
                           <input type="checkbox"  name="allergens" value="kosher">
                           Kosher
                           </label>
                         </div>
                       </div>
                     </div>
                   </div>
                 </div>
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <div class="row">
                <div class="col-10">
                  <div class="text-center item-right">
                    <button class="btn btn-danger">Cancel</button>
                  </div>
                </div>
                </div>
                <div class="col-2">
                  <div class="text-center item-right">
                    <button class="btn btn-success">Save</button>
                  </div>
                </div>
            </div>
          </div>
        </div>
      </div>

      <table id="restaurantlistings" class="table table-hover table-condensed">
  				<thead>
  					<tr style="color:black;">
                <h2 class="float-left">My Active Listings</h2>
                <button type="button" class="btn btn-success float-right" data-toggle="modal" data-target="#newListing" aria-label="Close">Create a new listing</button>
  					</tr>
  				</thead>
					<tbody>
            {% for l in listings %}
              {% with listing=l %}
                {% include 'display_listings.tpl' %}
              {% endwith %}
            {% endfor %}
					</tbody>
					<tfoot>
					</tfoot>
				</table>

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
    <script src="/static/vendor/jquery/jquery.min.js"></script>
    <script src="/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
