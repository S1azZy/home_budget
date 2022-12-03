# frozen_string_literal: true

class TransactionCategory < ApplicationRecord
  belongs_to :person_transaction
  belongs_to :category

  validates :person_transaction_id, uniqueness: { scope: :category_id, case_sensitive: false }
end
