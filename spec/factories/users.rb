# frozen_string_literal: true
FactoryGirl.define do
  factory :user do
    name 'User'
    sequence(:email) { |n| "user_#{n}@somewhere.com" }
    password '123456'
  end
end
