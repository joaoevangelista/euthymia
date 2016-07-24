# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'entries/index', type: :view do
  before(:each) do
    view.extend TextHelper

    user = FactoryGirl.create(:user)
    @journal = FactoryGirl.create(:journal, user: user)
    @entries = [FactoryGirl.create(:entry, journal: @journal, user: user),
                FactoryGirl.create(:entry, journal: @journal, user: user)]
  end

  it 'renders a list of entries' do
    render
    expect(rendered).to match(/Best day ever/)
  end
end
