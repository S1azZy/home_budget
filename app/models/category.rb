# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :transaction_categories, dependent: :restrict_with_error
  has_many :person_transactions, through: :transaction_categories, class_name: "PersonTransaction"
end
