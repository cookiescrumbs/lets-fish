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
        var bounds = getBoundingBoxFromLocation(location);
        console.log(bounds);
    });

    function getBoundingBoxFromLocation(location) {
      var northEast = location.geometry.viewport.getNorthEast();
      var southWest = location.geometry.viewport.getSouthWest();
      return [southWest.lat(), southWest.lng(), northEast.lat(), northEast.lng()];
    }
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
