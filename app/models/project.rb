# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :assignments, dependent: :destroy
  has_many :users, through: :assignments
  has_many :bugs, inverse_of: :proj, foreign_key: :proj_id, dependent: :destroy
  belongs_to :creator, class_name: 'Manager'
  belongs_to :developer, class_name: 'Developer'
  belongs_to :tester, class_name: 'QualityAssurance'

  validates :title, :creator_id, :developer_id, :tester_id, presence: true
  validates :title, length: { maximum: 600,
                              too_long: '%<count>s characters is the maximum allowed' }
end
