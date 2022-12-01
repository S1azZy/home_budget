# frozen_string_literal: true

module Documents
  class ApplicationRecord < ::ApplicationRecord
    include DocumentsStatuses

    self.abstract_class = true
  end
end
