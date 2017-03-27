// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require jquery.flip
//= require angular
//= require app
//= require_tree .
//= require_tree ./channels

$(".card").flip({
  axis: 'y',
  trigger: 'click'
});

function pulse() {
  $(".attack-card").addClass('animated tada');
};

function shake() {
  $(".opponent-avatar").addClass('animated shake').one('webkitAnimationEnd', function() {
    $(".opponent-avatar").removeClass('animated shake');
  });
};

function red(){ 
  //i think here is where i'd add the damage thing and also change the numbers maybe
  document.getElementById("opponent-info").style.color = "red";
};


function discard() {
  $(".attack-card").addClass('animated fadeOutLeft');
};

//an if function to check if there's another card attacking if not end turn basically
function hideModal() {
  $('#myModal').modal('hide');
};


function attackAnimation() {
setTimeout(pulse, 2000);
setTimeout(shake, 3000);
setTimeout(red, 3000);
//setTimeout(discard, 4000);
setTimeout(hideModal, 6000);
};




