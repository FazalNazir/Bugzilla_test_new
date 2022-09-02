# frozen_string_literal: true

# Bug model class
class Bug < ApplicationRecord
  has_one_attached :image
  validates :image, size: { less_than: 5.megabytes, message: 'is too large' }, content_type: %i[png jpg jpeg]
  self.inheritance_column = :_type_disabled
  belongs_to :solver, class_name: 'Developer'
  belongs_to :creator, class_name: 'QualityAssurance'
  belongs_to :proj, class_name: 'Project'

  enum type: { Feature: 1, Bug: 2 }
  enum status: { New: 1, Started: 2, Completed: 3, Resolved: 4 }
  validates :title, presence: true
  validates :title, length: { maximum: 60,
                              too_long: '%<count>s characters is the maximum allowed' }
  validates :status, presence: true
  validates :type, presence: true
end
