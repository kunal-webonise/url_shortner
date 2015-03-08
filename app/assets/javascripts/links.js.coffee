# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#= require jquery.validate
#= require jquery.validate.additional-methods

$(document).ready ->

  s = undefined

  window.Link =
    settings:
      generateURLBtn: $("#generate_url")

    init: ->
      s = @settings
      $.validator.addMethod 'regex', ((value, element, regexp) ->
        re = new RegExp(regexp)
        @optional(element) or re.test(value)
      ), 'Please enter a valid URL (using http)'

      $('#new_link').ready ->
        $('#new_link').validate(
          rules: 'link[url]':
            required: true
            regex: '^(http|https)://[a-z0-9]+([-.]{1}[a-z0-9]+)*.[a-z]{2,5}'
          messages: 'link[url]': required: "This is required, it can't be empty")




  Link.init()
