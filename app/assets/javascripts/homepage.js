$(document).ready(function() {

	var input = document.getElementById("location");
	var searchBox = new google.maps.places.SearchBox(input);

	google.maps.event.addListener(searchBox, 'places_changed', function() {

		var places = searchBox.getPlaces();

		if (places.length <= 0) {
			return;
		}

		// get the first selected result if there are multiple matches
		var firstResult = places[0];

		console.log(firstResult.geometry.location.lng(), firstResult.geometry.location.lat());

	});

});