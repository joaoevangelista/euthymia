require 'rails_helper'

RSpec.describe "journals/edit", type: :view do

  before(:each) do
    @journal = FactoryGirl.create(:journal, user: FactoryGirl.create(:user))
  end

  it "renders the edit journal form" do
    render

    assert_select "form[action=?][method=?]", journal_path(@journal), "post" do

      assert_select "input#journal_title[name=?]", "journal[title]"

      assert_select "input#journal_user_id[name=?]", "journal[user_id]"
    end
  end
end
