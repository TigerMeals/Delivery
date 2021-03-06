<div class="col-lg-4 col-md-6 mb-4">
  <div class="card border-light h-100">
    <a href="#" data-toggle="modal" data-target="#{{meal.food_id}}"><img class="card-img-top" src="{{meal.image}}" alt=""></a>
    <div class="card-body">
      <!-- <h4 class="card-title">
        <a href="#">Soft Taco Party Platter</a>
      </h4>
      <h5>Tacoria | <p class="text-success">$64.99</p></h5>
      <h6>40 servings</h6> -->
      <h5 class="card-title">
        <a href="#" data-toggle="modal" data-target="#{{meal.food_id}}">{{meal.title}}</a>
      </h5>
      <!-- Below is needed so that the price displays with two decimal points. -->
      <h6>$<span id="price{{meal.food_id}}"></span> | {{meal.quantity_fed}} servings</h6>
      <script>
        var val = parseFloat({{meal.price}}).toFixed(2);
        document.getElementById('price{{meal.food_id}}').innerHTML = val;
      </script>
      <p>{{meal.restaurant}}</p>
    </div>
  </div>
</div>

<div class="modal fade" id="{{meal.food_id}}" tabindex="-1" role="dialog" aria-labelledby="{{meal.food_id}}_title" aria-hidden="true">

  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="{{meal.food_id}}_title">{{meal.title}}</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-lg-6 col-md-6">
            <h4 class="h4-responsive">
              <span class="green-text">
                <strong>$<span id="modal_price{{meal.food_id}}"></span></strong>
                <script>
                  var val = parseFloat({{meal.price}}).toFixed(2);
                  document.getElementById('modal_price{{meal.food_id}}').innerHTML = val;
                </script>
              </span>
              <span class="grey-text">
                <small>
                  {{meal.quantity_fed}} servings
                </small>
              </span>
            </h4>

            <a href="#">{{meal.description}}</a>
            <br><br>
            Dietary restrictions:
            <br>
            {% for a in meal.allergies %}
              {% with allergy=a %}
                {% include 'display_allergy.tpl' %}
              {% endwith %}
            {% endfor %}
            <div class="form-group">
              <label for="customization">Comments:</label>
              <textarea class="form-control" id="customization" rows="1"></textarea>
            </div>
          </div>

          <div class="col-lg-6 col-md-6">
            <img class="d-block w-100" src="{{meal.image}}"
              alt="First slide">
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <!-- <div class="row"> -->
          <input type="hidden" id="food_id" name="food_id" value="{{meal.food_id}}"></input>
        <div class="col-lg-3 col-md-3">
          <script>
          function update_quantity{{meal.food_id}}() {
            var s = document.getElementById('quantity{{meal.food_id}}');
            var quantity = s.options[s.selectedIndex].value;
            var subtotal = quantity * parseFloat({{meal.price}});
            var val = parseFloat(subtotal).toFixed(2);
            document.getElementById('subtotal{{meal.food_id}}').innerHTML = val;
          }
          </script>
          <select onchange="update_quantity{{meal.food_id}}()" id="quantity{{meal.food_id}}" form="add_to_cart{{meal.food_id}}" class="form-control item-left" formid="quantity" name="quantity" size="0">
              <option value="01">1</option>
              <option value="02">2</option>
              <option value="03">3</option>
              <option value="04">4</option>
              <option value="05">5</option>
              <option value="06">6</option>
              <option value="07">7</option>
              <option value="08">8</option>
              <option value="09">9</option>
              <option value="10">10</option>
            </select>
            <label>Select quantity</label>
          </div>
          <div class="col-md-3" align="right">
            <p class="strong"> Subtotal:
            $<span class="text-success" id="subtotal{{meal.food_id}}"></span></p>
          </div>
          <script>
            var val = parseFloat({{meal.price}}).toFixed(2);
            document.getElementById('subtotal{{meal.food_id}}').innerHTML = val;
          </script>


          <div class="modal-add-to-cart">
            <div class="text-center item-right">
              <button class="btn btn-success">Add to cart
                <i class="fa fa-shopping-cart ml-2" aria-hidden="true"></i>
              </button>
            </div>
          </div>
      </div>
    </div>
  </div>
</div>
