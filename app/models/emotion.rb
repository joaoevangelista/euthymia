# frozen_string_literal: true
# :nodoc:
class Emotion < ApplicationRecord
  belongs_to :entry
  belongs_to :user
  
  # Find the most recent record of emotions filtering by the user
  # and correspondent entry
  def self.most_recent(entry, user)
    where(entry: entry, user: user).order(updated_at: :desc).first
  end
end
