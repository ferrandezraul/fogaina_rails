var initialize_maps = (function( ) { 
  var mapCanvas = document.getElementById('map-fogaina');
  var mapCanvas2 = document.getElementById('map-paicafe');
  var mapOptions = {
    center: new google.maps.LatLng(42.153056, 2.453890),
    zoom: 16,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  var mapOptions2 = {
    center: new google.maps.LatLng(42.146236, 2.460287),
    zoom: 18,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  var map = new google.maps.Map(mapCanvas, mapOptions)
  var map2 = new google.maps.Map(mapCanvas2, mapOptions2)
} );

$( document ).ready(function() {
  console.log( "ready!" );
  google.maps.event.addDomListener(window, 'load', initialize_maps);
});

window.onload = function () { alert("It's loaded!") }
