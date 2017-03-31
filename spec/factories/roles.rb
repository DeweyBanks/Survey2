FactoryGirl.define do
  factory :role do
     trait :admin do
        name "Admin"
      end
      trait :user do
        name "User"
      end
  end
end
