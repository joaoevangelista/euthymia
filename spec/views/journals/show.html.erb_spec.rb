require 'rails_helper'

RSpec.describe "journals/show", type: :view do
  before(:each) do
    @journal = FactoryGirl.create(:journal, user: FactoryGirl.create(:user))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/My precious confessions/)
    expect(rendered).to match(//)
  end
end
