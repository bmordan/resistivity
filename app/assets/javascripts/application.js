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
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree

jQuery(function() {
  
  jQuery('input[alt="Unlock"]').hide();
  //hover
  jQuery('#loginLock').hover(
    function(){
      jQuery('input[alt="Unlock"]').stop(true, true).show();
      jQuery('input[alt="Lock"]').stop(true, true).hide();
    },
    function(){
      jQuery('input[alt="Unlock"]').stop(true, true).hide();
      jQuery('input[alt="Lock"]').stop(true, true).show();
    }
  );
  //focus
  jQuery('#email').focus(function(){
    jQuery('input[alt="Lock"]').hide();
    jQuery('input[alt="Unlock"]').show();
  });
  jQuery('#password').focus(function(){
    jQuery('input[alt="Lock"]').hide();
    jQuery('input[alt="Unlock"]').show();
  });
  //blur
  jQuery('#email').blur(function(){
    jQuery('input[alt="Unlock"]').hide();
    jQuery('input[alt="Lock"]').show();
  });
  jQuery('#password').blur(function(){
    jQuery('input[alt="Unlock"]').hide();
    jQuery('input[alt="Lock"]').show();
  });
  
  
});