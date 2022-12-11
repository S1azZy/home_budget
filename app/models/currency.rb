# frozen_string_literal: true

class Currency < ApplicationRecord
  USD_CODE = "USD"
  RUB_CODE = "RUB"
  IDR_CODE = "IDR"
  EUR_CODE = "EUR"
  GEL_CODE = "GEL"

  validates :code, presence: true, length: { is: 3 }
  validates :name, presence: true, length: { maximum: 50 }
  validates :symbol, presence: true, length: { maximum: 20 }
  validates :symbol_native, presence: true, length: { maximum: 20 }

  validates :code, uniqueness: { case_sensitive: false }

  has_many :documents_money_transfers, class_name: "Documents::MoneyTransfer", dependent: :restrict_with_error
  has_many :documents_expense_operations, class_name: "Documents::ExpenseOperation", dependent: :restrict_with_error
  has_many :documents_income_operations, class_name: "Documents::IncomeOperation", dependent: :restrict_with_error
  has_many :documents_periodic_expenses, class_name: "Documents::PeriodicExpense", dependent: :restrict_with_error
  has_many :person_currencies, dependent: :restrict_with_error
end
