
module Documents
  class PeriodicExpense < ApplicationRecord
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

    validates :date_end, :date_start, presence: true
    validates :comment, length: { maximum: 255 }
    validate :date_start_lt_date_end

    def total_amount
      multiplicity * amount
    end

    def days_count
      (date_end - date_start).to_i + 1
    end

    private

    def date_start_lt_date_end
      return unless date_start >= date_end

      errors.add(:date_start, "Дата старта должна быть меньше даты окончания")
    end
  end
end
