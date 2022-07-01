# frozen_string_literal: true

class AddUserToExchanges < ActiveRecord::Migration[7.0]
  def change
    add_column :exchanges, :author_id, :integer, foreign_key: { to_table: :users }
  end
end
