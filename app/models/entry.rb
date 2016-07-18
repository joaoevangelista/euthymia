class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :journal

  def self.new_for_journal(journal, user = nil)
      owner_id = user ? user.id : journal.user.id
      Entry.new(journal_id: journal.id, user_id: owner_id)
  end
end
