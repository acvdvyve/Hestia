// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require_tree ./global
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets

//= require owl.carousel.min.js
$('.navbar-lower').affix({
  offset: {top: 50}
});

$(document).ready(function() {
$('.owl-carousel').owlCarousel({
loop:true,
margin:10,
autoplay:true,
nav:true,
autoHeight:true,
responsive:{
0:{
items:1
},
768:{
items:1
},
1200:{
items:1
}
}
})
});
