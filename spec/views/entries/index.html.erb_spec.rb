require 'rails_helper'

RSpec.describe "entries/index", type: :view do
  before(:each) do
    assign(:entries, [
      Entry.create!(
        :user => nil,
        :journal => nil,
        :favorite => false,
        :title => "Title",
        :body => "MyText",
        :accomplishment => "Accomplishment"
      ),
      Entry.create!(
        :user => nil,
        :journal => nil,
        :favorite => false,
        :title => "Title",
        :body => "MyText",
        :accomplishment => "Accomplishment"
      )
    ])
  end

  it "renders a list of entries" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Accomplishment".to_s, :count => 2
  end
end
