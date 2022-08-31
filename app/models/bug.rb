# frozen_string_literal: true

class Bug < ApplicationRecord
  belongs_to :solver, class_name: 'Developer'
  belongs_to :creator, class_name: 'QualityAssurance'
  belongs_to :proj, class_name: 'Project'

  # enum :type { :Feature, :Bug }
  # validates :title, :deadline, :status, :type, presence: true
end
