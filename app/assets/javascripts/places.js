$(document).ready(function(){

  var markers =[],
  infoWindow = new google.maps.InfoWindow(),
  campsites = document.getElementById('campsites'),
  food = document.getElementById('food'),
  accommodation = document.getElementById('accommodation'),
  drink = document.getElementById('drink');
  
  campsites.onclick = function(){
    placesByType('campground');
  }

  food.onclick = function(){
    placesByType('restaurant');
  }

  drink.onclick = function(){
    placesByType('bar');
  }

  accommodation.onclick = function(){
    placesByType('lodging');
  }

  function removeAndResetMarkers() {
    for (var i = 0; i < markers.length; i++) {
      markers[i].setMap(null);
    }
    markers = [];
  }

  function placesByType(type) {
    getPlaces(
      map.center.lat(),
      map.center.lng(), 
      type, 
      map.getZoom()
    );
  }
    
  function addMarkers(data){
    removeAndResetMarkers();
    for (i = 0; i < data.length; i++) {
      
      var latLng = new google.maps.LatLng(data[i]['lat'],data[i]['lng']);
      
      var marker = new google.maps.Marker({
        position: latLng,
        icon: '/icons/'+ data[i]['icon'] +'.svg',
        id: data[i]['id'],
        map: map
      });

      google.maps.event.addListener(marker, 'click', function() {
        infoWindow.setContent('...');
        getInfoWindow(this.id);
        infoWindow.open(map, this);
      });

      markers.push(marker);
    }
  }

  function getPlaces(lat, lng, type, zoom){
    $.ajax({
      type: 'GET',
      url: '/places',
      data:{
        'lat': lat,
        'lng': lng,
        'type': type,
        'zoom': zoom
      },
      contentType: "application/json; charset=utf-8",
      dataType: "json",
      success: function(data){
        addMarkers(data.markers);
      },
      failure: function(errMsg){
        alert(errMsg);
      }
    });
  }

  function getInfoWindow(id){
    $.ajax({
      type: 'GET',
      url: '/places/info-window',
      data:{
        'id': id
      },
      contentType: "application/json; charset=utf-8",
      dataType: "json",
      success: function(data){
        infoWindow.setContent(data.infoWindow);
      },
      failure: function(errMsg){
          alert(errMsg);
      }
    });
  }


});
