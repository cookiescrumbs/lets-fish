$(document).ready(function() {

    $('input.photo-id').blur(function() {
      var id = this.value || null;
      if(!id) return;
      var attributionField = $(this).siblings('input.att')[0];
      var attributionExample = $(this).siblings('div.attribution-example')[0];
      getAndSetAttribution(id, attributionField, attributionExample);
    });

    function getAndSetAttribution(id, attributionField, attributionExample){
        $.ajax({
          type: 'GET',
          url: '/image/attribution',
          data:{
            'id': id
          },
          contentType: 'application/json; charset=utf-8',
          dataType: 'json',
          success: function(data) {
            attributionField.value = JSON.stringify(data);
            $(attributionExample).html( '<strong>Attribution from Geograph:</strong> Image &copy; Copyright <a href="'+ data.profile_url+'">'+data.name+'</a> and licensed for reuse under this <a href="'+data.licence+'">Creative Commons Licence</a> <a href="'+data.photo_url+'">More information about this image at Geograph</a>.');
          },
          failure: function(errMsg) {
            alert(errMsg);
          }
        });
    }

})