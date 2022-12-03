# frozen_string_literal: true

module Documents
  class IncomeOperation < ApplicationRecord
    include DocumentsStatuses

    belongs_to :person
    belongs_to :person_wallet
    has_many :person_transactions, as: :initiator_document, dependent: :restrict_with_error

    validates :amount, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: DEFAULT_MAXIMUM_AMOUNT }
    validates :transaction_time, presence: true
  end
end
