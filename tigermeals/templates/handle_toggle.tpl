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
  } else {
    $("#wrapper").removeClass("toggled");
  }

  $(function(){
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        e.stopPropagation();
        $("#navbarResponsive").toggleClass("show");
        $("#wrapper").toggleClass("toggled");
        if ($("#wrapper").hasClass("toggled")){
          document.cookie="toggled=true;path=/;";
        } else {
          document.cookie="toggled=false;path=/;";
        }
    });
  });

  $(function() {
    $("body").click(function(e) {
       if($(window).width()<=992){
        if (!$(e.target).closest('#sidebar-wrapper').length) {
          if ($("#wrapper").hasClass("toggled")){
            e.stopPropagation();
            $("#wrapper").toggleClass("toggled");
            document.cookie="toggled=false;path=/;";
          }
        }
      }
    });
  });

</script>
