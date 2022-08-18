# frozen_string_literal: true

class Developer < User
  has_many :bugs, inverse_of: :solver, foreign_key: :solver_id, dependent: :nullify
end
