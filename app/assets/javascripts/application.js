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
//= require jquery_ujs
//= require moment
//= require bootstrap-datepicker/core
//= require bootstrap-datetimepicker
//= require pickers
//= require turbolinks
//= require bootstrap.min
//= require admin-lte
//= require jquery.easing
//= require_tree .


  $(function() {
    var flashCallback;
    flashCallback = function() {
        return $("#notice_wrapper’").fadeOut();
    };
    $("#notice_wrapper").bind('click', (function(_this) {
        return function(ev) {
            return $("#notice_wrapper").fadeOut();
        };
    })(this));
    return setTimeout(flashCallback, 2000);
});