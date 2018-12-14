<div class="col-4">
  <img class="d-block w-100" src="{{item.image}}"
    alt="First slide">
</div>
<div class="col-6">
  <h6>{{item.food_title}}</h6>
  <p>{{item.food_quantity_fed}} servings</p>
  <p><span class="text-black">Quantity: </span> {{item.quantity}} </p>
  <p><span class="text-black">Customizations: </span> {{item.customization}}
  </p>

</div>
<div class="col-2">
  <p>$<span id = "{{order.order_id}}item_price{{item.food_id}}"></span> ea </p>
  <!-- Below needed so that price displays with 2 decimal points. -->
  <script>
    var val = parseFloat({{item.food_price}}).toFixed(2);
    document.getElementById("{{order.order_id}}item_price{{item.food_id}}").innerHTML = val;
  </script>
  <p><span class="text-black">Subtotal: </span> <span id = "{{order.order_id}}item_subtotal{{item.food_id}}"></span> </p>
  <script>
    var val = parseFloat({{item.subtotal}}).toFixed(2);
    document.getElementById("{{order.order_id}}item_subtotal{{item.food_id}}").innerHTML = val;
  </script>
</div>
