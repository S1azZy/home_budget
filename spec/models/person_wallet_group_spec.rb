# frozen_string_literal: true

RSpec.describe PersonWalletGroup do
  subject(:model) { build(:person_wallet_group) }

  describe "associations" do
    it { is_expected.to belong_to(:person) }
    it { is_expected.to have_many(:person_wallets).dependent(:nullify).inverse_of(:group) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(255) }
  end
end
