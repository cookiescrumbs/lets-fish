
function addWeatherToPage(html){
  var weatherElement = $('#weather-forecast');
  weatherElement.html(html);
}

function weather(lat, lng, timeStamp) {
  console.log({
    'lat': lat,
    'lng': lng,
    'timeStamp': timeStamp
  });
  $.ajax({
    type: 'GET',
    url: '/weather/historic',
    data:{
      'lat': lat,
      'lng': lng,
      'timestamp': timeStamp
    },
    contentType: "application/json; charset=utf-8",
    dataType: "json",
    success: function(data) {
      addWeatherToPage(data.html_forecast)
    },
    failure: function(errMsg) {
      alert(errMsg);
    }
  });

}


function previewUploadedPhoto(file) {
  var photoPreview = document.getElementById('photo');
  photoPreview .src = URL.createObjectURL(file);
}

function onChange(event) {
  var file = event.target.files[0];
  previewUploadedPhoto(file);
  exifr.parse(file).then(function(exif) {
    var lat = exif.latitude;
    var lng = exif.longitude;
    var timeStamp = Date.parse(exif.DateTimeOriginal);
    var timeStampUTX = Math.floor((timeStamp / 1000));
   
    weather(lat, lng, timeStampUTX);
    
    var ISODateTime = new Date(timeStamp).toISOString().split('.')[0].slice(0, -3);
    console.log('timestamp UTX', timeStampUTX);
    console.log('gps', exif.latitude, exif.longitude);
    console.log('datetime', exif.DateTimeOriginal);
    console.log('ISODateTime', ISODateTime);
    if (lat !== undefined && lng !== undefined) {
      $('#latitude')[0].value = lat;
      $('#longitude')[0].value = lng;
      $('#display-latitude').text(lat);
      $('#display-longitude').text(lng);
    }
    $('#post_date')[0].value = ISODateTime;
    map.setCenter(initialiseMap());
    marker.setPosition(map.getCenter());
  });
}
