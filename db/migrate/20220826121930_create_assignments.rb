# frozen_string_literal: true

# Migration to create through table for Project to User relation
class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.belongs_to :user
      t.belongs_to :project
      t.timestamps
    end
  end
end
