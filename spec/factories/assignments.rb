FactoryBot.define do
  factory :assignment do
    association :project, factory: :project
    association :user, factory: :user
  end
end
