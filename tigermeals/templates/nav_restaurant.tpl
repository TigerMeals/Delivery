<nav class="navbar red-bar navbar-expand-lg navbar-dark fixed-top">
  <div class="container">
    <a class="navbar-brand" href="/">TigerMeals Delivery</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarResponsive">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item-bar">
          <a class="nav-link" href="/restaurant/home">Home</a>
        </li>
        <li class="nav-item-bar">
          <a class="nav-link" href="/listings">My Meals</a>
        </li>
        <li class="nav-item-bar">
          <a class="nav-link" href="/restaurant/account">My Account</a>
        </li>
        <!-- <li class="nav-item-bar">
        <div class="dropdown">
          <a class="nav-link btn-danger dropdown-toggle" href="/restaurant/account" role="button" id="logoutLink" data-toggle="dropdown"  aria-expanded="false">
            My Account
          </a>
          <div class="dropdown-menu" aria-labelledby="logoutLink">
            <a class="dropdown-item" href="/restaurant/account">My account</a>
            <a class="dropdown-item" href="/restaurant/logout">Logout</a>
          </div>
        </div>
        </li> -->
        <li class="nav-item-bar">
          <a class="nav-link" href="/orders">View Orders ({{length_orders}} Active)</a>
        </li>
        <li class="nav-item-bar">
          <a class="nav-link" href="/restaurant/logout">Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div id="wrapper">
