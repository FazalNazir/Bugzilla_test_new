# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :assignments, dependent: :destroy
  has_many :users, through: :assignments
  has_many :bugs, inverse_of: :proj, foreign_key: :proj_id, dependent: :destroy
  belongs_to :creator, class_name: 'Manager'
  belongs_to :developer, class_name: 'Developer'
  belongs_to :tester, class_name: 'QualityAssurance'

  validates :title, length: { maximum: 60,
                              too_long: '%<count>s characters is the maximum allowed' }
  validates :developer_id, presence: true
  validates :tester_id, presence: true
  validates :creator_id, presence: true
end
