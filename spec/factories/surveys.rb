require 'faker'

FactoryGirl.define do

  # answer factory with a `belongs_to` association for the survey
  factory :answer do
    body { Faker::Lorem.sentence }
    survey
  end


  # survey factory without associated answers
  factory :survey do
    title { Faker::Lorem.sentence }

    # survey_with_answers will create answer data after the survey has been created
    factory :survey_with_answers do
      # answers_count is declared as a transient attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      transient do
        answers_count 5
      end

      # the after(:create) yields two values; the survey instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the survey is associated properly to the answer
      after(:create) do |survey, evaluator|
        create_list(:answer, evaluator.answers_count, survey: survey)
      end

    end
  end
end
