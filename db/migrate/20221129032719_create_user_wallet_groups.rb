# frozen_string_literal: true

class CreateUserWalletGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :user_wallet_groups do |t|
      t.references :user, null: false, index: true, foreign_key: true
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
