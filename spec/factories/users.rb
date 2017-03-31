require 'faker'
FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    username { Faker::Internet.user_name }
    password "Test1234"
    password_confirmation "Test1234"
      trait :admin do
        email ENV['ADMIN_EMAIL']
        username { Faker::Internet.user_name }
        password ENV['ADMIN_PASSWORD']
        password_confirmation ENV['ADMIN_PASSWORD']
      end
  end

end
