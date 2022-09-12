FactoryBot.define do
  factory :project do
    title { Faker::Name.name[1...20] }
    association :creator, factory: :Manager
    association :developer, factory: :Developer
    association :tester, factory: :QualityAssurance
  end
end
