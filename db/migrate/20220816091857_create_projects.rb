# frozen_string_literal: true

# Migration to create tabel projects
class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :qa_id
      t.string :dev_id

      t.timestamps
    end
  end
end
