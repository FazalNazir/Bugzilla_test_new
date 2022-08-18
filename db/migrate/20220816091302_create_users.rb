# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: false, primary_key: :user_id do |t|
      t.string :user_id
      t.string :name
      t.string :email
      t.string :password
      t.integer :user_type

      t.timestamps
    end
  end
end
