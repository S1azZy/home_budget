# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  DEFAULT_MAXIMUM_AMOUNT = 100_000_000
end
