# frozen_string_literal: true

FactoryBot.define do
  factory :person_currency do
    association :person
    association :currency
    multiplicity { 1 }
  end
end
