# frozen_string_literal: true

# Migration to add column in Bugs
class ChangesToBugs < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :id, :primary_key
  end
end
