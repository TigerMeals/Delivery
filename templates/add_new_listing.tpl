

    <div class="modal fade" id="newListing" tabindex="-1" role="dialog" aria-labelledby="newListingTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h3 class="modal-title" id="newListingTitle">Create a new listing</h3>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <form id="add_listing" action="/listings/add?id={{id}}" method="POST" class="needs-validation" enctype=multipart/form-data novalidate>
            <div class="modal-body">
              <div class="row">
                <div class="col-lg-4 col-md-4">
                  <div class="text-center">
                    <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar">
                    <br><br>
                    <h6>Upload a different photo...</h6>
                    <input type="file" class="text-center center-block file-upload" name="image" required>
                  </div><hr><br>
                </div>
                <div class="col-lg-8 col-md-8">
                  <div class="form-group">
                    <label for="title">Title</label>
                    <input type="text" class="form-control" name="title" placeholder="Panera Breakfast Bagels" required>
                    <div class="invalid-feedback">
                      This field is required.
                    </div>
                  </div>
                  <div class="form-group">
                     <label for="description">Description</label>
                     <textarea class="form-control" name="description" rows="2" placeholder="Yummy yum yum bagels." required></textarea>
                     <div class="invalid-feedback">
                       This field is required.
                     </div>
                  </div>
                  <div class="row">
                     <div class="form-group col-6">
                       <label for="price">Price ($)</label>
                       <input type="number" class="form-control" name="price" placeholder="15.00" min="0" step="0.01" required>
                       <div class="invalid-feedback">
                         This field is required.
                       </div>
                     </div>
                     <div class="form-group col-6">
                       <label for="quantity">Quantity served</label>
                       <input type="number" class="form-control" name="quantity" placeholder="30" required>
                       <div class="invalid-feedback">
                         This field is required.
                       </div>
                     </div>
                     <div class="form-group col-12">  <!-- Checkbox Group !-->
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
            </div>
          </form>
          <div class="modal-footer">
              <div class="col-2">
                <div class="text-center item-right">
                  <button class="btn btn-success" type="submit" form="add_listing">Save</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
