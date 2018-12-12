

          <!-- Modal -->
          <div class="modal fade" id="modal{{listing.food_id}}" tabindex="-1" role="dialog" aria-labelledby="{{listing.food_id}}title" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h3 class="modal-title" id="{{listing.food_id}}title">Edit this listing</h3>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <form id="update_entry{{listing.food_id}}" action="/listings/update" method="POST" class="needs-validation" enctype=multipart/form-data novalidate>
                    <div class="row">
                      <div class="col-lg-4 col-md-4">
                        <div class="text-center">
                          <img src="{{listing.image}}" class="avatar img-circle img-thumbnail" alt="avatar">
                          <br><br>
                          <h6>Upload a different photo...</h6>
                          <input type="file" class="text-center center-block file-upload" name="image">
                        </div><hr><br>
                      </div>
                      <div class="col-lg-8 col-md-8">
                        <div class="form-group">
                          <label for="title">Title</label>
                          <input class="form-control" type="text" name="title" value="{{listing.title}}" required>
                          <div class="invalid-feedback">
                            This field is required.
                          </div>
                        </div>
                        <div class="form-group">
                           <label for="description">Description</label>
                           <textarea class="form-control" name="description" rows="2">{{listing.description}}</textarea>
                        </div>
                        <div class="row">
                         <div class="form-group col-6">
                           <label for="price">Price ($)</label>
                           <!-- Below needed so that price displays with 2 decimal points. -->
                           <span id="price-input{{listing.food_id}}"></span>
                           <script>
                             var val = parseFloat({{listing.price}}).toFixed(2);
                             document.getElementById('price-input{{listing.food_id}}').innerHTML = "<input type='number' class='form-control' name='price' value='" + val + "' min='0' step='0.01' required>";
                           </script>
                           <div class="invalid-feedback">
                             This field is required.
                           </div>
                         </div>
                         <div class="form-group col-6">
                           <label for="quantity">Quantity served</label>
                           <input type="number" class="form-control" name="quantity" value="{{listing.quantity_fed}}" min ="0" step="1" required>
                           <div class="invalid-feedback">
                             This field is required.
                           </div>
                         </div>
                         <div class="form-group col-12">
                           <!-- Checkbox Group !-->
                           <input type="hidden" name="food_id" value="{{listing.food_id}}">
                           <label class="control-label">Dietary Restrictions</label>
                           <div class="row">
                             <div class="col-4">
                               <div class="checkbox">
                                 <label>
                                 <input type="checkbox" name="allergens1" value="Contains dairy">
                                 Contains dairy
                                 </label>
                               </div>
                               <div class="checkbox">
                                 <label>
                                 <input type="checkbox"  name="allergens2" value="Contains meat">
                                 Contains meat
                                 </label>
                               </div>
                             </div>
                             <div class="col-4">
                               <div class="checkbox">
                                 <label>
                                 <input type="checkbox"  name="allergens3" value="Contains eggs">
                                 Contains eggs
                                 </label>
                               </div>
                               <div class="checkbox">
                               <label>
                               <input type="checkbox"  name="allergens4" value="Kosher">
                               Kosher
                               </label>
                               </div>
                             </div>
                           </div>
                         </div>
                       </div>
                     </div>
                    </div>
                  </form>
                </div>
                <div class="modal-footer">
                  <form id="toggle_active{{listing.food_id}}" action="/toggle/active" method="POST">
                    <input type="hidden" name="food_id" value="{{listing.food_id}}">
                  </form>
                  <div class="row">
                    <div class="col-10">
                      <div class="text-center item-right">
                        {% if listing.active %}
                        <button class="btn btn-danger" type="submit" form="toggle_active{{listing.food_id}}">Inactivate</button>
                        {% else %}
                        <button class="btn btn-danger" type="submit" form="toggle_active{{listing.food_id}}">Activate</button>
                        {% endif %}
                      </div>
                    </div>
                  </div>
                  <div class="col-2">
                    <div class="text-center item-right">
                      <button class="btn btn-success" type="submit" form="update_entry{{listing.food_id}}">Save</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
