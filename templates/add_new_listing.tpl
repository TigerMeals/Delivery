<!-- Modal -->
<div class="modal fade" id="newListing" tabindex="-1" role="dialog" aria-labelledby="newListingTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="newListingTitle">Create a new listing</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-lg-4 col-md-4">
            <img class="d-block w-100" src="/static/img/panera.jpg"
              alt="First slide">
          </div>
          <div class="col-lg-8 col-md-8">

            <form id="add_listing" action="/listings/add?id={{id}}" method="POST">
              <div class="form-group">
                <label for="exampleInputEmail1">Title</label>
                <input type="text" class="form-control" name="title" placeholder="Panera Breakfast Bagels">
              </div>
              <div class="form-group">
                 <label for="exampleInputPassword1">Description</label>
                 <textarea class="form-control" name="description" rows="2" placeholder="Yummy yum yum bagels."></textarea>
              </div>
              <div class="row">
               <div class="form-group col-6">
                 <label for="price">Price ($)</label>
                 <input type="number" class="form-control" name="price" placeholder="15.00">
               </div>
               <div class="form-group col-6">
                 <label for="quantity">Quantity served</label>
                 <input type="number" class="form-control" name="quantity" placeholder="30">
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
             </form>
           </div>
          </div>
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
              <button class="btn btn-success" type="submit" form="add_listing">Save</button>
            </div>
          </div>
      </div>
    </div>
  </div>
</div>
