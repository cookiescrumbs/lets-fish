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
    // disableSearchFormSubmit();
    var input = document.getElementById("location");
    new google.maps.places.Autocomplete(
      input,
      {
        types: ['geocode'],
        componentRestrictions: {
            country: 'uk'
        }
      }
    );
});
