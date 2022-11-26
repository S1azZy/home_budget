# frozen_string_literal: true

class CreateCurrencies < ActiveRecord::Migration[7.0]
  def change
    create_table :currencies do |t|
      t.string :name, null: false, limit: 50
      t.string :code, null: false, limit: 3, index: { unique: true }
      t.string :symbol, null: false, limit: 20
      t.string :symbol_native, null: false, limit: 20

      t.timestamps
    end
  end
end
