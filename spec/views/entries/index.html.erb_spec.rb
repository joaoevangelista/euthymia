# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'entries/index', type: :view do
  before(:each) do
    user = FactoryGirl.create(:user)
    journal = FactoryGirl.create(:journal, user: user)
    @entries = [FactoryGirl.create(:entry, journal: journal, user: user),
                FactoryGirl.create(:entry, journal: journal, user: user)]
  end

  it 'renders a list of entries' do
    render
    assert_select 'tr>td', text: 'Best day ever'.to_s, count: 2
  end
end
