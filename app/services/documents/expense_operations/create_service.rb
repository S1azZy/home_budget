# frozen_string_literal: true

module Documents
  module ExpenseOperations
    class CreateService
      def initialize(person, params)
        @person = person
        @params = params
        @event = params.delete("event")
        @person_wallet = person.person_wallets.find_by(id: params[:person_wallet_id])
        @currency = Currency.find_by(id: params[:currency_id]) || person_wallet.currency
        @category = Category.find(params[:category_id])
        @person_currency = PersonCurrency.find_by(person:, currency:)
      end

      def call
        Documents::ExpenseOperation.transaction do
          document = Documents::ExpenseOperation.create!(model_params)

          document.aasm.fire!(event.to_sym) if event && document.aasm.may_fire_event?(event.to_sym)

          PostService.call(document) if document.posted?
        end

        true
      end

      private

      attr_reader :person, :params, :event, :person_wallet, :currency, :category, :person_currency

      def model_params
        {
          person: person,
          person_wallet: person_wallet,
          currency: currency,
          category: category,
          amount: params[:amount],
          transaction_time: params[:transaction_time],
          comment: params[:comment],
          multiplicity: person_currency.multiplicity
        }
      end
    end
  end
end
