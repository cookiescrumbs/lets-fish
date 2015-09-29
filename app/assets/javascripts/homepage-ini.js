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
    var autoComplete = new google.maps.places.Autocomplete(
      input,
      {
        types: ['geocode'],
        componentRestrictions: {
            country: 'uk'
        }
      }
    );

    autoComplete.addListener('place_changed', function(){

        var place = autoComplete.getPlace();

        if (place.geometry) {
          var lat = place.geometry.location.lat();
          var lng = place.geometry.location.lng();
          $('.search form .form-group').append('<input type="hidden" name="lat" value="'+lat+'">');
          $('.search form .form-group').append('<input type="hidden" name="lng" value="'+lng+'">');
        }

    });

    //validate search form
    $('form#search').submit(function() {
      var lat = $("form#search input[name='lat']");
      var lng = $("form#search input[name='lng']");
      if ((lng.length <= 0) || (lat.length <= 0)) {
        $('.alert-location').remove();
        $('header').append('<div class="alert alert-danger alert-location" role="alert"><span class="sr-only">Error:</span>Please select a location.</div>');
        return false;
      }
    });
});
