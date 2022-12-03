# frozen_string_literal: true

FactoryBot.define do
  factory :person_wallet_group do
    association :person
    name { FFaker::Lorem.word }
  end
end
