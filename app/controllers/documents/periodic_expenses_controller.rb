# frozen_string_literal: true

module Documents
  class PeriodicExpensesController < ApplicationController
    include Pagy::Backend

    before_action :authenticate_user!
    before_action :set_variables, only: %i[new edit create]
    before_action :set_document, only: %i[edit update destroy]
    def index
      periodic_expenses =
        Documents::PeriodicExpense.where(person: current_person).includes(:person_wallet, :currency, :category)
      @pagy, @periodic_expenses = pagy(periodic_expenses)
    end

    def new
      @periodic_expense = Documents::PeriodicExpense.new
    end

    def edit; end

    def create
      service = Documents::PeriodicExpenses::CreateService.new(current_person, document_params)

      if service.call
        redirect_to documents_periodic_expenses_path
      else
        @periodic_expense = Documents::PeriodicExpense.new
        flash[:alert] = t("notifications.create.failure")
        render :new
      end
    end

    def update
      service = Documents::PeriodicExpenses::UpdateService.new(@periodic_expense, document_params)

      if service.call
        flash[:notice] = t("notifications.update.success")
        redirect_to documents_periodic_expense_path(@periodic_expense)
      else
        flash[:alert] = t("notifications.update.failure")
        render :edit
      end
    end

    def destroy
      if @periodic_expense.destroy
        flash[:notice] = t("notifications.destroy.success")
      else
        flash[:alert] = t("notifications.destroy.failure")
      end

      redirect_to documents_periodic_expenses_path
    end

    private

    def document_params
      params.require(:documents_periodic_expense).permit(:person_wallet_id, :currency_id, :category_id, :amount,
                                                          :date_start, :date_end, :comment, :event)
    end

    def set_variables
      @person_wallets = PersonWallet.where(person: current_person)
    end

    def set_document
      @periodic_expense = Documents::PeriodicExpense.find(params[:id])
    end
  end
end
