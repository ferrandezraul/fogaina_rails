
$(function(){ 
  $(document).foundation();
    animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';

    animateLogoHeader();
    animateMenus();
    animateSlideShowHomePage();
    animateTitlePages();
    
    /* If body has other animations, te rsult is a bit weird */
    animateBodyPages();
    animateSideBodyPages();

    animateFooter();
} );

function animateLogoHeader(){
  animationName = 'animated fadeInLeftBig'
  $( '.logo-header').addClass(animationName).one( animationEnd, function( ){
    $(this).removeClass(animationName);
  })
}

function animateMenus(){
  // Animate the 2 top-bar-section used for the locale switch and the menu
  // When animation ends, remove it in order to avoid issues with the dropdown menus
  animationName = 'animated fadeInRight'
  $( '.top-bar-section').addClass(animationName).one( animationEnd, function( ){
    $(this).removeClass(animationName);
  })
}

function animateSlideShowHomePage(){
  // Animate orbit slide show in home page
  animationName ='animated fadeInRightBig';
  $('.orbit-container').addClass(animationName).one( animationEnd, function() {
    $(this).removeClass(animationName);
  });
}

function animateTitlePages(){
  // Animate the title of all pages
  animationName ='animated fadeInLeftBig';
  $('#body_content_title').addClass(animationName).one( animationEnd, function() {
    $(this).removeClass(animationName);
  });
}

function animateBodyPages(){
  animationName = 'animated fadeInRightBig'
  $('#body').addClass(animationName).one( animationEnd, function() {
    $(this).removeClass(animationName);
  });
}

function animateSideBodyPages(){
  animationName = 'animated fadeInLeftBig'
  $('#side_body').addClass(animationName).one( animationEnd, function() {
    $(this).removeClass(animationName);
  });
}

function animateFooter(){
  animationName = 'animated fadeInUpBig'
  $('.footer').addClass(animationName).one( animationEnd, function() {
    $(this).removeClass(animationName);
  });
}