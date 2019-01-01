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
        $("#wrapper").toggleClass("toggled");
        if ($("#wrapper").hasClass("toggled")){
          document.cookie="toggled=true";
        } else {
          document.cookie="toggled=false";
        }
    });

  });

</script>