# frozen_string_literal: true

FactoryBot.define do
  factory :documents_income_operation, class: "Documents::IncomeOperation" do
    association :person
    association :person_wallet

    amount { 1_000 }
    transaction_time { Time.current }
    status { :draft }
  end
end
