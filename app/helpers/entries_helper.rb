# frozen_string_literal: true
# :nodoc:
module EntriesHelper
  def favorite(entry)
    if entry.favorite
      '<span class="star"><i class="fa fa-2x fa-star"></i></span>'.html_safe
    else
      '<span class="star"><i class="fa fa-2x fa-star-o"></i></span>'.html_safe
    end

  end
end
