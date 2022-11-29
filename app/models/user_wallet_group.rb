# frozen_string_literal: true

class UserWalletGroup < ApplicationRecord
  has_many :user_wallet, dependent: :nullify
end
