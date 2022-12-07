# frozen_string_literal: true

class Documents::ExpenseOperationsController < ApplicationController
  include Pagy::Backend

  before_action :authenticate_user!
  def index
    @expense_operations = Documents::ExpenseOperation.where(person: current_person).includes(:person_wallet, :currency, :category)
  end

  def new
    @expense_operation = Documents::ExpenseOperation.new
  end

  def create
    @person_wallet = PersonWallet.new(person_wallet_params.merge(person: current_person))

    if @person_wallet.save
      flash[:notice] = "Кошелек успешно создан"
      redirect_to person_wallet_path(@person_wallet)
    else
      flash[:alert] = "Ошибка во время создания"
      render :new
    end
  end

  def edit
    @person_wallet = PersonWallet.find(params[:id])
  end

  def update
    @person_wallet = PersonWallet.find(params[:id])

    if @person_wallet.update(person_wallet_params)
      flash[:notice] = "Кошелек успешно обновлен"
      redirect_to person_wallet_path(@person_wallet)
    else
      flash[:alert] = "Ошибка во время сохранения"
      render :edit
    end
  end


  private

  def person_wallet_params
    params.require(:person_wallet).permit(:name, :currency_id, :wallet_type, :no_balance_control)
  end
end
