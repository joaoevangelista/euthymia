# frozen_string_literal: true
module API
  module V1
    class Journals < Grape::API
      include API::V1::Defaults

      resource :journals do
        desc 'Return all journals of the given user'
        get '', root: :journals do
          Journal.all
        end
      end






      # end class
    end
  end
end
