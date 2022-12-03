# frozen_string_literal: true

class CreateTransactionCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_categories do |t|
      t.references :person_transaction, type: :uuid, index: false, null: false, foreign_key: true
      t.references :category, index: true, null: false, foreign_key: true

      t.timestamps null: false

      t.index %i[person_transaction_id category_id],
              unique: true,
              name: :idx_unique_on_person_transaction_id_and_category_id
    end
  end
end
