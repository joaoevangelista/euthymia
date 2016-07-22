class AddEntryHeaderToEntries < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :entry_header, :string
  end
end
