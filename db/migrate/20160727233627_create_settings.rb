class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.references :user, foreign_key: true
      t.boolean :reminder_enabled, default: false
      t.string :reminder_timer, default: 'daily'

      t.timestamps
    end
  end
end
