# frozen_string_literal: true

# Migration to create tabel Bugs
class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs, id: false, primary_key: :b_id do |t|
      t.string :b_id
      t.string :creator
      t.string :developer
      t.string :title
      t.string :deadline
      t.string :type
      t.integer :status

      t.timestamps
    end
  end
end
