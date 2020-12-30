$(document).ready(function() {
  var map,
  mapElement = document.getElementById('location-map'),
  lat = getLat(),
  lng = getLng(),
  zoom = getZoom(),
  annotation = getAnnotation(),
  marker,
  mapOptions = {
    scrollwheel: false,
    streetViewControl: false,
    zoomControl: true,
    mapTypeControlOptions: {
      mapTypeIds: [
        google.maps.MapTypeId.HYBRID,
        google.maps.MapTypeId.SATELLITE,
        google.maps.MapTypeId.ROADMAP
      ]
    },
    mapTypeId: google.maps.MapTypeId.HYBRID
  };
  ////////Map
  //make a new instance of google maps
  map = new google.maps.Map(mapElement, mapOptions);
  map.setCenter({lat: lat , lng: lng});
  map.setZoom(zoom);
  //////////////////////////////////////////////////////

  ////////Annotation stuff ///////////////////////////////////////////////////////////////////////
  map.data.setStyle({
    strokeColor: '#FF4500'
  });

  function loadDataLayer(data, map) {
    if (Object.keys(data).length === 0 &&  data.constructor === Object) {
      return;
    }
    map.data.addGeoJson(data);
  }

  loadDataLayer(annotation, map);
  ////////////////////////////////////////////////////////////////////////////////////////////////////

  //wait till map has loaded and add a  marker
  google.maps.event.addListenerOnce(map,'idle', function(){
      new google.maps.Marker({
        position: new google.maps.LatLng(lat,lng),
        map: map
      });
  });

  function getLat() {
    return parseFloat(mapElement.dataset.lat) || null;
  }

  function getLng() {
    return parseFloat(mapElement.dataset.lng) || null;
  }

  function getZoom() {
    return  parseInt(mapElement.dataset.zoom) || 9;
  }

  function getAnnotation() {
    return JSON.parse(mapElement.dataset.annotation || "{}");
  }

});
