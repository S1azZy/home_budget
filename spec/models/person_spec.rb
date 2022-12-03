# frozen_string_literal: true

RSpec.describe Person do
  describe "associations" do
    it { is_expected.to have_many(:person_wallets).dependent(:restrict_with_error) }
    it { is_expected.to have_many(:person_transactions).through(:person_wallets) }
    it { is_expected.to have_one(:user).dependent(:restrict_with_error) }

    it { is_expected.to have_many(:documents_money_transfers).dependent(:restrict_with_error) }
    it { is_expected.to have_many(:documents_expense_operations).dependent(:restrict_with_error) }
    it { is_expected.to have_many(:documents_income_operations).dependent(:restrict_with_error) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_length_of(:first_name).is_at_most(100) }
    it { is_expected.to validate_length_of(:last_name).is_at_most(100) }
  end
end
