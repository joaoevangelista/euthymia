module API
  module V1
    module Entities

      class Journal < Grape::Entity
        expose :id
        expose :title
        expose :created_at
        expose :updated_at
        expose :user_id
      end

      class Entry < Grape::Entity
        expose :id
        expose :title
        expose :body
        expose :accomplishment
        expose :entry_header
        expose :created_at
        expose :updated_at
      end

      class User < Grape::Entity
        expose :id
        expose :name
        expose :email
      end
    end
  end
end
