// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery.lazyload
//= require_tree .
//= require foundation
//= require turbolinks


$(document).foundation();

$(document).on('turbolinks:load', function() {
  $(document).foundation();
});

$(document).on('page:load', function() {
  $(document).foundation();
});


$('.bread-image-wrapper').children('img').lazyload();
$('.slidehome').children('img').lazyload();
$('.slideworkers').children('img').lazyload();


