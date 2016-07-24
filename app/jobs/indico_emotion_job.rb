# frozen_string_literal: true
# :nodoc:
class IndicoEmotionJob < ApplicationJob
  queue_as :default

  def perform(entry)
    emotions = Indico.emotion(entry.body)
    emotion = Emotion.find_by entry: entry
    emotions_hash = {
      entry: entry,
      anger: emotions['anger'],
      joy: emotions['joy'],
      fear: emotions['fear'],
      sadness: emotions['sadness'],
      surprise: emotions['surprise'],
      user: entry.user
    }
    if emotion
      emotion.update(emotions_hash)
    else
      Emotion.new(emotions_hash).save!
    end
  end
end
