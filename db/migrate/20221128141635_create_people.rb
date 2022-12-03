# frozen_string_literal: true

class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people, id: :uuid do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps null: false
    end

    add_reference :users, :person, type: :uuid, null: false, index: { unique: true }, foreign_key: true # rubocop:disable Rails/NotNullColumn
  end
end
