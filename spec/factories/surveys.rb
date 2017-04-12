require 'faker'

FactoryGirl.define do
  factory :survey do
    title { Faker::Lorem.sentence }
    factory :survey_with_answers do

      transient do
        answers_count 2
      end

      after :build do |survey, evaluator|
        survey.answers << FactoryGirl.build_list(:answer, evaluator.answers_count, survey: nil)
      end

    end
  end

  factory :answer do
    body { Faker::Lorem.sentence }
    survey
  end


end


