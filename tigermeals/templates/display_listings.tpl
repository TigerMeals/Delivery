
          <tr>
            <td class="col-8" data-th="Product">
              <div class="row">
                <div class="col-sm-4 hidden-xs"><img src="{{listing.image}}" alt="..." class="img-fluid"/></div>
                <div class="col-sm-8">
                  <div class="row">
                    <h4 class="nomargin float-left">{{listing.title}}</h4>
                    <p class="float-right ml-2">{{listing.quantity_fed}} servings</p>
                  </div>
                  <div class="row">
                    <p class="nomargin float-left">{{listing.description}}</p>
                  </div>
                  <div class="row">
                    {% for a in listing.allergies %}
                      {% with allergy=a %}
                        {% include 'display_allergy.tpl' %}
                      {% endwith %}
                    {% endfor %}
                  </div>
                </div>
              </div>
            </td>
            <td class="col-2" data-th="Price">
              <!-- Code below needed to display price with 2 decimal points. -->
              $<span id="price{{listing.food_id}}"></span>
              <script>
                var val = parseFloat({{listing.price}}).toFixed(2);
                document.getElementById('price{{listing.food_id}}').innerHTML = val;
              </script>
            </td>
            <td class="col-2" class="actions" data-th="">
              <div class="row">
              <button type="button d-inline" class="close" data-toggle="modal" data-target="#modal{{listing.food_id}}" aria-label="Close">
                <i class="far fa-edit edit_icon" aria-hidden="true"></i>
              </button>
              <form method="post" action="/listings/delete/{{listing.food_id}}">
                <button type="submit" class="close pt-2 d-inline">
                  <i class="fa fa-trash" aria-hidden="true"></i>
                </button>
              </form>
            </div>
            </td>
          </tr>
