# frozen_string_literal: true

FactoryBot.define do
  factory :person_transaction do
    association :person_wallet
    association :currency
    association :initiator_document

    income { 1000 }
    expense { 0 }
    posted_at { Time.current }
  end
end
