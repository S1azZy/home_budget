# frozen_string_literal: true

class UserWallet < ApplicationRecord
  belongs_to :user
  belongs_to :currency
  belongs_to :group, class_name: "UserWalletGroup", optional: true

  validates :wallet_type, presence: true
  validates :name, presence: true, length: { maximum: 255 }
  validates :amount, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100_000_000 }

  enum wallet_type: {
    cash: 0,
    bank_account: 1
  }
end
