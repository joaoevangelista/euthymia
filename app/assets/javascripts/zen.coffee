$(document).on('turbolinks:load', () ->
    $('.zen-mode').zenForm()
    $('.open-zen').on('click', (e) ->
      $('.zen-mode').trigger('init')
    )
)
