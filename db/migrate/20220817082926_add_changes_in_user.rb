# frozen_string_literal: true

class AddChangesInUser < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :user_type, :type
  end
end
