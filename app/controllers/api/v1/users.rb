module API
  module V1
    class Users < Grape::API


      resource :users do
        desc 'Register a new user', entity: API::V1::Entities::User
        params do
          requires :name
          requires :email
          requires :password
        end
        post '' do
          user = User.new permitted_params.to_h
          if user.save
            status 201
            present user, with: API::V1::Entities::User
          else
            status 400
            present user.errors
          end
        end
      end

      resource :users do
        guard!
        desc 'Update your account data', entity: API::V1::Entities::User
        params do
          requires :name
          requires :email
          requires :password
        end
        put '' do
          user = current_user
          if user.update permitted_params.to_h
            status 200
            present user, with: API::V1::Entities::User
          else
            status 400
            present user.errors
          end
        end
      end

    end
  end
end
