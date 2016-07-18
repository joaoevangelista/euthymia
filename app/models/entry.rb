class Entry < ApplicationRecord

  validates :title, :body, presence: true


  belongs_to :user
  belongs_to :journal

  def self.new_for_journal(journal, user = nil)
      owner_id = user.nil? ? journal.user.id : user.id
      Entry.new(journal_id: journal.id, user_id: owner_id)
  end

  def self.find_by_user(id, journal_id, user)
    Entry.find_by(id: id, journal_id: journal_id, user_id: user.id)
  end
end
