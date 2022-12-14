# frozen_string_literal: true

class CreatePersonTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :person_transactions, id: :uuid do |t|
      t.references :person_wallet, null: false, index: true, foreign_key: { on_delete: :restrict }
      t.references :initiator_document, type: :uuid, polymorphic: true, index: true, null: false
      t.references :currency, null: false, index: true, foreign_key: { on_delete: :restrict }

      t.numeric :income, null: false, default: 0, precision: 14, scale: 4
      t.numeric :expense, null: false, default: 0, precision: 14, scale: 4

      t.datetime :posted_at, null: false

      t.timestamps null: false
    end
  end
end
