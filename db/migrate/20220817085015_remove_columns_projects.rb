# frozen_string_literal: true

# Migration to remove columns from project
class RemoveColumnsProjects < ActiveRecord::Migration[5.2]
  def up
    remove_column :projects, :qa_id, :string
    remove_column :projects, :dev_id, :string
  end
end
