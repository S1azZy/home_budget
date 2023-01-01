# frozen_string_literal: true

FactoryBot.define do
  factory :documents_periodic_expense, class: "Documents::PeriodicExpense" do
    association :person
    association :person_wallet
    association :currency
    association :category

    amount { 1_000 }
    currency_rate { 1 }
    multiplicity { 1 }
    date_start { Time.current }
    date_end { Time.current }
    status { :draft }
    comment { FFaker::Lorem.sentence }
  end
end
