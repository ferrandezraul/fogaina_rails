var mapCanvas = document.getElementById('map-fogaina');
var mapCanvas2 = document.getElementById('map-paicafe');
var mapOptions = {
  center: new google.maps.LatLng(42.153056, 2.453890),
  zoom: 16,
  mapTypeId: google.maps.MapTypeId.SATELLITE
}
var mapOptions2 = {
  center: new google.maps.LatLng(42.146236, 2.460287),
  zoom: 18,
  mapTypeId: google.maps.MapTypeId.SATELLITE
}
var map = new google.maps.Map(mapCanvas, mapOptions)
var map2 = new google.maps.Map(mapCanvas2, mapOptions2)

var obradorMarkerOnMap1 = new google.maps.Marker({
    position: {lat: 42.153056, lng: 2.453890},
    map: map,
    title: 'Obrador La Fogaina'
    //icon: image
  });

var cafeteriaMarkerOnMap1 = new google.maps.Marker({
    position: {lat: 42.146236, lng: 2.460287},
    map: map,
    title: 'Pa i Cafè La Fogaina'
    //icon: image
  });

var cafeteriaMarker = new google.maps.Marker({
    position: {lat: 42.146236, lng: 2.460287},
    map: map2,
    title: 'Pa i Cafè La Fogaina'
    //icon: image
  });