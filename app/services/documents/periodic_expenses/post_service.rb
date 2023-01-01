# frozen_string_literal: true

module Documents
  module PeriodicExpenses
    class PostService
      include Callable

      def initialize(document)
        @document = document
      end

      def call
        return false unless document.posted?

        Documents::PeriodicExpense.transaction do
          document.person_transactions.destroy_all

          total_amount = document.total_amount
          daily_amount = (document.total_amount / document.days_count).to_i

          (document.date_start..document.date_end).each do |transaction_date|
            expense = transaction_date == document.date_end ? total_amount : daily_amount

            create_transaction(expense, transaction_date)

            total_amount -= expense
          end
        end

        true
      end

      private

      attr_reader :document

      def transaction_attributes(expense, transaction_date)
        {
          person_wallet: document.person_wallet,
          currency: document.currency,
          expense: expense,
          posted_at: transaction_date
        }
      end

      def create_transaction(expense, transaction_date)
        attrs = transaction_attributes(expense, transaction_date)
        transaction = document.person_transactions.create!(attrs)
        transaction.categories << document.category
      end
    end
  end
end
