# frozen_string_literal: true

class QualityAssurance < User
  has_many :bugs, inverse_of: :creator, foreign_key: :creator_id, dependent: :nullify
end
