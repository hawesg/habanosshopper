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
$.extend( jQuery.fn.dataTableExt.oSort, {
    "hsprice-asc": function ( a, b ) {
      a=(a==='-')?99999:a;
      b=(b==='-')?99999:b;
      return a - b;
    },
    "hsprice-desc": function ( a, b ) {
      a=(a==='-')?0:a;
      b=(b==='-')?0:b;
    	return b - a;
    },
});

var oTable, table;
$(document).on("turbolinks:load", function () {
  'use strict';
  /* oTable = $('#vendors').DataTable({
    'dom': '<\'hbox\'<\'col-sm-6\'l><\'col-sm-6\'f>r>t<\'hbox\'<\'col-sm-5\'i><\'col-sm-7\'p>>',
    'pagingType': 'full_numbers',
    'order': [
      [0, 'asc']
    ]
  });*/

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
  if($('body').hasClass('prices')){

  $('#nav-toggle').click(function (event) {
    event.preventDefault();
    $('#nav').toggleClass('nav-xs');
    $('#nav-toggle').children().each(function () {
      $(this).toggleClass("text");
      $(this).toggleClass("text-active");
    });
    $('.table').width($('.table').parent().width());
  });
  if($('body').hasClass('index')){
    table = $('#vendorsajax').DataTable({
      'dom': '<\'hbox\'<\'col-sm-6\'l><\'col-sm-6\'f>r>t<\'hbox\'<\'col-sm-5\'i><\'col-sm-7\'p>>',
      'pagingType': 'full_numbers',
      "columns": [
      {
        "data": null,
        render: function (data, type, row) {
          return data.marca + ' <i class="fa fa-minus"></i> ' + data.vitola;
        }
      },{
        "data": null,
        render: function (data, type, row) {
          var returnString = '<span class="label label-info">'+data.boxtype+'</span>';
          returnString+=(data.tubo==true)?' <span class="label label-default">Tubo</span>':'';
          return returnString;
        }
      },{
        "data": null,
        render: function (data, type, row) {
          var inch = parseFloat(data.mm);
          inch /= 25.4;
          return Math.round(inch * 10) / 10 + '"';
        }
      },{
        "data": null,
        render: function (data, type, row) {
          return data.rg + "<small>rg</small>";
        }
      },{
        "data": null,
        render: function (data, type, row) {
          if( type === 'sort')
            return data.bsize * data.bcount * data.multiplier;
          var returnString = data.bsize;
          returnString+= (data.bcount>1)?'<i class="fa fa-times"></i>' + data.bcount:'';
          returnString+= (data.multiplier>1)?'<i class="fa fa-times"></i>' + data.multiplier:'';
          return  returnString;
        }
      },{
        "data": "prices.CigarsOfHabanos.price",
        render: function(data, type, row, meta){
          if( type === 'sort')
            return (data !== undefined)?data:"-";
          return (data !== undefined)?"$"+data:"<i class='fa fa-minus na text-danger'></i>";
        },
        "type": "hsprice"
      },{
        "data": "prices.CigarsOfHabanos.cost_per_cigar",
        render: function(data, type, row){
          if( type === 'sort')
            return (data !== undefined)?data:"-";
          return (data !== undefined)?"$"+data:"<i class='fa fa-minus na text-danger'></i>";
        },
        "type": "hsprice"
      },{
        "data": "prices.IHavanas.price",
        render: function(data, type, row){
          if( type === 'sort')
            return (data !== undefined)?data:"-";
          return (data !== undefined)?"$"+data:"<i class='fa fa-minus na text-danger'></i>";
        },
        "type": "hsprice"
      },{
        "data": "prices.IHavanas.cost_per_cigar",
        render: function(data, type, row){
          if( type === 'sort')
            return (data !== undefined)?data:"-";
          return (data !== undefined)?"$"+data:"<i class='fa fa-minus na text-danger'></i>";
        },
        "type": "hsprice"
      },{
        "data": "prices.LewisStagnetto.price",
        render: function(data, type, row){
          if( type === 'sort')
            return (data !== undefined)?data:"-";
          return (data !== undefined)?"$"+data:"<i class='fa fa-minus na text-danger'></i>";
        },
        "type": "hsprice"
      },{
        "data": "prices.LewisStagnetto.cost_per_cigar",
        render: function(data, type, row){
          if( type === 'sort')
            return (data !== undefined)?data:"-";
          return (data !== undefined)?"$"+data:"<i class='fa fa-minus na text-danger'></i>";
        },
        "type": "hsprice"
      }],
      "createdRow": function ( row, data, index ) {
        var prices = $.map(data.prices, function(value, index){
          return parseFloat(value.price);
        });
        var test = data.prices;
        var min = Array.min(prices);
        var max = Array.max(prices);
        if(test['CigarsOfHabanos']===undefined){
          $('td', row).eq(5).addClass('na');
          $('td', row).eq(6).addClass('na');
        }
        else if(test.CigarsOfHabanos.price == min){
          $('td', row).eq(5).addClass('success');
          $('td', row).eq(6).addClass('success');
        }
        else if(test.CigarsOfHabanos.price == max){
          $('td', row).eq(5).addClass('danger');
          $('td', row).eq(6).addClass('danger');
        }
        else {
          $('td', row).eq(5).addClass('warning');
          $('td', row).eq(6).addClass('warning');
        }
        if(test['IHavanas']===undefined){
          $('td', row).eq(7).addClass('na');
          $('td', row).eq(8).addClass('na');
        }
        else if(test.IHavanas.price == min){
          $('td', row).eq(7).addClass('success');
          $('td', row).eq(8).addClass('success');
        }
        else if(test.IHavanas.price == max){
          $('td', row).eq(7).addClass('danger');
          $('td', row).eq(8).addClass('danger');
        }
        else {
          $('td', row).eq(7).addClass('warning');
          $('td', row).eq(8).addClass('warning');
        }
        if(test['LewisStagnetto']===undefined){
          $('td', row).eq(9).addClass('na');
          $('td', row).eq(10).addClass('na');
        }
        else if(test.LewisStagnetto.price == min){
          $('td', row).eq(9).addClass('success');
          $('td', row).eq(10).addClass('success');
        }
        else if(test.LewisStagnetto.price == max){
          $('td', row).eq(9).addClass('danger');
          $('td', row).eq(10).addClass('danger');
        }
        else {
          $('td', row).eq(9).addClass('warning');
          $('td', row).eq(10).addClass('warning');
        }
      },
      "initComplete": function( settings, json){

      }
    });
  }
  else {
    table = $('#vendorsajax').DataTable({
      'dom': '<\'hbox\'<\'col-sm-6\'l><\'col-sm-6\'f>r>t<\'hbox\'<\'col-sm-5\'i><\'col-sm-7\'p>>',
      'pagingType': 'full_numbers',
      "columns": [
      {
        "data": null,
        render: function (data, type, row) {
          return data.marca + ' <i class="fa fa-minus"></i> ' + data.vitola;
        }
      },{
        "data": null,
        render: function (data, type, row) {
          var returnString = '<span class="label label-info">'+data.boxtype+'</span>';
          returnString+=(data.tubo==true)?' <span class="label label-default">Tubo</span>':'';
          return returnString;
        }
      },{
        "data": null,
        render: function (data, type, row) {
          var inch = parseFloat(data.mm);
          inch /= 25.4;
          return Math.round(inch * 10) / 10 + '"';
        }
      },{
        "data": null,
        render: function (data, type, row) {
          return data.rg + "<small>rg</small>";
        }
      },{
        "data": null,
        render: function (data, type, row) {
          var returnString = data.bsize;
          returnString+= (data.bcount>1)?'<i class="fa fa-times"></i>' + data.bcount:'';
          returnString+= (data.multiplier>1)?'<i class="fa fa-times"></i>' + data.multiplier:'';
          return  returnString;
        }
      },{
        "data": "price.price",
        render: function(data, type, row, meta){
          return (data !== undefined)?"$"+data:"<i class='fa fa-minus na text-danger'></i>";
        }
      },{
        "data": "price.cost_per_cigar",
        render: function(data, type, row){
          return (data !== undefined)?"$"+data:"<i class='fa fa-minus na text-danger'></i>";
        }
      }],
      "initComplete": function( settings, json){

      }
    });
  }

}

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
