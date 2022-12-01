# frozen_string_literal: true

module Documents
  class IncomeOperation < ApplicationRecord
    belongs_to :user
    belongs_to :user_wallet, class_name: "UserWallet"
    has_many :user_transactions, as: :initiator_document, class_name: "UserTransaction", dependent: :restrict_with_error

    validates :amount, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: DEFAULT_MAXIMUM_AMOUNT }
    validates :transaction_time, presence: true
  end
end
