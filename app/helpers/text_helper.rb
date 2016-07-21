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

  # Parse unicodes and names to images tags using gemojione gem
  def emojione(text_input)
    replaced_unicodes = Gemojione.replace_unicode_moji_with_images(text_input)
    Gemojione.replace_named_moji_with_images(replaced_unicodes)
  end
end
