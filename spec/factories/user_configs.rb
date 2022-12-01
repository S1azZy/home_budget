# frozen_string_literal: true

FactoryBot.define do
  factory :user_config do
    association :user
    association :default_currency
  end
end
