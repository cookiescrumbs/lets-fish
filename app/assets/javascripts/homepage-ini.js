$(document).ready(function() {

      //Scrolling animation for bootstrap theme
      $('a.page-scroll').bind('click', function(event) {
          var $anchor = $(this);
          $('html, body').stop().animate({
              scrollTop: $($anchor.attr('href')).offset().top
          }, 1500, 'easeInOutExpo');
          event.preventDefault();
      });

      // Highlight the top nav as scrolling occurs
      $('body').scrollspy({
          target: '.navbar-fixed-top'
      })

      // Closes the Responsive Menu on Menu Item Click
      $('.navbar-collapse ul li a').click(function() {
          $('.navbar-toggle:visible').click();
      });
     ////////////////////////////////////////////////////////////

    //Search box //////////////////////////////////
    var input = document.getElementById("location");
    var searchBox = new google.maps.places.SearchBox(input);

    google.maps.event.addListener(searchBox, 'places_changed', function() {

        var places = searchBox.getPlaces();

        if (places.length <= 0) {
            return;
        }
        var location = places[0];
        var lat = location.geometry.location.lat();
        var lng = location.geometry.location.lng();
        $('.search form .form-group').append('<input type="hidden" name="lat" value="'+lat+'">');
        $('.search form .form-group').append('<input type="hidden" name="lng" value="'+lng+'">');
    });

    // function getLngLatForLocation(location) {
    //   return [location.geometry.location.lng(), location.geometry.location.lat()];
    // }
    ////////////////////////////////////////////

    /////Hide / show fishery form/////////////////
    $('div.row.fishery-name').hide();
    $('#yes').click(function () {
        $('#fishery-question').hide();
        $('#fishery-question').hide();
        $('div.row.fishery-name').fadeIn();
    });
    ///////////////////////////////////////////////
});
