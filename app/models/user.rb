# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :assignments, dependent: :destroy
  has_many :projects, through: :assignments
  enum type: { Manager: 1, Developer: 2, QualityAssurance: 3 }

  validates :name, :email, :password, presence: true
  validates :email, format: { with: /\A([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i }
  validates :name, length: { maximum: 50,
                             too_long: '%<count>s characters is the maximum allowed' }
  scope :dev_only, -> { where(type: 'Developer') }
  scope :qa_only, -> { where(type: 'QualityAssurance') }
end
