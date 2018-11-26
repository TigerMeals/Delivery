<tr>
  <td class="col-9" data-th="Product">
    <div class="row">
      <h4 class="nomargin float-left">Order #{{order.order_id}}</h4>
    </div>
    <div class="row">
      <h5>Location: </h5>
      <p class="text-muted ml-2">{{order.location}}</p>
    </div>
    <div class="row">
      <h5>Delivery Time: </h5>
      <p class="text-muted ml-2">{{order.date}} {{order.time}}</p>
    </div>
    <div class="row">
      <h5>Catering Package(s): </h5>
    </div>
      {% for p in order.packages %}
        {% with package=p %}
          {% include 'display_package.tpl' %}
        {% endwith %}
      {% endfor %}
    </div>
  </td>
  <td class="col-2" data-th="Price">{{order.price}}</td>
  <td class="col-1" class="actions" data-th="">
    <button type="button" class="btn btn-info restuarant_list_button" data-toggle="modal" data-target="#panera">
      View order
    </button>
  </td>
</tr>
