# frozen_string_literal: true
json.array!(@journals) do |journal|
  json.extract! journal, :id, :title, :user_id
  json.url journal_url(journal, format: :json)
end
