# frozen_string_literal: true

module Documents
  module ExpenseOperations
    class PostService
      include Callable

      def initialize(document)
        @document = document
      end

      def call
        return false unless document.posted?

        Documents::ExpenseOperation.transaction do
          document.person_transactions.destroy_all

          transaction = document.person_transactions.create!(transaction_attributes)
          transaction.categories << document.category
        end

        true
      end

      private

      attr_reader :document

      def transaction_attributes
        {
          person_wallet: document.person_wallet,
          currency: document.currency,
          expense: document.total_amount,
          posted_at: document.transaction_time
        }
      end
    end
  end
end
