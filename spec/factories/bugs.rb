# frozen_string_literal: true

FactoryBot.define do
  factory :bug do
    title { Faker::Name.name[1...35] }
    type { %w[Feature Bug].sample }
    status { %w[New Started Completed Resolved].sample }
    link_to_default_image = 'app/assets/images/bug.jpg'
    image { Rack::Test::UploadedFile.new link_to_default_image, 'files/jpg' }
    association :solver, factory: :Developer
    association :creator, factory: :QualityAssurance
    association :proj, factory: :project
  end
end
