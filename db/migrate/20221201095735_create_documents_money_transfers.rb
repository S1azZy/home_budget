# frozen_string_literal: true

class CreateDocumentsMoneyTransfers < ActiveRecord::Migration[7.0]
  def change
    create_table :documents_money_transfers, id: :uuid do |t|
      t.references :person, type: :uuid, null: false, index: true, foreign_key: true
      t.references :person_wallet_from, null: false,
                                        index: true, foreign_key: { to_table: :person_wallets, on_delete: :restrict }
      t.references :person_wallet_to, null: false,
                                      index: true, foreign_key: { to_table: :person_wallets, on_delete: :restrict }
      t.integer :status, null: false, default: 0

      t.numeric :amount_from, null: false, default: 0, precision: 10, scale: 4
      t.numeric :amount_to, null: false, default: 0, precision: 10, scale: 4

      t.numeric :currency_rate, null: false, default: 1, precision: 10, scale: 10
      t.datetime :transaction_time, null: false

      t.string :comment, null: true, limit: 255

      t.timestamps null: false
    end
  end
end
