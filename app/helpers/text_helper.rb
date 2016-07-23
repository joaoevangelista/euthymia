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
    replaced_unicodes = gemojione_android_support text_input
    Gemojione.replace_named_moji_with_images(replaced_unicodes)
  end

  # Override the Gemojione default method implementing a different behavior
  # when rendering the img tag, since Android emoji unicode are uppercase
  # and CDN are downcase
  # Issue GL-7
  def gemojione_android_support(string)
    return string unless string
    unless string.match(Gemojione.index.unicode_moji_regex)
      return Gemojione.safe_string(string)
    end

    safe_string = Gemojione.safe_string(string.dup)
    safe_string.gsub!(Gemojione.index.unicode_moji_regex) do |moji|
      Gemojione.image_tag_for_moji(moji).downcase # downcase everything so we find
      # the correspondent unicode on cdn since Android unicodes are uppercase
    end
    safe_string = safe_string.html_safe if safe_string.respond_to?(:html_safe)

    safe_string
  end

end
