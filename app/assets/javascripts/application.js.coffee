
#= require jquery
#= require jquery_ujs
#= require twitter/bootstrap
#= require turbolinks
#= require_tree

# off-canvas sidebar toggle
$("[data-toggle=offcanvas]").click ->
  $(this).toggleClass "visible-xs text-center"
  $(this).find("i").toggleClass "glyphicon-chevron-right glyphicon-chevron-left"
  $(".row-offcanvas").toggleClass "active"
  $("#lg-menu").toggleClass("hidden-xs").toggleClass "visible-xs"
  $("#xs-menu").toggleClass("visible-xs").toggleClass "hidden-xs"
  $("#btnShow").toggle()
  return
