# frozen_string_literal: true

# Migration to add column in Users
class ChangesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :id, :primary_key
  end
end
