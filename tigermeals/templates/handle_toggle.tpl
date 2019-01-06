<script>
  function getCookie(name){
    var pattern = RegExp(name + "=.[^;]*")
    matched = document.cookie.match(pattern)
    if(matched){
        var cookie = matched[0].split('=')
        return cookie[1]
    }
    return false
  }
  if (getCookie("toggled") == "true") {
    $("#wrapper").addClass("toggled");
    if($(window).width()<768){
     $("#backgroundCart").addClass("smallDisplay");
    }
  } else {
    $("#wrapper").removeClass("toggled");
  }

  $(function(){
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        e.stopPropagation();
        if($(window).width()<768){
         $("#backgroundCart").addClass("smallDisplay");
       }
        if ($("#navbarResponsive").hasClass("show")) {
          $("#navbarResponsive").removeClass("show");
        }
        $("#wrapper").toggleClass("toggled");
        if ($("#wrapper").hasClass("toggled")){
          document.cookie="toggled=true;path=/;";
        } else {
          document.cookie="toggled=false;path=/;";
        }
    });
  });

  $(function(){
    $(window).resize(function(e) {
       if($(window).width()<768){
        $("#overlay").html("").html("</div>");
        if ($("#wrapper").hasClass("toggled")) {
          $("#backgroundCart").addClass("smallDisplay");
        }
      } else {
          $("#overlay").html("");
          $("#backgroundCart").removeClass("smallDisplay");
        }
      });
    });

  $(function() {
    $("body").click(function(e) {
        if (!$(e.target).closest('#sidebar-wrapper').length) {
           $("#backgroundCart").removeClass("smallDisplay");
          if ($("#wrapper").hasClass("toggled")){
            e.stopPropagation();
            $("#wrapper").toggleClass("toggled");
            document.cookie="toggled=false;path=/;";
          }
        }
    });
  });

</script>
