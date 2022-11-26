# frozen_string_literal: true

class Currency < ApplicationRecord
  validates :code, presence: true, length: { is: 3 }
  validates :name, presence: true, length: { maximum: 50 }
end
