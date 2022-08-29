# frozen_string_literal: true

# Migration to rename a columns in users
class AddChangesInColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :bugs, :integer, :status
    rename_column :bugs, :string, :type
  end
end
