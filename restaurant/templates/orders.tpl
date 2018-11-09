<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>TigerMeals Delivery - Pending Orders</title>

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
    {% include 'navbar.tpl' %}
    <div class="container">
      <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="https://www.princeton.edu/~oktour/virtualtour/korean/Images/Small/Shield.gif" alt="" width="72" height="72">
        <h2>Pending orders</h2>
        <p class="lead">Please view your pending orders below. We thank you for partnering with TigerMeals Delivery.</p>
      </div>
      {% for o in orders %}
        {% with order=o %}
          {% include 'display_order.tpl'%}
        {% endwith %}
      {% endfor %}
    </div>
  {% include "footer.tpl" %}
  </body>
</html>
