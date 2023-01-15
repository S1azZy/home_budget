# frozen_string_literal: true

class PersonWalletsController < ApplicationController
  include Pagy::Backend

  before_action :authenticate_user!
  before_action :set_variables, only: %i[new create edit update]
  def index
    @person_wallets = PersonWallet.where(person: current_person).includes(:currency, :group)
  end

  def new
    @person_wallet = PersonWallet.new
  end

  def edit
    @person_wallet = PersonWallet.find(params[:id])
  end

  def create
    @person_wallet = PersonWallet.new(person_wallet_params.merge(person: current_person))

    if @person_wallet.save
      flash[:notice] = t("notifications.create.success")
      redirect_to edit_person_wallet_path(@person_wallet)
    else
      flash[:alert] = t("notifications.create.failure")
      render :new
    end
  end

  def update
    @person_wallet = PersonWallet.find(params[:id])

    if @person_wallet.update(person_wallet_params)
      flash[:notice] = t("notifications.update.success")
      redirect_to edit_person_wallet_path(@person_wallet)
    else
      flash[:alert] = t("notifications.update.failure")
      render :edit
    end
  end

  private

  def set_variables
    @currencies = Currency.joins(:person_currencies).merge(PersonCurrency.where(person: current_person))
  end

  def person_wallet_params
    params.require(:person_wallet).permit(:name, :currency_id, :wallet_type, :no_balance_control)
  end
end
