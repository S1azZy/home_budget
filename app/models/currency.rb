# frozen_string_literal: true

class Currency < ApplicationRecord
  # TODO: Переделаю это потом
  USD_CODE = "USD"
  RUB_CODE = "RUB"
  IDR_CODE = "IDR"
  EUR_CODE = "EUR"
  GEL_CODE = "GEL"
  DEFAULT_CURRENCIES_CODES = [USD_CODE, RUB_CODE, IDR_CODE, EUR_CODE, GEL_CODE].freeze

  validates :code, presence: true, length: { is: 3 }
  validates :name, presence: true, length: { maximum: 50 }
  validates :symbol, presence: true, length: { maximum: 20 }
  validates :symbol_native, presence: true, length: { maximum: 20 }

  validates :code, uniqueness: { case_sensitive: false }

  has_many :documents_expense_operations, class_name: "Documents::ExpenseOperation", dependent: :restrict_with_error

  scope :default_list, -> { where(code: DEFAULT_CURRENCIES_CODES) }
end
