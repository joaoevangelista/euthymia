class CreateSentiments < ActiveRecord::Migration[5.0]
  def change
    create_table :sentiments do |t|
      t.references :entry, foreign_key: true
      t.float :positivity

      t.timestamps
    end
  end
end
