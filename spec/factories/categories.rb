# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { FFaker::Lorem.word }
    slug { FFaker::Internet.slug }
  end
end
