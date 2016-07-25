# frozen_string_literal: true
# :nodoc:
module EntriesHelper
  def favorite(entry)
    if entry.favorite
      "<span class='heart'>#{mdi('heart', '', class: 'mdi-2x')}</i></span>".html_safe
    else
      "<span class='heart'>#{mdi('heart', '', class: 'mdi-2x')}</i></span>".html_safe
    end
  end

  def favorite_button(entry)
    if entry.favorite
      "<span class='heart'>
      #{link_to mdi('heart', '', class: 'mdi-2x'),
                favorite_journal_entry_path(entry.journal, entry),
                method: :delete, class: 'heart'}
      </span>".html_safe
    else
      "<span class='heart'>
      #{link_to mdi('heart-outline', '', class: 'mdi-2x'),
                favorite_journal_entry_path(entry.journal, entry),
                method: :put, class: 'heart'}
      </span>".html_safe
    end
  end
end
