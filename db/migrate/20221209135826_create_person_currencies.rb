# frozen_string_literal: true

class CreatePersonCurrencies < ActiveRecord::Migration[7.0]
  def change
    create_table :person_currencies do |t|
      t.references :person, type: :uuid, null: false, index: false, foreign_key: true
      t.references :currency, null: false, index: true, foreign_key: true
      t.numeric :multiplicity, null: false, precision: 10, scale: 4, default: 1

      t.timestamps null: false

      t.index %i[person_id currency_id], unique: true
    end
  end
end
