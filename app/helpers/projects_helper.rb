# frozen_string_literal: true

module ProjectsHelper
  def options_for_user_type
    [
      %w[Manager Manager],
      %w[Developer Developer],
      %w[QualityAssurance QualityAssurance]
    ]
  end

  def my_rescue_method; end
end
