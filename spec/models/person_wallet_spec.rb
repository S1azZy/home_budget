# frozen_string_literal: true

RSpec.describe PersonWallet do
  subject(:model) { build(:person_wallet) }

  describe "associations" do
    it { is_expected.to belong_to(:person) }
    it { is_expected.to belong_to(:currency) }
    it { is_expected.to belong_to(:group).optional }
    it { is_expected.to have_many(:person_transactions).dependent(:restrict_with_error) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:wallet_type) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(255) }
    it { is_expected.to validate_numericality_of(:amount).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(100_000_000) }
  end
end
