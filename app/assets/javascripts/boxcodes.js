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
  if($('body').hasClass('boxcodes')){

  $('#nav-toggle').click(function (event) {
    event.preventDefault();
    $('#nav').toggleClass('nav-xs');
    $('#nav-toggle').children().each(function () {
      $(this).toggleClass("text");
      $(this).toggleClass("text-active");
    });
    $('.table').width($('.table').parent().width());
  });
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
        "data": null,
        render: function (data, type, row){
          return '<span class="label label-info">'+data.code+'</span>';
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

});
