# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
    confirmed_at { 1.day.ago }
  end
  factory :Manager, parent: :user, class: 'Manager'
  factory :Developer, parent: :user, class: 'Developer'
  factory :QualityAssurance, parent: :user, class: 'QualityAssurance'
end
