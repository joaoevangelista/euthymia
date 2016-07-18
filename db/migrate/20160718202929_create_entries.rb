class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.references :user, foreign_key: true
      t.references :journal, foreign_key: true
      t.boolean :favorite
      t.string :title
      t.text :body
      t.string :accomplishment

      t.timestamps
    end
  end
end
