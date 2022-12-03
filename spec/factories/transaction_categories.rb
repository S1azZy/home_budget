# frozen_string_literal: true

FactoryBot.define do
  factory :transaction_category do
    association :person_transaction
    association :category
  end
end
