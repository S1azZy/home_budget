# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false, limit: 100, index: { unique: true }

      t.timestamps null: false
    end
  end
end
