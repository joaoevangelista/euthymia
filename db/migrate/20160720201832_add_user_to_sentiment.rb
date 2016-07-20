class AddUserToSentiment < ActiveRecord::Migration[5.0]
  def change
    add_reference :sentiments, :user, foreign_key: true
  end
end
