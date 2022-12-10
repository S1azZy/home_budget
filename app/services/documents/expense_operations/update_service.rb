# frozen_string_literal: true

module Documents
  module ExpenseOperations
    class UpdateService
      def initialize(document, params)
        @document = document
        @params = params
        @event = params.delete("event")
        @person = document.person

        @person_wallet = person.person_wallets.find_by(id: params[:person_wallet_id])
        @category = Category.find(params[:category_id])
      end

      def call
        Documents::ExpenseOperation.transaction do
          document.update!(model_params)

          document.aasm.fire!(event.to_sym) if event && document.aasm.may_fire_event?(event.to_sym)

          PostService.call(document) if document.posted?
        end

        true
      end

      private

      attr_reader :person, :params, :event, :person_wallet, :currency, :category, :document

      def model_params
        {
          person: person,
          person_wallet: person_wallet,
          currency: person_wallet.currency,
          category: category,
          amount: params[:amount],
          transaction_time: params[:transaction_time],
          comment: params[:comment]
        }
      end
    end
  end
end
