var mapCanvas = document.getElementById('map-fogaina');

var mapOptions = {
  center: new google.maps.LatLng(42.150494, 2.457074), 
  zoom: 15,
  mapTypeId: google.maps.MapTypeId.SATELLITE
}

var map = new google.maps.Map(mapCanvas, mapOptions)

var infoWindowObrador = new google.maps.InfoWindow({
    content: '<div id="content">'+
      '<div id="siteNotice">'+
      '</div>'+
      '<h4 id="firstHeading" class="firstHeading">Obrador La Fogaina</h4>'+
      '<div id="bodyContent">'+
      '<p>Dissabtes de 9:30h a 13:30h </br>' +
      'Mas la Plana s/n, El Mallol - Carretera del Veïnat Cirera. </br>' +
      '</div>'+
      '</div>'
  });

var infoWindowCafeteria = new google.maps.InfoWindow({
    content: '<div id="content">'+
      '<div id="siteNotice">'+
      '</div>'+
      '<h4>La Fogaina Pa i Cafè.</h4>' +
      '<div id="bodyContent">'+
      '<p>De Dimarts a Dissabte de 8:00h a 13:30h i de 16:00h a 20:00h </br>' +
      'C/ Sant Sebastià nº52, Les Preses</p>' +
      '</div>'+
      '</div>'
  });

var obradorMarker = new google.maps.Marker({
  position: {lat: 42.153162, lng: 2.453943},
  map: map,
  title: 'Obrador La Fogaina'
  //icon: image
});

var cafeteriaMarker = new google.maps.Marker({
  position: {lat: 42.146158, lng: 2.460299},
  map: map,
  title: 'Pa i Cafè La Fogaina'
  //icon: image
});

obradorMarker.addListener( 'click', function( ) {
  infoWindowObrador.open(map,obradorMarker);
});

cafeteriaMarker.addListener( 'click', function( ) {
  infoWindowCafeteria.open(map,cafeteriaMarker);
});