$(document).ready(function() {
    //Search box //////////////////////////////////
    var input = document.getElementById("location");
    new google.maps.places.Autocomplete(
      input,
      {
        componentRestrictions: {
            country: 'uk'
        }
      }
    );
});