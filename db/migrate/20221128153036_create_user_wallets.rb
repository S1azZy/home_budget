# frozen_string_literal: true

class CreateUserWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :user_wallets do |t|
      t.references :user, null: false, foreign_key: true
      t.references :currency, null: false, foreign_key: true
      t.integer :wallet_type, limit: 2, null: false
      t.string :name, limit: 255, null: false

      t.numeric :amount, null: false, default: 0, precision: 10, scale: 4

      t.timestamps null: false
    end
  end
end
