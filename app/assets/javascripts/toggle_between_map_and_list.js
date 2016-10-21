$(document).ready(function() {

    $('#result-container').hide();

    $('button.map').click(function(){
        $('#results-container').hide();
        $('#map').show();
    });

    $('button.list').click(function(){
        $('#map').hide();
        $('#results-container').show();
    });
});