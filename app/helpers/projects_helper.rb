# frozen_string_literal: true

# Module for helper of Projects
module ProjectsHelper
  def options_for_user_type
    [
      %w[Manager Manager],
      %w[Developer Developer],
      %w[QualityAssurance QualityAssurance]
    ]
  end
end
