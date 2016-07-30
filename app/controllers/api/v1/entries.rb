# frozen_string_literal: true
module API
  module V1
    class Entries < Grape::API
      include API::V1::Defaults
      include Guard

      before do
        guard!
      end

      journal_entries = 'journals/:journal_id/entries'

      resource journal_entries do
        desc 'Return all entries of the given journal',
             entity: API::V1::Entities::Entry
        params do
          requires :journal_id, type: Integer
        end
        get '' do
          present Entry.all_by_user_and_journal(current_user, params[:journal_id]),
                  with: API::V1::Entities::Entry
        end
      end

      resource journal_entries do
        desc 'Return a single entry of the given id',
             entity: API::V1::Entities::Entry
        params do
          requires :journal_id, type: Integer
          requires :id, type: Integer
        end
        get '/:id' do
          present Entry.find_by_user(params[:id], params[:journal_id], current_user),
                  with: API::V1::Entities::Entry
        end
      end

      resource journal_entries do
        desc 'Create a new entry on the given journal',
             entitiy: API::V1::Entities::Entry
        params do
          requires :journal_id, type: Integer
          requires :title, type: String
          requires :body, type: String
          requires :accomplishment, type: String
          requires :entry_header, type: String
        end
        post '' do
          entry = Entry.new permitted_params.to_h
          entry.user = current_user
          entry.journal = Journal.find_by_user params[:journal_id], current_user
          if entry.save
            status 201
            present entry, with: API::V1::Entities::Entry
          else
            status 400
            present entry.errors
          end
        end
      end

      resource journal_entries do
        desc 'Update an entry', entitiy: API::V1::Entities::Entry
        params do
          requires :id, type: Integer
          requires :journal_id, type: Integer
          optional :title, type: String
          optional :body, type: String
          optional :accomplishment, type: String
          optional :entry_header, type: String
        end
        put '/:id' do
          entry = Entry.find_by_user params[:id], params[:journal_id], current_user
          if entry.update(permitted_params.to_h)
            status 200
            present entry, with: API::V1::Entities::Entry
          else
            status 400
            present entry.errors
          end
        end
      end

      resource journal_entries do
        desc 'Remove an entry by the given journal and entry',
             entity: API::V1::Entities::Entry
        params do
          requires :id, type: Integer
          requires :journal_id, type: Integer
        end
        delete '/:id' do
          entry = Entry.find_by_user params[:id], params[:journal_id], current_user
          if entry
            if entry.destroy
              status 204
            else
              status 400
            end
          else
            status 404
          end
        end
      end
    end
  end
end
