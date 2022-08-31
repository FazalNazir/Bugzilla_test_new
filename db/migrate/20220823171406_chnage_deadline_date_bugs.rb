# frozen_string_literal: true

# Migration to make changes to column deadline
class ChnageDeadlineDateBugs < ActiveRecord::Migration[5.2]
  def up
    change_column :bugs, :deadline, 'timestamp USING CAST(deadline AS timestamp)'
  end
end
