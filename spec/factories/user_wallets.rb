# frozen_string_literal: true

FactoryBot.define do
  factory :user_wallet do
    association :user
    association :currency
    wallet_type { :cash }
    name { FFaker::Lorem.word }
    amount { Random.rand(1_000_000) }
  end
end
