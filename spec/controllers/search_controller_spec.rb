# frozen_string_literal: true
require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in user
  end

  describe 'GET #index' do
    it 'returns http success' do
      process :index, method: :get, params: { q: 'foo' }
      expect(response).to have_http_status(:success)
    end
  end
end
