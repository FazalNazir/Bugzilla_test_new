# frozen_string_literal: true

class Assignment < ApplicationRecord
  belongs_to :project
  belongs_to :user
end
