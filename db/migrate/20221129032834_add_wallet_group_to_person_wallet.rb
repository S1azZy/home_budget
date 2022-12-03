# frozen_string_literal: true

class AddWalletGroupToPersonWallet < ActiveRecord::Migration[7.0]
  def change
    add_reference :person_wallets, :group, null: true, index: true, foreign_key: { to_table: :person_wallet_groups }, after: :currency_id
  end
end
