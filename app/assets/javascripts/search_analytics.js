$(document).ready(function() {
    var input = document.getElementsByTagName("input")[0];
    input.addEventListener("input", function(event){
        var tracker = ga.getAll()[0].get('name');
        ga(tracker+'.send', 'event',  {
            hitType: 'search',
            eventCategory: 'search',
            eventAction: 'search',
            eventLabel: event.srcElement.value
        });
        console.log({
            hitType: 'search',
            eventCategory: 'search',
            eventAction: 'search',
            eventLabel: event.srcElement.value
        });
    });
});