module API
  module V1
    class Search < Grape::API
      include API::V1::Defaults
      include Guard

      before do
        guard!
      end

      search = '/search'

      resource search do
        desc 'Search on your entries', entity: API::V1::Entities::Entry
        params do
          optional :q, type: String
        end
        get '' do
          query = params[:q] || ''
          results = Entry.search query.parameterize, current_user
          present results, with: API::V1::Entities::Entry
        end
      end


    end
  end
end
