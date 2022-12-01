# frozen_string_literal: true

class CreateDocumentsIncomeOperations < ActiveRecord::Migration[7.0]
  def change
    create_table :documents_income_operations, id: :uuid do |t|
      t.references :user, null: false, index: true, foreign_key: true
      t.references :user_wallet, null: false,
                                 index: true, foreign_key: { to_table: :user_wallets, on_delete: :restrict }
      t.integer :status, null: false, default: 0

      t.numeric :amount, null: false, default: 0, precision: 10, scale: 4

      t.datetime :transaction_time, null: false

      t.string :comment, null: true, limit: 255

      t.timestamps
    end
  end
end
