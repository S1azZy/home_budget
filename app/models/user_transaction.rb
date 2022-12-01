# frozen_string_literal: true

class UserTransaction < ApplicationRecord
  belongs_to :user_wallet
  belongs_to :currency
  belongs_to :initiator_document, polymorphic: true

  validates :income,
            :expense,
            allow_blank: true,
            numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100_000_000 }
  validate :income_or_expense_must_be_set

  def income_or_expense_must_be_set
    return unless (expense + income).zero?

    errors.add(:income, "Должен быть установлен приход или расход!")
  end
end
