# frozen_string_literal: true

class UserTransaction < ApplicationRecord
  belongs_to :user
end
