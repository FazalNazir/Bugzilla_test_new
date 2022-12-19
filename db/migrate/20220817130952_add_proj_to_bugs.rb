# frozen_string_literal: true

# Migration to add refrence key to bugs
class AddProjToBugs < ActiveRecord::Migration[5.2]
  def change
    add_reference :bugs, :proj, refrences: :projects, index: true, foreign_key: { to_table: :projects }
  end
end
