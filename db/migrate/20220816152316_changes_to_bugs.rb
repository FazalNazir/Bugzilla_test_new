# frozen_string_literal: true

class ChangesToBugs < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :id, :primary_key
  end
end
