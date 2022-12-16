# frozen_string_literal: true

module Documents
  class ExpenseOperationsController < ApplicationController
    include Pagy::Backend

    before_action :authenticate_user!
    before_action :set_variables, only: %i[new edit create]
    before_action :set_document, only: %i[edit update destroy]
    def index
      expense_operations =
        Documents::ExpenseOperation
          .where(person: current_person)
          .includes(:person_wallet, :currency, :category)
          .order(created_at: :desc)
      @pagy, @expense_operations = pagy(expense_operations)
    end

    def new
      if params.key?(:source_document_id)
        source_document = Documents::ExpenseOperation.find(params[:source_document_id])
        attrs = %w[amount comment person_wallet_id category_id transaction_time currency_rate multiplicity]
        @expense_operation = Documents::ExpenseOperation.new(source_document.attributes.slice(*attrs))
      else
        @expense_operation = Documents::ExpenseOperation.new
      end
    end

    def edit; end

    def create
      service = Documents::ExpenseOperations::CreateService.new(current_person, expense_operations_params)

      if service.call
        redirect_to documents_expense_operations_path
      else
        @expense_operation = Documents::ExpenseOperation.new
        flash[:alert] = t("notifications.create.failure")
        render :new
      end
    end

    def update
      service = Documents::ExpenseOperations::UpdateService.new(@expense_operation, expense_operations_params)

      if service.call
        flash[:notice] = t("notifications.update.success")
        redirect_to documents_expense_operation_path(@expense_operation)
      else
        flash[:alert] = t("notifications.update.failure")
        render :edit
      end
    end

    def destroy
      if @expense_operation.destroy
        flash[:notice] = t("notifications.destroy.success")
      else
        flash[:alert] = t("notifications.destroy.failure")
      end

      redirect_to documents_expense_operations_path
    end

    private

    def expense_operations_params
      params.require(:documents_expense_operation).permit(:person_wallet_id, :currency_id, :category_id, :amount,
                                                          :transaction_time, :comment, :event)
    end

    def set_variables
      @person_wallets = PersonWallet.where(person: current_person)
    end

    def set_document
      @expense_operation = Documents::ExpenseOperation.find(params[:id])
    end
  end
end
