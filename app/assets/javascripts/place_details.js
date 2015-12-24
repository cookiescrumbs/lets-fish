$(document).ready(function() {
  //Search box //////////////////////////////////
  var input = $('#search-details')[0];
  var autoComplete = new google.maps.places.Autocomplete(
    input,
    {
      types: ['establishment'],
      componentRestrictions: {
          country: 'uk'
      }
    }
  );

  autoComplete.addListener('place_changed', function(){
    var place = autoComplete.getPlace();
    window.place = place;
    if (typeof place !== 'undefined') {
        var address = buildAddress(place.address_components);
        var fishery = {
          name: place.name || null,
          telephoneNumber: place.formatted_phone_number || null,
          website: place.website || null,
          postcode: address.postcode || null,
          street: address.street || null,
          lineTwo: address.lineTwo || null,
          county: address.county || null,
          country: address.country || null
        }
        $('#fishery-name').val(fishery.name);
        $('#telephone').val(fishery.telephoneNumber);
        $('#website').val(fishery.website);
        $('#postcode').val(fishery.postcode);
        $('#street').val(fishery.street);
        $('#line2').val(fishery.lineTwo);
        $('#region').val(fishery.county);
        $('#country').val(fishery.country);
    }
  });

  function buildAddress(addressComponents) {
    var address = {};
    addressComponents.forEach(function(component) {
      if(typeof component.types !== 'undefined') {

        if (street = getAddressComponent(component, 'route')) {
            address.street = street;
        }

        if (lineTwo = getAddressComponent(component, 'locality')) {
            address.lineTwo = lineTwo;
        }

        if (county = getAddressComponent(component, 'administrative_area_level_2')) {
            address.county = county;
        }

        if (country = getAddressComponent(component, 'country')) {
            address.country = country;
        }

        if (postcode = getAddressComponent(component, 'postal_code')) {
            address.postcode = postcode;
        }
      }
    });
    return address;
  }

  function getAddressComponent(component, name) {
    if (typeof component.types[0] !== 'undefined' && component.types[0] == name ) {
        return component.long_name;
    }
    return false;
  }

});


