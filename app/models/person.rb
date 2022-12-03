# frozen_string_literal: true

class Person < ApplicationRecord
  has_one :user, dependent: :restrict_with_error
  has_many :person_wallets, dependent: :restrict_with_error
  has_many :person_transactions, through: :person_wallets

  has_many :documents_money_transfers, class_name: "Documents::MoneyTransfer", dependent: :restrict_with_error
  has_many :documents_expense_operations, class_name: "Documents::ExpenseOperation", dependent: :restrict_with_error
  has_many :documents_income_operations, class_name: "Documents::IncomeOperation", dependent: :restrict_with_error

  validates :first_name, :last_name, length: { maximum: 100 }
  validates :first_name, presence: true
end
