# frozen_string_literal: true

module DocumentsStatuses
  extend ActiveSupport::Concern
  include AASM

  included do
    validates :status, presence: true

    enum status: {
      draft: 0,
      posted: 1
    }

    aasm column: :status, enum: true do
      state :draft, initial: true
      state :cancelled
      state :posted

      event :post_document do
        transitions from: :draft, to: :posted
      end

      event :revert_document do
        transitions from: :posted, to: :draft
      end
    end
  end
end
