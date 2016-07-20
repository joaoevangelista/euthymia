# frozen_string_literal: true
# :nodoc:
class IndicoSentimentJob < ApplicationJob
  queue_as :default

  def perform(entry)
    return unless entry
    positivity = Indico.sentiment_hq(entry.body[0...1000])
    Sentiment.new(entry: entry, user: entry.user, positivity: positivity).save
  end
end
