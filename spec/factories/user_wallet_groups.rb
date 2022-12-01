# frozen_string_literal: true

FactoryBot.define do
  factory :user_wallet_group do
    association :user
    name { FFaker::Lorem.word }
  end
end
