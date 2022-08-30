# frozen_string_literal: true

class Bug < ApplicationRecord
  has_one_attached :image
  validates :image, file_size: { less_than_or_equal_to: 300.kilobytes },
                    file_content_type: { allow: ['image/jpeg', 'image/png'] }
  self.inheritance_column = :_type_disabled
  belongs_to :solver, class_name: 'Developer'
  belongs_to :creator, class_name: 'QualityAssurance'
  belongs_to :proj, class_name: 'Project'

  enum type: { Feature: 1, Bug: 2 }
  enum status: { New: 1, Started: 2, Completed: 3, Resolved: 4 }
  validates :title, presence: { message: 'Title is required' }
  validates :title, length: { maximum: 600,
                              too_long: '%<count>s characters is the maximum allowed' }
  validates :status, presence: { message: 'Status is compulsory' }
  validates :type, presence: { message: 'Type is compulsory' }
end
