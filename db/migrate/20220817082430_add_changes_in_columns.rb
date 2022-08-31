# frozen_string_literal: true

class AddChangesInColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :bugs, :integer, :status
    rename_column :bugs, :string, :type
  end
end
