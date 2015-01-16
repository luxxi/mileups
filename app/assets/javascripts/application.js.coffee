#= require jquery
#= require jquery_ujs
#= require twitter/bootstrap
#= require turbolinks
#= require_tree

logoToggle = ->
  $staticLogo = $(".navbar-brand")
  $dynamicLogo = $("#animatedBrand")

  $staticLogo.mouseenter ->
    $staticLogo.hide()
    $dynamicLogo.show()

  $dynamicLogo.mouseleave ->
    $dynamicLogo.hide()
    $staticLogo.show()

  # Needed because of an mouseleave event glitch in the above function
  $("nav > .container").mouseleave ->
    $dynamicLogo.hide()
    $staticLogo.show()

ready = ->
  logoToggle()

$(document).ready ready
# This is needed so it works with Turbolinks (see http://railscasts.com/episodes/390-turbolinks)
$(document).on "page:load", ready
