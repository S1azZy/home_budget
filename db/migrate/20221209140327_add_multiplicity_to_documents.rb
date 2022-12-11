# frozen_string_literal: true

class AddMultiplicityToDocuments < ActiveRecord::Migration[7.0]
  def change
    add_column :documents_expense_operations, :multiplicity, :numeric, null: false, precision: 10, scale: 4, default: 1
    add_column :documents_income_operations, :multiplicity, :numeric, null: false, precision: 10, scale: 4, default: 1
  end
end
