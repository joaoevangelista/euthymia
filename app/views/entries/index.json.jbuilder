json.array!(@entries) do |entry|
  json.extract! entry, :id, :user_id, :journal_id, :favorite, :title, :body, :accomplishment
  json.url entry_url(entry, format: :json)
end
