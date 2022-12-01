# frozen_string_literal: true

class UserWalletGroup < ApplicationRecord
  belongs_to :user
  has_many :user_wallet, dependent: :nullify

  validates :name, presence: true, length: { maximum: 255 }
end
