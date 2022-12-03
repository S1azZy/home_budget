# frozen_string_literal: true

class PersonWallet < ApplicationRecord
  belongs_to :person
  belongs_to :currency
  belongs_to :group, class_name: "PersonWalletGroup", optional: true

  validates :wallet_type, presence: true
  validates :name, presence: true, length: { maximum: 255 }
  validates :amount, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: DEFAULT_MAXIMUM_AMOUNT }

  enum wallet_type: {
    cash: 0,
    bank_account: 1
  }
end
