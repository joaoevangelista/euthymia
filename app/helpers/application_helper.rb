# frozen_string_literal: true
# :nodoc:
module ApplicationHelper
  def update_time_of(entity)
    return '' unless entity || entity.updated_at
    entity.updated_at.strftime('%b %d, %Y - %H:%M')
  end

  def created_time_of(entity)
    return '' unless entity || entity.created_at
    entity.created_at.strftime('%b %d, %Y - %H:%M')
  end

  def short_text(text)
    return '' unless text
    if text.length > 140
      text[0...140].concat('...')
    else
      text
    end
  end

  def gravatar(email, size = 25)
    # Render a gravatar url based on the user's email
    def gravatar(email, size = 50)
      hash = Digest::MD5::hexdigest email
      "https://gravatar.com/avatar/#{hash}.png?s=#{size}"
    end
  end
end
