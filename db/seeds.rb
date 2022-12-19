# frozen_string_literal: true

require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
Bug.destroy_all
Project.destroy_all
User.destroy_all
n = 1
5.times do
  m = Manager.new(name: Faker::Name.name, email: "manager#{n}@gmail.com", password: '123456',
                  password_confirmation: '123456')
  d = Developer.new(name: Faker::Name.name, email: "dev#{n}@gmail.com", password: '123456',
                    password_confirmation: '123456')
  q = QualityAssurance.new(name: Faker::Name.name, email: "qa#{n}@gmail.com", password: '123456',
                           password_confirmation: '123456')
  n += 1
  m.skip_confirmation!
  m.save!
  d.skip_confirmation!
  d.save!
  q.skip_confirmation!
  q.save!
end

5.times do
  Project.create(title: Faker::Company.name, creator_id: Manager.ids.sample, developer_id: Developer.ids.sample,
                 tester_id: QualityAssurance.ids.sample)
end

15.times do
  solver_id = Developer.ids.sample
  project_id = Project.where(developer_id: solver_id).ids.sample
  Bug.create(title: Faker::Name.name, creator_id: QualityAssurance.ids.sample, solver_id: solver_id,
             proj_id: project_id, type: %w[Feature Bug].sample)
end
