# frozen_string_literal: true

# Migration to set status 1 by default
class ChangeStatusDefault < ActiveRecord::Migration[5.2]
  change_column_default(
    :bugs, :status, '1'
  )
end
