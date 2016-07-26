# frozen_string_literal: true
# Sentiment rendering helpers
module SentimentsHelper
  def calc_sentiment(sentiment)
    return nil unless sentiment
    rate = sentiment.positivity * 100
    if rate >= 50
      :positive
    else
      :negative
    end
  end

  def render_smile(sentiment)
    status = calc_sentiment sentiment
    if status.eql? :positive
      "<span>
      #{image_tag 'sentiments/positive.svg', height: 55}
      <p class='space text-emphasis'>#{I18n.t('helpers.sentiments.positive')}</p>
      </span>".html_safe
    else
      "<span>
      #{image_tag 'sentiments/negative.svg', height: 55}
      <p class='space text-emphasis'>#{I18n.t('helpers.sentiments.negative')}</p>
      </span>".html_safe
    end
  end
end
