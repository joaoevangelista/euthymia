# frozen_string_literal: true
# General text manipulation
module TextHelper
  # Parse the input as Markdown using Redcarpet
  def markdown(text)
    return '' unless text
    renderer = Redcarpet::Render::HTML
    markdown = Redcarpet::Markdown.new(renderer, autolink: true, tables: true)
    markdown.render text
  end
end
