/*# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
oTable = undefined
$(document).on "turbolinks:load", ->
  'use strict'
  oTable = $('#vendors').DataTable(
    'dom': '<\'hbox\'<\'col-sm-6\'l><\'col-sm-6\'f>r>t<\'hbox\'<\'col-sm-5\'i><\'col-sm-7\'p>>'
    'pagingType': 'full_numbers'
    'order': [ [
      0
      'asc'
    ] ])
  $('#nav-toggle').click (event) ->
    event.preventDefault()
    $('#nav').toggleClass 'nav-xs'
    $('.table').width $('.table').parent().width()
    return
  return

*/

var oTable;
$(document).on("turbolinks:load", function() {
  'use strict';  
  oTable = $('#vendors').DataTable({
    'dom': '<\'hbox\'<\'col-sm-6\'l><\'col-sm-6\'f>r>t<\'hbox\'<\'col-sm-5\'i><\'col-sm-7\'p>>',
    'pagingType': 'full_numbers',
    'order': [[0, 'asc']]
  });

/*  yadcf.init(oTable , [{
      column_number: 0
    }, {
      column_number: 1,
	  column_data_type: "html",
	  html_data_type: "text",
	  filter_default_label: "Select tag"
    },{
	  column_number: 2,
	  filter_type: "range_number_slider"
    }], 'footer');*/

  $('#nav-toggle').click(function(event) {
    event.preventDefault();
    $('#nav').toggleClass('nav-xs');
    $('#nav-toggle').children().each(function(){
	  $(this).toggleClass("text");
	  $(this).toggleClass("text-active");
	});
    $('.table').width($('.table').parent().width());
  });

/*$("#update1").click(function(e){
  e.preventDefault();
  h1;
});
$("#update2").click(function(e){
  e.preventDefault();
  updateHumidio2();
});
*/


});
