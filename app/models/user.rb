# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :assignments, dependent: :destroy
  has_many :projects, through: :assignments
  enum type: { Manager: 1, Developer: 2, QualityAssurance: 3 }

  validates :name, :email, :password, :type, presence: true
  validates :email, format: { with: /\A([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i }
end
