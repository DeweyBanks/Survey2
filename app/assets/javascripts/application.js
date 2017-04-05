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
//= require bootstrap-sprockets
//= require jquery_nested_form
//= require Chart.bundle
//= require chartkick
//= require_tree .


$(function(){

  $.rails.allowAction = function(link) {
    if (!link.attr('data-confirm')) {
      return true;
    }
    $.rails.showConfirmDialog(link);
    return false;
  };
  $.rails.confirmed = function(link) {
    link.removeAttr('data-confirm');
    return link.trigger('click.rails');
  };
  return $.rails.showConfirmDialog = function(link) {
    var html, message;
    message = link.attr('data-confirm');
    console.log("Message:::: ", message);
    html = "<div class=\"modal\" id=\"confirmationDialog\">\n "
    html += "<div class=\"modal-dialog\">\n"
    html += "<div class=\"modal-content\">\n"
    html += "<div class=\"modal-header\">\n"
    html += "<a class=\"close\" data-dismiss=\"modal\">×</a>\n"
    html += "<h1>" + message + "</h1>\n      </div>\n"
    html += "<div class=\"modal-footer\">\n"
    html += "<a data-dismiss=\"modal\" class=\"btn\">"
    html += (link.data('cancel'))
    html += "</a>\n  <a data-dismiss=\"modal\" "
    html += "class=\"btn btn-primary confirm\">"
    html += (link.data('ok')) + "</a>\n"
    html += "</div>\n    </div>\n  </div>\n</div>";
    $(html).modal();
    return $('#confirmationDialog .confirm').on('click', function() {
      return $.rails.confirmed(link);
    });
  };


  $('#commentForm').hide();

});

