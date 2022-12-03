# frozen_string_literal: true

class CreatePersonConfigs < ActiveRecord::Migration[7.0]
  def change
    create_table :person_configs do |t|
      t.references :person, type: :uuid, null: false, index: true, foreign_key: true
      t.references :default_currency,
                   null: false,
                   index: true,
                   foreign_key: { to_table: :currencies, on_delete: :restrict }

      t.timestamps
    end
  end
end
