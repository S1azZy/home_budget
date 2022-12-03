# frozen_string_literal: true

class PersonWalletGroup < ApplicationRecord
  belongs_to :person
  has_many :person_wallets, dependent: :nullify

  validates :name, presence: true, length: { maximum: 255 }
end
