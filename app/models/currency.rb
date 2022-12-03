# frozen_string_literal: true

class Currency < ApplicationRecord
  USD_CODE = "USD"

  validates :code, presence: true, length: { is: 3 }
  validates :name, presence: true, length: { maximum: 50 }
  validates :symbol, presence: true, length: { maximum: 20 }
  validates :symbol_native, presence: true, length: { maximum: 20 }

  validates :code, uniqueness: { case_sensitive: false }

  has_many :documents_expense_operations, class_name: "Documents::ExpenseOperation", dependent: :restrict_with_error
end
