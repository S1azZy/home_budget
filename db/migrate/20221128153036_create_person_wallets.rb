# frozen_string_literal: true

class CreatePersonWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :person_wallets do |t|
      t.references :person, type: :uuid, null: false, foreign_key: true
      t.references :currency, null: false, foreign_key: true
      t.integer :wallet_type, limit: 2, null: false
      t.string :name, limit: 255, null: false

      t.numeric :amount, null: false, default: 0, precision: 14, scale: 4

      t.boolean :no_balance_control, null: false, default: false

      t.timestamps null: false
    end
  end
end
