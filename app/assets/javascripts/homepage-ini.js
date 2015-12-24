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
    disableSearchFormSubmit();
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
          $('form#search').submit();
        }

    });
    function disableSearchFormSubmit() {
      $('#search').on('keyup keypress', function(e) {
        var code = e.keyCode || e.which;
        if (code == 13) {
          e.preventDefault();
          return false;
        }
      });
    }
});
