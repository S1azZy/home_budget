# frozen_string_literal: true

RSpec.describe Documents::MoneyTransfer do
  subject(:model) { build(:documents_money_transfer) }

  describe "associations" do
    it { is_expected.to belong_to(:person) }
    it { is_expected.to belong_to(:person_wallet_from) }
    it { is_expected.to belong_to(:person_wallet_to) }
    it { is_expected.to have_many(:person_transactions).dependent(:restrict_with_error) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_length_of(:comment).is_at_most(255) }
    it { is_expected.to validate_presence_of(:transaction_time) }
    it { is_expected.to validate_presence_of(:amount_from) }

    it {
      expect(model)
        .to validate_numericality_of(:amount_from).is_greater_than(0).is_less_than_or_equal_to(100_000_000)
    }

    it { is_expected.to validate_presence_of(:amount_to) }
    it { is_expected.to validate_numericality_of(:amount_to).is_greater_than(0).is_less_than_or_equal_to(100_000_000) }
    it { is_expected.to validate_presence_of(:currency_rate) }

    it {
      expect(model)
        .to validate_numericality_of(:currency_rate).is_greater_than(0).is_less_than_or_equal_to(100_000_000)
    }
  end
end
