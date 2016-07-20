# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'journals/new', type: :view do
  before(:each) do
    user = FactoryGirl.create(:user)
    @journal = Journal.new_for_user user
  end

  it 'renders new journal form' do
    render

    assert_select 'form[action=?][method=?]', journals_path, 'post' do
      assert_select 'input#journal_title[name=?]', 'journal[title]'

      assert_select 'input#journal_user_id[name=?]', 'journal[user_id]'
    end
  end
end
