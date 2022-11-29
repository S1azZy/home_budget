# frozen_string_literal: true

class UserWallet < ApplicationRecord
  belongs_to :user
  belongs_to :group, class_name: "UserWalletGroup", optional: true
end
