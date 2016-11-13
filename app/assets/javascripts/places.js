$(document).ready(function() {

  var markers =[],
  campsites = document.getElementById('campsites'),
  food = document.getElementById('food');
  
  campsites.onclick = function(){
    var lat = map.center.lat();
    var lng = map.center.lng();
    getPlaces(lat,lng, 'campground');
  }

  food.onclick = function(){
    var lat = map.center.lat();
    var lng = map.center.lng();
    getPlaces(lat,lng, 'restaurant');
  }


  drink.onclick = function(){
    var lat = map.center.lat();
    var lng = map.center.lng();
    getPlaces(lat,lng, 'bar');
  }

  function removeAndResetMarkers() {
    for (var i = 0; i < markers.length; i++) {
      markers[i].setMap(null);
    }
    markers = [];
  }

  function addMarkers(data){
    removeAndResetMarkers();
    for (i = 0; i < data.length; i++) {
      var latLng = new google.maps.LatLng(data[i]['lat'],data[i]['lng']);
      var marker = new google.maps.Marker({
        position: latLng,
        icon: '/icons/'+ data[i]['icon'] +'.svg',
        map: map
      });
      marker.setMap(map);
      markers.push(marker);
    }
  }

  function getPlaces(lat, lng, type){
    $.ajax({
      type: 'GET',
      url: '/places',
      data:{
        'lat': lat,
        'lng': lng,
        'type': type
      },
      contentType: "application/json; charset=utf-8",
      dataType: "json",
      success: function(data) {
        addMarkers(data.markers);
      },
      failure: function(errMsg) {
          alert(errMsg);
      }
    });
  }


});
