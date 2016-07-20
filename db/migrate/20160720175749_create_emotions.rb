class CreateEmotions < ActiveRecord::Migration[5.0]
  def change
    create_table :emotions do |t|
      t.references :entry, foreign_key: true
      t.float :anger
      t.float :joy
      t.float :fear
      t.float :sadness
      t.float :surprise

      t.timestamps
    end
  end
end
