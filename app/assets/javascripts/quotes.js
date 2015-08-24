// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function(){
  $.fn.datepicker.defaults.format = "dd/mm/yyyy";

  $('.datepicker-dob').datepicker({
    defaultViewDate: {year: 1997},
    startView: "decade"
  });

  $('.datepicker-start').datepicker({
    defaultViewDate: '+7d',
    startDate: "today"
  });

  $('.datepicker-end').datepicker({
    defaultViewDate: '+21d',
    startDate: "today"
  });

  var formID = "#" + $('form').attr("id");
  var formPath = $('form').attr("action");

  $(formID).submit(function( event ){
    event.preventDefault;

    var dob = $('.datepicker-dob').datepicker('getDate');
    var dobParamsString = "dob(1i):" + dob.getFullYear() + ", dob(2i):" + dob.getMonth() + ", dob(3i):" + dob.getDate() ;

    var start = $('.datepicker-start').datepicker('getDate');
    var startParamsString = "trip_start(1i):" + start.getFullYear() + ", trip_start(2i):" + start.getMonth() + ", trip_start(3i):" + start.getDate() ;

    var end = $('.datepicker-end').datepicker('getDate');
    var endParamsString = "trip_end(1i):" + end.getFullYear() + ", trip_end(2i):" + end.getMonth() + ", trip_end(3i):" + end.getDate() ;

    var params = dobParamsString + ", " + startParamsString + ", " + endParamsString;

    if (formPath == "new_quote") {
      $.post('/quotes/create', params);
    } else {
      $.post('/quotes/edit', params);
    };
    $(formID).unbind('submit')
  });
});
