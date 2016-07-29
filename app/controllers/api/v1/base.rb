# frozen_string_literal: true
require 'grape-swagger'
module API
  module V1
    class Base < Grape::API
      mount API::V1::Journals
      add_swagger_documentation
    end
  end
end
