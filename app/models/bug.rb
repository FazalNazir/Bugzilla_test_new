# frozen_string_literal: true

class Bug < ApplicationRecord
  has_one_attached :image
  self.inheritance_column = :_type_disabled
  belongs_to :solver, class_name: 'Developer'
  belongs_to :creator, class_name: 'QualityAssurance'
  belongs_to :proj, class_name: 'Project'

  enum type: { Feature: 1, Bug: 2 }
  enum status: { New: 1, Started: 2, Completed: 3, Resolved: 4 }
  validates :title, :status, :type, presence: true
end
