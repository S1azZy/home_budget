# frozen_string_literal: true

class UserConfig < ApplicationRecord
  belongs_to :user
  belongs_to :default_currency, class_name: "Currency"
end
