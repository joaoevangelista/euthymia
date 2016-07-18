FactoryGirl.define do
  # User is parameter that is passed to create method
  # Like FactoryGirl.create(:journal, user: someuserinstance)
  factory :journal do
    title "My precious confessions"
    user_id user
  end

  factory :travel_journal do
    title "Wonderful travel"
    user_id user
  end
end
