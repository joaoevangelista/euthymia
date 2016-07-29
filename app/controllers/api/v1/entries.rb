module API
  module V1
    class Entries < Grape::API
      include API::V1::Defaults
      include Guard

      before do
        guard!
      end

      resource 'journals/:journal_id/entries' do
        desc 'Return all entries of the given journal', entity: API::V1::Entities::Entry
        get '' do
          present Entry.all, with: API::V1::Entities::Entry
        end
      end
    end
  end
end

