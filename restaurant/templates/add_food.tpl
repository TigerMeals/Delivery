<!DOCTYPE html>
<html lang="en">

{% include 'header.tpl' %}

  <body>
    <!-- Navigation -->
    <nav class="navbar red-bar navbar-expand-lg navbar-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="#">TigerMeals Delivery</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="#">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/about?id={{id}}">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/orders?id={{id}}">Orders</a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="/food/add?id={{id}}">Add Catering Item</a>
              <span class="sr-only">(current)</span>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/account?id={{id}}">My Account</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="container">
      <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="https://www.princeton.edu/~oktour/virtualtour/korean/Images/Small/Shield.gif" alt="" width="72" height="72">
        <h2>Add a new catering package</h2>
        <p class="lead">Please complete the form below to make this catering package available to users. We thank you for partnering with TigerMeals Delivery.</p>
      </div>
    </div>
    {% include "form.tpl" %}
    {% include "footer.tpl" %}
  </body>
</html>
