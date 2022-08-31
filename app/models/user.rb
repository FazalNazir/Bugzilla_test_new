# frozen_string_literal: true

class User < ApplicationRecord
  has_and_belongs_to_many :projects, dependent: :destroy
  enum type: { Manager: 1, Developer: 2, QualityAssurance: 3 }

  # validates :name, :email, :password, presence: true
  # validates_format_of :email, with: /\A([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i
end
