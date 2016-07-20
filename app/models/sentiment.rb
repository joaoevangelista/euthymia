# frozen_string_literal: true
# :nodoc:
class Sentiment < ApplicationRecord
  belongs_to :entry
  belongs_to :user

  def self.most_recent(entry, user)
    where(entry: entry, user: user).order(updated_at: :desc).first
  end
end
