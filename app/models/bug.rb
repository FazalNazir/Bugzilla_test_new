# frozen_string_literal: true

# Bug model class
class Bug < ApplicationRecord
  has_one_attached :image
  validates :image, size: { less_than: 5.megabytes, message: 'is too large' }, content_type: %i[png jpg jpeg]
  self.inheritance_column = :_type_disabled
  belongs_to :solver, class_name: 'Developer', presence: true
  belongs_to :creator, class_name: 'QualityAssurance', presence: true
  belongs_to :proj, class_name: 'Project', presence: true

  enum type: { Feature: 1, Bug: 2 }
  enum status: { New: 1, Started: 2, Completed: 3, Resolved: 4 }
  validates :title, presence: { message: 'Title is required' }
  validates :title, length: { maximum: 60,
                              too_long: '%<count>s characters is the maximum allowed' }
  validates :status, presence: { message: 'Status is compulsory' }
  validates :type, presence: { message: 'Type is compulsory' }
end
