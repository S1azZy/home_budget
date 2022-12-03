# frozen_string_literal: true

class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people, id: :uuid do |t|
      t.string :first_name, null: false, limit: 100
      t.string :last_name, null: true, limit: 100

      t.timestamps null: false
    end

    add_reference :users, :person, type: :uuid, null: false, index: { unique: true }, foreign_key: true, after: :id # rubocop:disable Rails/NotNullColumn
  end
end
