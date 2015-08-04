$(document).ready(function() {
    var latLng;
    var marker;

    function addAndOpenInfoWindow(map, marker, content){
        var infowindow = new google.maps.InfoWindow({
            content: content
        });
        infowindow.open(map, marker);
    }

    function updateMarkerPosition(latLng) {
      var lat = latLng.lat();
      var lng = latLng.lng();
      document.getElementById('latitude').value = lat;
      document.getElementById('longitude').value = lng;
      $('#display-latitude').text(lat);
      $('#display-longitude').text(lng);
    }

    //wait till map has loaded and add a draggable marker
    google.maps.event.addListenerOnce(map,'idle', function(){
        marker = new google.maps.Marker({
          position: map.getCenter(),
          map: map,
          draggable: true
        });
        addAndOpenInfoWindow(
          map,
          marker,
          content = "Drag and drop this marker onto the water you'd like to add."
        );
      //Add listener to update lat / lng marker details on the form
       google.maps.event.addListener(marker, 'drag', function() {
          updateMarkerPosition(marker.getPosition());
        });
    });

});
