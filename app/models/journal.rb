# frozen_string_literal: true
# A journal is a collection of entries that a user owns
class Journal < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :entries, dependent: :destroy
  has_many :emotions, through: :entries

  # Fetches all journals by the given user, usually
  # the current_user of authentication
  def self.all_by_user(user)
    return [] unless user
    Journal.where(user: user).order(updated_at: :desc)
  end

  # Create an instance of Journal bound to a user_id
  # usually the current_user of authentication
  def self.new_for_user(user)
    Journal.new(user_id: user.id)
  end

  # Fetches only one entry matching the id and the user
  def self.find_by_user(id, user)
    Journal.find_by(id: id, user: user)
  end

  def avg_emotions
    cached_emotions = emotions
    size = cached_emotions.size
    {
      joy: cached_emotions.sum(&:joy).to_f / size,
      sadness: cached_emotions.sum(&:sadness).to_f / size,
      surprise: cached_emotions.sum(&:surprise).to_f / size,
      anger: cached_emotions.sum(&:anger).to_f / size,
      fear: cached_emotions.sum(&:fear).to_f / size
    }
  end
end
