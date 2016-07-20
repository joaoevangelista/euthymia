# frozen_string_literal: true
json.array!(@entries) do |entry|
  json.extract! entry, :id, :user_id, :journal_id, :favorite, :title,
                :body, :accomplishment
  json.url journal_entry_url(entry.journal, entry, format: :json)
end
