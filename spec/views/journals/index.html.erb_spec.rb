# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'journals/index', type: :view do
  before(:each) do
    user = FactoryGirl.create(:user)
    @journals = [
      FactoryGirl.create(:journal, user: user),
      FactoryGirl.create(:journal, user: user)
    ]
  end

  it 'renders a list of journals' do
    render
    assert_select 'tr>td', text: 'My precious confessions'.to_s, count: 2
  end
end
