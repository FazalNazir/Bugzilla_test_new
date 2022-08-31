# frozen_string_literal: true

class ChnageStatusTypeBugs < ActiveRecord::Migration[5.2]
  def up
    change_column :bugs, :status, 'integer USING CAST(status AS integer)'
  end
end
