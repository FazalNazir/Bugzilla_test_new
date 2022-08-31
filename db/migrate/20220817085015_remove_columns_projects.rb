# frozen_string_literal: true

class RemoveColumnsProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :qa_id, :string
    remove_column :projects, :dev_id, :string
  end
end
