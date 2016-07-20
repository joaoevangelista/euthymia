# frozen_string_literal: true
# :nodoc:
class IndicoEmotionJob < ApplicationJob
  queue_as :default

  def perform(entry)
    emotions = Indico.emotion(entry.body)
    Emotion.new(entry: entry, anger: emotions.anger,
                joy: emotions.joy,
                fear: emotions.fear,
                sadness: emotions.sadness,
                surprise: emotions.surprise,
                user: entry.user).save
  end
end
