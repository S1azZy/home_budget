# frozen_string_literal: true

module Documents
  class IncomeOperation < ApplicationRecord
    include DocumentsStatuses

    belongs_to :person
    belongs_to :person_wallet
    has_many :person_transactions, as: :initiator_document, dependent: :restrict_with_error

    attribute :multiplicity, default: -> { 1 }

    validates :amount, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: DEFAULT_MAXIMUM_AMOUNT }
    validates :multiplicity, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 100_000 }
    validates :transaction_time, presence: true
  end
end
