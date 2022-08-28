# frozen_string_literal: true

module BugsHelper
  def options_for_bug_status
    [
      %w[New New],
      %w[Started Started],
      %w[Resolved Resolved]
    ]
  end

  def options_for_feature_status
    [
      %w[New New],
      %w[Started Started],
      %w[Completed Completed]
    ]
  end

  def options_for_type
    [%w[Feature Feature],
     %w[Bug Bug]]
  end
end
