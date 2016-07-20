class AddUserToEmotion < ActiveRecord::Migration[5.0]
  def change
    add_reference :emotions, :user, foreign_key: true
  end
end
