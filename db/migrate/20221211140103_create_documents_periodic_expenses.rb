class CreateDocumentsPeriodicExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :documents_periodic_expenses, id: :uuid do |t|
      t.references :person, type: :uuid, null: false, index: true, foreign_key: true
      t.references :person_wallet, null: false,
                   index: true, foreign_key: { to_table: :person_wallets, on_delete: :restrict }
      t.references :category, null: false, index: true, foreign_key: { on_delete: :restrict }
      t.references :currency, null: false, index: true, foreign_key: { on_delete: :restrict }
      t.numeric :currency_rate, null: false, default: 0, precision: 20, scale: 10
      t.numeric :multiplicity, null: false, default: 1, precision: 10, scale: 4

      t.integer :status, null: false, default: 0
      t.numeric :amount, null: false, default: 0, precision: 14, scale: 4

      t.date :date_start, null: false
      t.date :date_end, null: false

      t.string :comment, null: true, limit: 255

      t.timestamps null: false
    end
  end
end
