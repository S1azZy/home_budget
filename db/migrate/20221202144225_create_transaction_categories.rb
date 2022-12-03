class CreateTransactionCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_categories do |t|
      t.references :transaction, type: :uuid, index: false, null: false, foreign_key: { to_table: :person_transactions }
      t.references :category, index: true, null: false, foreign_key: true

      t.timestamps null: false

      t.index [:transaction_id, :category_id], unique: true
    end
  end
end
