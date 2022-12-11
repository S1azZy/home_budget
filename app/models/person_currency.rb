# frozen_string_literal: true

class PersonCurrency < ApplicationRecord
  belongs_to :person
  belongs_to :currency

  attribute :multiplicity, default: -> { 1 }

  validates :person_id, uniqueness: { scope: :currency_id }
  validates :multiplicity, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 100_000 }
end
