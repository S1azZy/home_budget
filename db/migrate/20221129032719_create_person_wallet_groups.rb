# frozen_string_literal: true

class CreatePersonWalletGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :person_wallet_groups do |t|
      t.references :person, type: :uuid, null: false, index: true, foreign_key: true
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
