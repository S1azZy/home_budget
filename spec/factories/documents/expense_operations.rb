# frozen_string_literal: true

FactoryBot.define do
  factory :documents_expense_operation, class: "Documents::ExpenseOperation" do
    association :person
    association :person_wallet
    association :currency
    association :category

    amount { 1_000 }
    currency_rate { 1 }
    multiplicity { 1 }
    transaction_time { Time.current }
    status { :draft }
    comment { FFaker::Lorem.sentence }
  end
end
