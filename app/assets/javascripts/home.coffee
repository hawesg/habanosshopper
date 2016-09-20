# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  updateHumidio = (uid, pid) ->
    $.ajax
      url: 'https://www.mytaglist.com/ethLogShared.asmx/GetLatestTemperatureRawDataByUUID'
      data: JSON.stringify(uuid: uid)
      success: (retval, textStatus) ->
        time = new Date(retval.d.time)
        time.setHours time.getHours() - 7
        $('#' + pid + ' .humidity').text retval.d.cap.toFixed(2)
        c = retval.d.temp_degC
        f = c * (9 / 5) + 32
        $('#' + pid + ' .temperature').text f.toFixed(2)
        $('#' + pid + ' .timeago').html '<time id="' + pid + '_time" datetime="' + time.toISOString() + '">' + time.toLocaleString() + '</time>'
        jQuery('time#' + pid + '_time').timeago()
        $('.text-success, .text-warning, .text-danger', '#' + pid).removeClass 'text-success text-warning text-danger'
        $('#' + pid + ' .wi-humidity').addClass if retval.d.cap >= 69 then 'text-danger' else if retval.d.cap >= 65 or retval.d.cap <= 59 then 'text-warning' else 'text-success'
        $('#' + pid + ' .wi-thermometer').addClass if f >= 80 then 'text-danger' else if f >= 70 or f <= 65 then 'text-warning' else 'text-success'
        return
      error: (xhr, textStatus, exception) ->
        alert textStatus
        return
    return

  if $('body').is('.home') and $('body').is('.index')
    $('#body, body').vegas
      slides: [ { src: 'images/hero-bg1.jpg' } ]
      overlay: 'images/overlays/08.png'
    $.ajaxSetup
      type: 'POST'
      contentType: 'application/json; charset=utf-8'
      cache: false
      dataType: 'json'
      xhrFields: withCredentials: true
    $('.humidiopanel').powerTimer
      intervalAfter: 60 * 1000
      func: ->
        updateHumidio $(this).data('uuid'), $(this).attr('id')
        return
  return
