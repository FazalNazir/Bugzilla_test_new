# frozen_string_literal: true

# Migration to add unique index to title
class AddIndexesToTitleBugs < ActiveRecord::Migration[5.2]
  def change
    add_index :projects, :title, unique: true
  end
end
