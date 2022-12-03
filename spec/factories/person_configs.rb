# frozen_string_literal: true

FactoryBot.define do
  factory :person_config do
    association :person
    association :default_currency
  end
end
