$(document).ready(function() {
    var input = document.getElementsByTagName("input")[0];
    input.addEventListener("input", function(event){
        ga('send', 'event', 'Search', 'full suggested search', event.srcElement.value);
        console.log(event.srcElement.value);
    });
});