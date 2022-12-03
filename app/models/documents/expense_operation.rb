# frozen_string_literal: true

module Documents
  class ExpenseOperation < ApplicationRecord
    include DocumentsStatuses

    belongs_to :person
    belongs_to :person_wallet
    belongs_to :currency
    belongs_to :category
    has_many :person_transactions, as: :initiator_document, dependent: :restrict_with_error

    attribute :currency_rate, default: -> { 1 }

    validates :amount, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: DEFAULT_MAXIMUM_AMOUNT }
    validates :currency_rate, presence: true,
                              numericality: { greater_than: 0, less_than_or_equal_to: DEFAULT_MAXIMUM_AMOUNT }
    validates :transaction_time, presence: true
    validates :comment, length: { maximum: 255 }
  end
end
