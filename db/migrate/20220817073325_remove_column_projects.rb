# frozen_string_literal: true

class RemoveColumnProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :user_id, :string
    remove_column :bugs, :b_id, :string
    remove_column :bugs, :creator, :string
    remove_column :bugs, :developer, :string
  end
end
