# frozen_string_literal: true

class PersonConfig < ApplicationRecord
  belongs_to :person
  belongs_to :default_currency, class_name: "Currency"
end
