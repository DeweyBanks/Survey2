require 'faker'
FactoryGirl.define do
  factory :feedback do
    email { Faker::Internet.email }
    body { Faker::Lorem.sentence }
  end
end
