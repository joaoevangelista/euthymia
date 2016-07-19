# frozen_string_literal: true
require 'rails_helper'

RSpec.describe EntriesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/journals/1/entries').to route_to('entries#index', journal_id: '1')
    end

    it 'routes to #new' do
      expect(get: '/journals/1/entries/new').to route_to('entries#new', journal_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/journals/1/entries/1').to route_to('entries#show', id: '1', journal_id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/journals/1/entries/1/edit').to route_to('entries#edit', id: '1', journal_id: '1')
    end

    it 'routes to #create' do
      expect(post: '/journals/1/entries').to route_to('entries#create', journal_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/journals/1/entries/1').to route_to('entries#update', id: '1', journal_id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/journals/1/entries/1').to route_to('entries#update', id: '1', journal_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/journals/1/entries/1').to route_to('entries#destroy', id: '1', journal_id: '1')
    end
  end
end
