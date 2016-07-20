# frozen_string_literal: true
class IndicoEmotionJob < ApplicationJob
  queue_as :default

  def perform(entry)
    result = Indico.emotion(entry.body)
    Emotion.new(entry: entry,anger: result.anger,
                joy: result.joy,
                fear: result.fear,
                sadness: result.sadness,
                surprise: result.surprise,
                user: entry.user).save
  end
end
