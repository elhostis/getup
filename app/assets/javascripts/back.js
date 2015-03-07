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
//= require jquery-ui
//= require ckeditor/init
//= require twitter/bootstrap


var ready = function() {
  // To open/close modal forms
  var clickOnPopupLink = function(){
    $('body').on('click', '.static-popup-link', function(){
      id_modal = typeof $(this).data('modal') !== 'undefined' ? $(this).data('modal') : "myModal";
      $('#' + id_modal).modal('show');
    });
  }
  var clickOnCloseLink = function(){
    $('body').on('click', '.close-popup-link', function(){
      id_modal = typeof $(this).data('modal') !== 'undefined' ? $(this).data('modal') : "myModal";
      $('#' + id_modal).modal('hide');
    });
  }
  clickOnPopupLink();
  clickOnCloseLink();

  // To submit form when a filter is changed
  $('.back-filter').bind("change", function() {
    $('#form-back-filtered').submit();
  });

  // To select/unselect checkbox of a list
  $('#list_id_check_all').change(function() {
    if ($(this).is(':checked')){
      $('.list_id_id').prop('checked', true);

    }else{
      $('.list_id_id').prop('checked', false);
    }
  });
  $('.list_id_id').change(function() {
    if ($(this).is(':checked')){
      //TODO : check the main checkbox if all elements are checked
    }else{
      $('#list_id_check_all').prop('checked', false);
    }
  });

  // To make an action on all selected elements
  var make_action = function(action){
    $("#list_id_action").val(action);
    $('#form-back-list_id').submit();
  }
  $('.list_id_action').click(function() {
    if ($(this).data('action') == 'delete'){
      if (confirm($(this).data('message'))){
        make_action($(this).data('action'));
      }
    }else{
      make_action($(this).data('action'));
    }
  });

  $('.my-tooltip').tooltip();

  $("#load-preview-image").change(function(){
    readURL(this, "#preview-image");
  });

};


$(document).ready(ready);
$(document).on('page:load', ready);

// To show image preloaded
function readURL(input, preview) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $(preview).attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
  }
}
