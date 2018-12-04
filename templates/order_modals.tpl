
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

                <div class="col-4">
                  <div class="text-center item-right">
                    <button class="btn btn-danger">Reject</button>
                  </div>
                </div>

                <div class="col-4">
                  <div class="text-center item-right">
                    <button class="btn btn-info">Contact</button>
                  </div>
                </div>

                <div class="col-4">
                  <div class="text-center item-right">
                    <button class="btn btn-success">Approve</button>
                  </div>
                </div>

              </div>
            </div>
          </div>
        </div>
      </div>
