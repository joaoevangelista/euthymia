# frozen_string_literal: true
# :nodoc:
class Entry < ApplicationRecord
  validates :title, :body, presence: true

  belongs_to :user
  belongs_to :journal

  def self.all_by_user_and_journal(user, journal)
    return [] unless user || journal
    Entry.where(user: user, journal: journal).order(updated_at: :desc)
  end

  def self.new_for_journal(journal, user = nil)
    owner_id = user.nil? ? journal.user.id : user.id
    Entry.new(journal_id: journal.id, user_id: owner_id)
  end

  def self.find_by_user(id, journal_id, user)
    Entry.find_by(id: id, journal_id: journal_id, user_id: user.id)
  end

  def set_favorite
    update(favorite: true)
  end

  def unfavorite
    update(favorite: false)
  end
end
