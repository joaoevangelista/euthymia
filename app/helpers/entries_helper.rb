# frozen_string_literal: true
# :nodoc:
module EntriesHelper
  def favorite(entry)
    if entry.favorite
      '<span class="heart"><i class="fa fa-3x fa-heart"></i></span>'.html_safe
    else
      '<span class="heart"><i class="fa fa-3x fa-heart-o"></i></span>'.html_safe
    end
  end

  def favorite_button(entry)
    if entry.favorite
      '<span class="heart"><i class="fa fa-3x fa-heart"></i></span>'.html_safe
    else
      '<span class="heart"><i class="fa fa-3x fa-heart-o"></i></span>'.html_safe
    end
  end

  def create_entry_nav_link(journal)
    "<li>#{link_to 'New Entry', new_journal_path, class: 'dropdown-item'}</li>".html_safe
  end
end
