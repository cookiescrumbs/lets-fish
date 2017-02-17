$(document).ready(function() {

    var weatherElement = $('#weather-forecast'),
    lat = getLat(),
    lng = getLng();

    function getLat() {
        return parseFloat(weatherElement[0].dataset.lat) || null;
    }

    function getLng() {
        return parseFloat(weatherElement[0].dataset.lng) || null;
    }

    function addWeatherToPage(html){
        weatherElement.html(html);
    }

    function getWeatherForLocation(lat,lng){
        $.ajax({
          type: 'GET',
          url: '/weather',
          data:{
            'lat': lat,
            'lng': lng
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

    getWeatherForLocation(lat,lng);

})
;
