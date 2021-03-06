
      <!-- Modal -->
      <div class="modal fade" id="{{order.order_id}}" tabindex="-1" role="dialog" aria-labelledby="newListingTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h3 class="modal-title" id="title{{order.order_id}}">Order Number {{order.order_id}}</h3>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="row">
                <div class="col-4">
                  <h5>Delivery Time</h5>
                </div>
                <div class="col-8">
                  <p>{{order.date}}, {{order.delivery_time}}</p>
                </div>


                <div class="col-4">
                  <h5>Location</h5>
                </div>
                <div class="col-8">
                  <p>{{order.location}}</p>
                </div>


                {% if user %}
                <div class="col-4">
                  <h5>Restaurant Name</h5>
                </div>
                <div class="col-8">
                  <p>{{restaurant}}</p>
                </div>
                <div class="col-4">
                  <h5>Restaurant Email</h5>
                </div>
                <div class="col-8">
                  <p>{{email}}</p>
                </div>
                <div class="col-4">
                  <h5>Restaurant Phone Number</h5>
                </div>
                <div class="col-8">
                  <p>{{phone}}</p>
                </div>
                {% else %}
                <div class="col-4">
                  <h5>Customer Name</h5>
                </div>
                <div class="col-8">
                  <p>{{order.name}}</p>
                </div>
                <div class="col-4">
                  <h5>Email</h5>
                </div>
                <div class="col-8">
                  <p>{{order.email}}</p>
                </div>
                <div class="col-4">
                  <h5>Phone</h5>
                </div>
                <div class="col-8">
                  <p>{{order.phone}}</p>
                </div>
                {% endif %}
                <div class="col-4">
                  <h5>Delivery Instructions</h5>
                </div>
                <div class="col-8">
                  <p>{{order.delivery_instructions}}</p>
                </div>

              </div>

              <div class="row">
                <div class="col-4">
                  <h5>Items Ordered</h5>
                </div>
                <div class="col-8">
                </div>


                {% for i in order.food_items %}
                  {% with item=i %}
                    {% include 'display_ordered_item.tpl' %}
                  {% endwith %}
                {% endfor %}

              </div>


             <br>
            </div>
            <div class="modal-footer">
              <div class="row">
                {% if not user %}

                  <!-- active orders on restaurant side -->
                  {% if order.paid and not order.delivered %}
                    <form id="reject{{order.order_id}}" action="/order/deny" method="POST">
                      <input type="hidden" name="order_id" value="{{order.order_id}}">
                    </form>
                    <div class="col-6">
                      <div class="text-center item-right">
                        <a href="mailto:{{order.email}}"><button class="btn btn-info">Contact</button></a>
                      </div>
                    </div>
                    <form id="delivered{{order.order_id}}" action="/order/delivered" method="POST">
                      <input type="hidden" name="order_id" value="{{order.order_id}}">
                    </form>
                    <div class="col-6">
                      <div class="text-center item-right">
                        <button class="btn btn-success type=" type="submit" form="delivered{{order.order_id}}">Delivered</button>
                      </div>
                    </div>
                  {% endif %}
                  <!-- pending orders on restaurant side -->
                  {% if not order.paid and not order.delivered and not order.denied %}
                    <form id="reject{{order.order_id}}" action="/order/deny" method="POST">
                      <input type="hidden" name="order_id" value="{{order.order_id}}">
                    </form>
                    <div class="col-4">
                      <div class="text-center item-right">
                        <button class="btn btn-danger" type="submit" form="reject{{order.order_id}}">Reject</button>
                      </div>
                    </div>

                    <div class="col-4">
                      <div class="text-center item-right">
                        <a href="mailto:{{order.email}}"><button class="btn btn-info" >Contact</button></a>
                      </div>
                    </div>

                    <form id="approve{{order.order_id}}" action="/order/approve" method="POST">
                      <input type="hidden" name="order_id" value="{{order.order_id}}">
                    </form>
                    <div class="col-4">
                      <div class="text-center item-right">
                        <button class="btn btn-success type=" type="submit" form="approve{{order.order_id}}">Approve</button>
                      </div>
                    </div>
                    {% endif %}
                    <!-- delivered and denied orders -->
                    {% if order.paid and order.delivered and not order.denied %}
                      <div class="col-12">
                        <div class="text-center item-right">
                          <a href="mailto:{{order.email}}"><button class="btn btn-info" >Contact</button></a>
                        </div>
                      </div>
                    {% endif %}
                    <!-- delivered orders  -->
                    {% if order.paid and not order.delivered and order.denied %}
                    <div class="col-12">
                      <div class="text-center item-right">
                        <a href="mailto:{{order.email}}"><button class="btn btn-info" >Contact</button></a>
                      </div>
                    </div>
                    {% endif %}
                {% endif %}
              </div>
            </div>
          </div>
        </div>
      </div>
