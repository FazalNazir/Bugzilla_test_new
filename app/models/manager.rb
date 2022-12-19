# frozen_string_literal: true

class Manager < User
  has_many :projects, inverse_of: :creator, foreign_key: :creator_id, dependent: :destroy
end
