# frozen_string_literal: true

FactoryBot.define do
  factory :person_wallet do
    association :person
    association :currency
    wallet_type { :cash }
    name { FFaker::Lorem.word }
    amount { Random.rand(1_000_000) }
  end
end
