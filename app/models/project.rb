# frozen_string_literal: true

class Project < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :bugs, inverse_of: :proj, foreign_key: :proj_id, dependent: :destroy
  belongs_to :creator, class_name: 'User'

  # validates :title, :type, presence: true
end
