# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'journals/show', type: :view do
  before(:each) do
  view.extend EmotionsHelper
  @avg_emotions = {
      joy: 0.3123,
      anger: 0,
      surprise: 0.2112,
      sadness: 0.0021,
      fear: 0.121
    }
    @journal = FactoryGirl.create(:journal, user: FactoryGirl.create(:user))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/My precious confessions/)
    expect(rendered).to match(//)
  end
end
