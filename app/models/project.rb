# frozen_string_literal: true

class Project < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :bugs, inverse_of: :proj, foreign_key: :proj_id, dependent: :destroy
  belongs_to :creator, class_name: 'Manager'

  validates :title, :creator_id, :developer_id, :tester_id, presence: true
  validates :title, uniqueness: true
end
