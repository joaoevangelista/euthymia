# frozen_string_literal: true
# :nodoc:
module ApplicationHelper
  def update_time_of(entity)
    return '' unless entity || entity.updated_at
    entity.updated_at.strftime('%b %d, %Y - %H:%M')
  end
end
