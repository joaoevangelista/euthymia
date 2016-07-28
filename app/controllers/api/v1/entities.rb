module API
  module V1
    module Entities

      class Journal < Grape::Entity
        expose :id
        expose :title
        expose :created_at
        expose :updated_at

      end


    end
  end
end
