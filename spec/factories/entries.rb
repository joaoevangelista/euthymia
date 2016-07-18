FactoryGirl.define do
  factory :entry do
    user nil
    journal nil
    favorite false
    title "MyString"
    body "MyText"
    accomplishment "MyString"
  end
end
