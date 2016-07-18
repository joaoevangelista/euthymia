FactoryGirl.define do
  factory :entry do
    user_id user
    journal_id journal
    favorite false
    title "Best day ever"
    body "Some long content"
    accomplishment ""
  end
end
