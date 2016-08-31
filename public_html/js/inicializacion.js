$(document).ready(function () {
    //sidenav 
    $(".button-collapse").sideNav();
    //botones dropdown
    $(".dropdown-button").dropdown();
    //sliders
    $('.slider').slider();
    //efecto parallax
    $('.parallax-container').css({'height': '250px'});
    $('.parallax').parallax();
    //tablas mas ajustadas
    $('td').css('padding', '5px');
    //carousel de imagenes
    $('.carousel').carousel({
        dist: 0,
        padding: 5,
        height: 200
    });
    $('.modal-trigger').leanModal();


});

