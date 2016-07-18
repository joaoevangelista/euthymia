class Journal < ApplicationRecord
  validates :title, presence: true
  belongs_to :user

  # Fetches all journals by the given user, usually
  # the current_user of authentication
  def self.all_by_user(user)
    return [] unless user
    Journal.where(user: user)
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
end
