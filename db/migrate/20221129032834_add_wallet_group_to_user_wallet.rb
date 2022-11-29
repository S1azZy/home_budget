# frozen_string_literal: true

class AddWalletGroupToUserWallet < ActiveRecord::Migration[7.0]
  def change
    add_reference :user_wallets, :group, null: true, index: true, foreign_key: { to_table: :user_wallet_groups }
  end
end
