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

end
