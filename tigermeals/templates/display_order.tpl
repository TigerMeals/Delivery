<div class="row">
              <div class="col-10">
                <h4 class="mb-3 float-left" href="#">Order #{{order.order_id}}</h4>
              </div>
              <div class="col-2">
                <button type="button" class="btn btn-info restuarant_list_button float-right" data-toggle="modal" data-target="#{{order.order_id}}">
                  View order
                </button>
              </div>
            </div>
            <div class="card col-md-12 px-3 py-2 mb-3 border-dark">
              <div class="row">
                <div class="col-md-5 order-md-1">
                  <div class="row pl-2">
                    <h5>Delivery Time </h5>
                    <p class="text-muted">{{order.date}} {{order.delivery_time}}</p>
                  </div>
                  <div class="row pl-2">
                    <h5>Location </h5>
                    <p class="text-muted">{{order.location}}</p>
                  </div>
                  <div class="row pl-2">

                    {% if order.food_items[1] %}
                    <h5>Catering Packages Selected </h5>
                    {% endif %}

                    {% if not order.food_items[1] %}
                    <h5>Catering Package Selected </h5>
                    {% endif %}
                    
                    <ul>
                      {% for p in order.food_items %}
                        {% with package=p %}
                          {% include 'display_package.tpl' %}
                        {% endwith %}
                      {% endfor %}
                    </ul>
                  </div>
                </div>
                <div class = "col-md-5 order-md-2">
                  <div class="row pl-2">
                    <h5>Student Information </h5>
                  </div>
                  <div class="row pl-2">
                    <p class="text-muted">{{order.name}}</p>
                  </div>
                  <div class="row pl-2">
                    <p class="text-muted">{{order.email}}</p>
                  </div>
                  <div class="row pl-2">
                  <p class="text-muted">{{order.phone}}</p>
                  </div>
                </div>
                <div class = "col-md-2 order-md-3">
                  <h5 class="text-success float-right">$<span id = "price{{order.order_id}}"></span></h5>
                  <script>
                    var val = parseFloat({{order.price}}).toFixed(2);
                    document.getElementById('price{{order.order_id}}').innerHTML = val;
                  </script>
                </div>
              </div>
            </div>
