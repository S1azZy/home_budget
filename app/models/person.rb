# frozen_string_literal: true

class Person < ApplicationRecord
  has_many :person_wallets, dependent: :restrict_with_error
  has_many :person_transactions, through: :person_wallets, class_name: "PersonTransaction"

  validates :first_name, :last_name
end
