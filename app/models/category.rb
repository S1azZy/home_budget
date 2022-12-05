# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :transaction_categories, dependent: :restrict_with_error
  has_many :person_transactions, through: :transaction_categories
  has_many :documents_expense_operations, class_name: "Documents::ExpenseOperation", dependent: :restrict_with_error

  validates :name, presence: true, length: { maximum: 100 }
  validates :name, :slug, uniqueness: { case_sensitive: false }

  validates :slug, presence: true, length: { maximum: 20 }
end
