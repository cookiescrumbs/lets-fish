$(document).ready(function() {
    var input = document.getElementsByTagName("input")[0];
    input.addEventListener("input", function(event){
        ga('send', {
            hitType: 'search',
            eventCategory: 'search',
            eventAction: 'Searched',
            eventLabel: event.srcElement.value
        });
        console.log(event.srcElement.value);
    });
});