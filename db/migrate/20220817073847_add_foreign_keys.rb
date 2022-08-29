# frozen_string_literal: true

# Migration to add reference keys
class AddForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_reference :bugs, :creator, refrences: :users, index: true, foreign_key: { to_table: :users }
    add_reference :bugs, :solver, refrences: :users, index: true, foreign_key: { to_table: :users }
    add_reference :projects, :creator, refrences: :users, index: true, foreign_key: { to_table: :users }
    add_reference :projects, :developer, refrences: :users, index: true, foreign_key: { to_table: :users }
    add_reference :projects, :tester, refrences: :users, index: true, foreign_key: { to_table: :users }
  end
end
