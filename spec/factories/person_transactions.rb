# frozen_string_literal: true

FactoryBot.define do
  factory :person_transaction do
    association :person_wallet
    association :currency
    income { 1000 }
    expense { 0 }
    posted_at { Time.current }

    for_income_operation

    trait :for_income_operation do
      association :initiator_document, factory: :documents_income_operation
    end
  end
end
