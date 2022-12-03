# frozen_string_literal: true

FactoryBot.define do
  factory :documents_money_transfer, class: "Documents::MoneyTransfer" do
    association :person
    association :person_wallet_from, factory: :person_wallet
    association :person_wallet_to, factory: :person_wallet

    amount_from { 1_000 }
    amount_to { 1_000 }
    currency_rate { 1 }
    transaction_time { Time.current }
    status { :draft }
    comment { FFaker::Lorem.sentence }
  end
end
