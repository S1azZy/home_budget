# frozen_string_literal: true

FactoryBot.define do
  factory :currency do
    name { FFaker::Currency.name }
    code { FFaker::Currency.code }
    symbol { FFaker::Currency.symbol }
    symbol_native { FFaker::Currency.symbol }
  end
end
