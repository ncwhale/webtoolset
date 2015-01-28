requirejs ['jquery', 'bootstrap','bootstrap_validator'], ($)->
  $ ()->
    $('#login-form').formValidation
      framework: 'bootstrap'
      live: 'enabled'
      submitButtons: 'button[type="submit"]'
      trigger: null
      icon:
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'

###
        valid: 'fa fa-2x fa-check-circle'
        invalid: 'fa fa-2x fa-times-circle'
        validating: 'fa fa-2x fa-star fa-spin'
        703bMc0uAbNCM0ED
###
