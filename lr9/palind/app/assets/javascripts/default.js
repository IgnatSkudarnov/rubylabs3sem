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
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require jquery-ui/effects/effect-blind
function show_result(data){
  result = $('#result')
  result.empty()

  $('<div />', {
    class: 'p',
    text: String(data.value[0])+' palindroms were found'
  }).appendTo(result)

  var table = $('<div />', { class: 'table' })
  table.appendTo(result)

  header = $('<div />', {  class: 'row header' })
  header.appendTo(table)

  $('<div />', {
    class: 'cell',
    text: 'Number'
  }).appendTo(header)

  $('<div />', {
    class: 'cell',
    text: 'Squared number'
  }).appendTo(header)

  for (i in data.value){
    if (data.value[i] != null && i != 0){

    row = $('<div />', { class: 'row' })
    row.appendTo(table)

    $('<div />', {
      class: 'cell',
      text: String(i)
    }).appendTo(row)

    $('<div />', {
      class: 'cell',
      text: String(data.value[i])
    }).appendTo(row)
    }
  }
}
$(document).ready(function(){
  $("#palind_form").bind("ajax:success",
  function(xhr, data, status) {
    show_result(data) 
  }) 
})