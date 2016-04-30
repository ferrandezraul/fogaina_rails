
$(function(){ 
  $(document).foundation();
    fixedAnimations();
    animateMenus();
    animateSlideShowHomePage();
} );

function fixedAnimations(){
  // Animate the title of all pages
  $('#body_content_title').addClass('animated fadeInLeft');
}

function animateMenus(){
  // Animate the 2 top-bar-section used for the locale switch and the menu
  // When animation ends, remove it in order to avoid issues with the dropdown menus
  animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
  animationName = 'animated fadeInRight'
  $( '.top-bar-section').addClass(animationName).one( animationEnd, function( ){
    $(this).removeClass(animationName);
  })
}

function animateSlideShowHomePage(){
  // Animate orbit slide show in home page
  $('.orbit-container').addClass('animated fadeInRightBig');
}