# frozen_string_literal: true

class ChnageDeadlineDateBugs < ActiveRecord::Migration[5.2]
  def change
    change_column :bugs, :deadline, 'timestamp USING CAST(deadline AS timestamp)'
  end
end
