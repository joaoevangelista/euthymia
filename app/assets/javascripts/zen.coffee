$(document).on('turbolinks:load', () ->
    $('.zen-mode').zenForm({theme: 'light'})
    $('.open-zen').on('click', (e) ->
      $('.zen-mode').trigger('init')
    )
)
