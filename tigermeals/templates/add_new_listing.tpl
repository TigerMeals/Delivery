

    <div class="modal fade" id="newListing" tabindex="-1" role="dialog" aria-labelledby="newListingTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h3 class="modal-title" id="newListingTitle">Create a new listing</h3>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <form id="add_listing" action="/listings/add" method="POST" class="needs-validation" enctype=multipart/form-data novalidate>
            <div class="modal-body">
              <div class="row">
                <div class="col-lg-4 col-md-4">
                  <div class="text-center">
                    <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar">
                    <br><br>
                    <h6>Upload a different photo...</h6>
                    <input type="file" class="text-center center-block file-upload" id="file_new_listing" name="image" required>
                    <div id = "imageError_new_listing" class="text-danger" style="visibility:hidden"> Image width and height must be at least 200 pixels!</div>
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
                         <div class="col-6 col-lg-4">
                           <div class="checkbox">
                             <label>
                               <input type="checkbox" name="allergens1" value="Contains dairy">
                               Contains dairy
                             </label>
                           </div>
                         </div>
                         <div class="col-6 col-lg-4">
                           <div class="checkbox">
                             <label>
                               <input type="checkbox"  name="allergens2" value="Contains meat">
                               Contains meat
                             </label>
                           </div>
                         </div>
                         <div class="col-6 col-lg-4">
                           <div class="checkbox">
                             <label>
                               <input type="checkbox"  name="allergens3" value="Contains eggs">
                               Contains eggs
                             </label>
                           </div>
                         </div>

                         <div class="col-6 col-lg-4">
                           <div class="checkbox">
                             <label>
                               <input type="checkbox"  name="allergens4" value="Kosher">
                               Kosher
                             </label>
                           </div>
                         </div>
                         <div class="col-6 col-lg-4">
                           <div class="checkbox">
                             <label>
                               <input type="checkbox"  name="allergens5" value="Vegan">
                               Vegan
                             </label>
                           </div>
                         </div>
                         <div class="col-6 col-lg-4">
                           <div class="checkbox">
                             <label>
                               <input type="checkbox"  name="allergens6" value="Vegetarian">
                               Vegetarian
                             </label>
                           </div>
                         </div>
                         <div class="col-6 col-lg-4">
                           <div class="checkbox">
                             <label>
                               <input type="checkbox"  name="allergens7" value="Dairy free">
                               Dairy free
                             </label>
                           </div>
                         </div>
                         <div class="col-6 col-lg-4">
                           <div class="checkbox">
                             <label>
                               <input type="checkbox"  name="allergens8" value="Nut free">
                               Nut free
                             </label>
                           </div>
                         </div>
                         <div class="col-6 col-lg-4">
                           <div class="checkbox">
                             <label>
                               <input type="checkbox"  name="allergens9" value="Gluten free">
                               Gluten free
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
                    <button class="btn btn-success" id="save_new_listing" type="submit" form="add_listing" disabled>Save</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <script>

        $(document).ready(function() {
           var readURL = function(input) {
               if (input.files && input.files[0]) {
                   var reader = new FileReader();
                   reader.onload = function (e) {
                       $('.avatar').attr('src', e.target.result);
                   }
                   reader.readAsDataURL(input.files[0]);
               }
           }
           $(".file-upload").on('change', function(){
               readURL(this);
           });
       });

          var _URL = window.URL || window.webkitURL;

          $("#file_new_listing").change(function(e) {
              var image, file;

              if ((file = this.files[0])) {

                  image = new Image();

                  image.onload = function() {
                    if (this.width < 200 || this.height < 200){
                      document.getElementById("imageError_new_listing").style.visibility = "visible";
                      document.getElementById("save_new_listing").disabled = true;
                    }
                    else
                    {
                      document.getElementById("imageError_new_listing").style.visibility = "hidden";
                      document.getElementById("save_new_listing").disabled = false;
                    }

                      //alert("The image width is " +this.width + " and image height is " + this.height);
                  };
                  //if (this.width >= 200 && this.height >= 200)
                  image.src = _URL.createObjectURL(file);
                }
              });

        </script>
