# frozen_string_literal: true

module Documents
  class ExpenseOperation < ApplicationRecord
    include DocumentsStatuses

    belongs_to :person
    belongs_to :person_wallet
    belongs_to :currency
    belongs_to :category
    has_many :person_transactions, as: :initiator_document, dependent: :destroy

    attribute :currency_rate, default: -> { 1 }
    attribute :multiplicity, default: -> { 1 }

    validates :amount, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: DEFAULT_MAXIMUM_AMOUNT }
    validates :currency_rate,
              presence: true, numericality: { greater_than: 0, less_than_or_equal_to: DEFAULT_MAXIMUM_AMOUNT }
    validates :multiplicity, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 100_000 }

    validates :transaction_time, presence: true
    validates :comment, length: { maximum: 255 }

    def total_amount
      multiplicity * amount
    end
  end
end
