# frozen_string_literal: true

# Migration to rename a column in users
class AddChangesInUser < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :user_type, :type
  end
end
