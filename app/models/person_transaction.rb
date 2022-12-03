# frozen_string_literal: true

class PersonTransaction < ApplicationRecord
  belongs_to :person_wallet
  belongs_to :currency
  belongs_to :initiator_document, polymorphic: true

  has_many :transaction_categories, dependent: :destroy
  has_many :categories, through: :transaction_categories

  validates :income,
            :expense,
            numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: DEFAULT_MAXIMUM_AMOUNT }
  validate :income_or_expense_must_be_set

  private

  def income_or_expense_must_be_set
    return unless (expense + income).zero?

    errors.add(:income, "Должен быть установлен приход или расход!")
  end
end
