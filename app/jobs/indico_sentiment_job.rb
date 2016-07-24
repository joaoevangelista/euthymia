# frozen_string_literal: true
# :nodoc:
class IndicoSentimentJob < ApplicationJob
  queue_as :default

  def perform(entry)
    return unless entry
    positivity = Indico.sentiment_hq(entry.body[0...1000])
    sentiment = Sentiment.find_by entry: entry
    sentiment_hash = { entry: entry, user: entry.user, positivity: positivity }
    if sentiment
      sentiment.update(sentiment_hash)
    else
      Sentiment.new(sentiment_hash).save
    end
  end
end
