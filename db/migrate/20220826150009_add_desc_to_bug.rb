# frozen_string_literal: true

# Migration to add column in bugs
class AddDescToBug < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :description, :string
  end
end
