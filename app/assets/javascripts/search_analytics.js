$(document).ready(function() {
    var input = document.getElementsByTagName("input")[0];
    input.addEventListener("input", function(event){
        gtag('event', 'search', {'search_term': event.srcElement.value });
    });
});