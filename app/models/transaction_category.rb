class TransactionCategory < ApplicationRecord
  belongs_to :transaction, class_name: 'PersonTransaction'
  belongs_to :category

  validates :transaction_id, uniqueness: { scope: :category_id }
end
