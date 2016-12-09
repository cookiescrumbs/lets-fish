$(document).ready(function() {
  //Search Fishery for fishery details //////////////////////////////////
  if(typeof $('#search-details')[0] == 'undefined') {
    return;
  }

  disableFisheryFormSubmit();

  var input = $('#search-details')[0];
  var autoComplete = new google.maps.places.Autocomplete(
      input,
      {
        componentRestrictions: {
            country: 'uk'
        }
      }
  );

  autoComplete.addListener('place_changed', function(){
    var place = autoComplete.getPlace();
    window.place = place;
    var fishery;
    fishery = buildFisheryFromPlaceDetails(place);
    window.fishery = fishery;
    insertFisheryDetailsIntoForm(fishery);
  });

  function buildFisheryFromPlaceDetails(place) {
    var address;
    var fishery = {};

    if (typeof place !== 'undefined' &&  typeof place.address_components !== 'undefined' ) {
      address = buildAddress(place.address_components);
      fishery = {
        placeId: place.place_id || null,
        name: place.name || null,
        telephoneNumber: place.formatted_phone_number || null,
        website: place.website || null,
        streetNumberOrHouseName: address.streetNumberOrHouseName || null,
        street: address.street || null,
        line2: address.line2 || null,
        county: address.county || null,
        country: address.country || null,
        postcode: address.postcode || null,
        formattedAddress: place.formatted_address || null
      }
      return fishery;
    }
    return false
  }

  function buildAddress(addressComponents) {
    var address = {};
    addressComponents.forEach(function(component) {
      if(typeof component.types !== 'undefined') {
        switch (component.types[0]) {
          case 'premise':
            if(typeof address.streetNumberOrHouseName === 'undefined') {
              address.streetNumberOrHouseName = component.long_name;
            }
            break;
          case 'street_number':
            if(typeof address.streetNumberOrHouseName === 'undefined') {
              address.streetNumberOrHouseName = component.long_name;
            }
            break;
          case 'route':
            address.street = component.long_name;
            break;
          case 'locality':
            if(typeof address.line2 === 'undefined') {
                address.line2 = component.long_name;
            }
            break;
          case 'postal_town':
            if(typeof address.line2 === 'undefined') {
                address.line2 = component.long_name;
            }
            break;
          case 'administrative_area_level_2':
            address.county = component.long_name;
            break;
          case 'country':
            address.country= component.long_name
            break;
          case 'postal_code':
            address.postcode = component.long_name;
            break;
          case 'undefined':
            break;
        }
      }
    });
    return address;
  }

  function insertFisheryDetailsIntoForm(fishery) {
    $('#fishery-name').val(fishery.name);
    $('#place-id').val(fishery.placeId);
    $('#google-formatted-address').val(fishery.formattedAddress);
    $('#telephone').val(fishery.telephoneNumber);
    $('#website').val(fishery.website);
    $('#postcode').val(fishery.postcode);
    $('#street').val(fishery.street);
    $('#line2').val(fishery.line2);
    $('#region').val(fishery.county);
    $('#country').val(fishery.country);
  }

  function disableFisheryFormSubmit() {
    $('.new_fishery, .edit_fishery').on('keyup keypress', function(e) {
      var code = e.keyCode || e.which;
      if(event.target.tagName != 'TEXTAREA') {
        if (code == 13) {
          e.preventDefault();
          return false;
        }
      }
    });
  }

});
