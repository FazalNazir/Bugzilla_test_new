# frozen_string_literal: true

class ChangeStatusDefault < ActiveRecord::Migration[5.2]
  change_column_default(
    :bugs, :status, '1'
  )
end
