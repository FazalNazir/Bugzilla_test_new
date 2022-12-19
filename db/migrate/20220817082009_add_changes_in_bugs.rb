# frozen_string_literal: true

# Migration to rename columns in bugs
class AddChangesInBugs < ActiveRecord::Migration[5.2]
  def change
    rename_column :bugs, :type, :integer
    rename_column :bugs, :status, :string
  end
end
