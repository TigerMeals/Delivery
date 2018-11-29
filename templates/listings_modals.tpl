

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
                  <div class="row">
                    <div class="col-lg-4 col-md-4">
                      <img class="d-block w-100" src="{{listing.image}}"
                        alt="First slide">
                    </div>
                    <div class="col-lg-8 col-md-8">
                      <form id="update_entry{{listing.food_id}}" action="/listings/update?id={{id}}" method="POST" class="needs-validation" novalidate>
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
                           <input type="number" class="form-control" name="price" value="{{listing.price}}" required>
                           <div class="invalid-feedback">
                             This field is required.
                           </div>
                         </div>
                         <div class="form-group col-6">
                           <label for="quantity">Quantity served</label>
                           <input type="number" class="form-control" name="quantity" value="{{listing.quantity_fed}}" required>
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
                   </form>
                  </div>
                </div>
                <div class="modal-footer">
                  <div class="row">
                    <div class="col-10">
                      <div class="text-center item-right">
                        <button class="btn btn-danger">Cancel</button>
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
