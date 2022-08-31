# frozen_string_literal: true

class ChangesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :id, :primary_key
  end
end
