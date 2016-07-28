# frozen_string_literal: true
module API
  module V1
    class Journals < Grape::API
      include API::V1::Defaults

      before do
        doorkeeper_authorize!
      end

      resource :journals do

        desc 'Return all journals of the given user',
              entity: API::V1::Entities::Journal
        get '', root: :journals do
          present Journal.all, with: API::V1::Entities::Journal
        end

        desc 'Return single journal', entity: API::V1::Entities::Journal
        params do
          requires :id, type: Integer
        end
        get ':id' do
          present Journal.find(params[:id]), with: API::V1::Entities::Journal
        end

        desc 'Create a journal', entity: API::V1::Entities::Journal
        params do
          requires :title, type: String, desc: 'Title of this journal'
        end

        post '' do
          journal = Journal.new(permitted_params.to_h)
          journal.user = current_user
          if journal.save
            status 201
            present journal, with:  API::V1::Entities::Journal
          else
            status 400
            present journal.errors
          end
        end

        desc 'Updates a journal', entity: API::V1::Entities::Journal
        params do
          requires :title, type: String, desc: 'New title for the given journal'
          requires :id, type: Integer, desc: 'Reference for this journal'
        end

        put ':id' do
          journal = Journal.find(params[:id])
          if journal.update(permitted_params.to_h)
            status 200
            present journal, with: API::V1::Entities::Journal
          else
            status 400
            present journal.errors
          end
        end

        desc 'Destroy the given journal', entity: API::V1::Entities::Journal
        delete ':id' do
          if Journal.where(user: current_user, id: params[:id]).try{|j| j.destroy}
            status 204
          else
            status 400
          end
        end
      end
      # end class
    end
  end
end
