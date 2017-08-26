$(document).on 'ready turbolinks:load', ->
  $('.batch-selects .batch-select').hide()
  $('.batch-selects a').hide()

  $('input[name="ids"]').on 'change', ->
    $('.js-toggle-all').prop('checked', $('input[name="ids"]:checked').length == $('input[name="ids"]').length)

    unless $(this).prop('checked')
      $('.js-toggle-all').prop('checked', false)

  $('.js-toggle-all'). on 'change', ->
    table = $(this).parents('table')
    checkboxes = table.find('input[name="ids"]')

    $('.js-toggle-all').prop('checked', $(this).prop('checked'))
    checkboxes.prop('checked', $(this).prop('checked'))

$(document).on 'click', '.js-batch-actions a, .batch-selects a', (e) ->
  e.preventDefault()

  action = $(this).data('action')
  option = null

  if $(this).hasClass('js-batch-submit')
    select = $('.batch-selects .batch-select:visible select')

    action = select.attr('name')
    option = select.val()

    $('.batch-selects .batch-select').hide()
    $('.batch-selects a').hide()
  else
    $('.batch-selects .batch-select').hide()
    $('.batch-selects a').hide()

    if select = $('.batch-selects').find('select[name="' + action + '"]')
      if select.length > 0
        el = select.parents('.batch-select')
        el.show()
        $('.batch-selects a').show()
        return true

  ids = $('input[name="ids"]:checked').map ->
    return $(this).val()
  .get()

  $.post $('.js-batch-actions').data('url'), {
    batch_action: action,
    ids: ids
    option: option
  }, ->
    Turbolinks.visit(location.href, { scroll: false })