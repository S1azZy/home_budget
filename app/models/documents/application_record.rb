# frozen_string_literal: true

module Documents
  class ApplicationRecord < ::ApplicationRecord
    self.abstract_class = true
  end
end
