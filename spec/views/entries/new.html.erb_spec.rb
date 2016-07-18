require 'rails_helper'

RSpec.describe "entries/new", type: :view do
  before(:each) do
    assign(:entry, Entry.new(
      :user => nil,
      :journal => nil,
      :favorite => false,
      :title => "MyString",
      :body => "MyText",
      :accomplishment => "MyString"
    ))
  end

  it "renders new entry form" do
    render

    assert_select "form[action=?][method=?]", entries_path, "post" do

      assert_select "input#entry_user_id[name=?]", "entry[user_id]"

      assert_select "input#entry_journal_id[name=?]", "entry[journal_id]"

      assert_select "input#entry_favorite[name=?]", "entry[favorite]"

      assert_select "input#entry_title[name=?]", "entry[title]"

      assert_select "textarea#entry_body[name=?]", "entry[body]"

      assert_select "input#entry_accomplishment[name=?]", "entry[accomplishment]"
    end
  end
end
