# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'entries/show', type: :view do
  before(:each) do
    view.extend TextHelper

    user = FactoryGirl.create(:user)
    @journal = FactoryGirl.create(:journal, user: user)
    @entry = FactoryGirl.create(:entry, journal: @journal, user: user)
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Best day ever/)
  end
end
