require 'faker'
FactoryGirl.define do
  factory :preference do
    company "MyString"
    email_from { Faker::Internet.email }
    default false
  end
end
