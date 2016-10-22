$(document).ready(function() {

    $('#map-list-toggle-bar').hide();

    if($( window ).width() < 768) {
        $('#map-list-toggle-bar').show();
        $('#results-container').hide();
    }

    $('button.map').click(function(){
        $('#results-container').hide();
        $('#map').show();
    });

    $('button.list').click(function(){
        $('#map').hide();
        $('#results-container').show();
    });
});