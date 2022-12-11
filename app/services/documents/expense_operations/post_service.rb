# frozen_string_literal: true

module Documents
  module ExpenseOperations
    class PostService
      def self.call(...)
        new(...).call
      end

      def initialize(document)
        @document = document
      end

      def call
        return false unless document.posted?

        Documents::ExpenseOperation.transaction do
          document.person_transactions.destroy_all

          transaction = document.person_transactions.create!(person_wallet: document.person_wallet,
                                                             currency: document.currency, expense: document.total_amount, posted_at: document.transaction_time)
          transaction.categories << document.category
        end

        true
      end

      private

      attr_reader :document
    end
  end
end
