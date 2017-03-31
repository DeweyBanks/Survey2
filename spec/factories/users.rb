require 'faker'
FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    username { Faker::Internet.user_name }
    password "Test1234"
    password_confirmation "Test1234"
  end

end
