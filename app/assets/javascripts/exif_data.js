function onChange(event) {
  var file = event.target.files[0];
  exifr.parse(file).then(function(exif) {
    var lat = exif.latitude;
    var lng = exif.longitude;
    var timeStamp = Date.parse(exif.DateTimeOriginal);
    var ISODateTime = new Date(timeStamp).toISOString().split('.')[0].slice(0, -3);
    console.log('gps', exif.latitude, exif.longitude);
    console.log('datetime', exif.DateTimeOriginal);
    console.log('ISODateTime', ISODateTime);
    $('#latitude')[0].value = lat;
    $('#longitude')[0].value = lng;
    $('#post_date')[0].value = ISODateTime;
    $('#display-latitude').text(lat);
    $('#display-longitude').text(lng);
    map.setCenter(initialiseMap());
    marker.setPosition(map.getCenter());
  });
}
