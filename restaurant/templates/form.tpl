<div class="col-md-8">
  <h4 class="mb-3">Catering Package Details</h4>
  <form class="needs-validation" action="/food/upload?id={{id}}" method="POST" novalidate>
    <div class="row">
      <div class="col-md-8 mb-3">
        <label for="title">Package Name</label>
        <input type="text" class="form-control" id="title" placeholder="" name="title" value="" required>
        <div class="invalid-feedback">
          Valid package name is required.
        </div>
      </div>
      <div class="col-md-4 mb-3">
        <label for="price">Price</label>
        <input type="text" name="price" class="form-control" id="price" placeholder="" value="" required>
        <div class="invalid-feedback">
          Valid price is required.
        </div>
      </div>
    </div>

    <div class="mb-3">
      <label for="description">Description</label>
      <div class="input-group">
        <input type="text" class="form-control" id="description" name="description" placeholder="Please enter the quantity of each food item users can expect from this package." required>
        <div class="invalid-feedback" style="width: 100%;">
          Valid description is required.
        </div>
      </div>
    </div>

    <div class="row">

      <div class="col-md-4 mb-3">
        <label for="quantityFed">Quantity Fed</label>
        <input type="text" class="form-control" id="quantity_fed" name="quantity_fed" placeholder="" value="" required>
        <div class="invalid-feedback">
          Valid quantityFed is required.
        </div>
      </div>
    </div>

    <hr class="mb-4">
    <p><button class="btn btn-primary btn-lg btn-block" type="submit">Upload Details</button></p>
  </form>
</div>
