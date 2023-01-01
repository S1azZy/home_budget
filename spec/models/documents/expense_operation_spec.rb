# frozen_string_literal: true

RSpec.describe Documents::ExpenseOperation do
  subject(:model) { build(:documents_expense_operation) }

  describe "associations" do
    it { is_expected.to belong_to(:person) }
    it { is_expected.to belong_to(:person_wallet) }
    it { is_expected.to belong_to(:currency) }
    it { is_expected.to belong_to(:category) }
    it { is_expected.to have_many(:person_transactions).dependent(:destroy) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_length_of(:comment).is_at_most(255) }
    it { is_expected.to validate_presence_of(:transaction_time) }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_numericality_of(:amount).is_greater_than(0).is_less_than_or_equal_to(100_000_000) }
    it { is_expected.to validate_presence_of(:currency_rate) }

    it {
      expect(model)
        .to validate_numericality_of(:currency_rate).is_greater_than(0).is_less_than_or_equal_to(100_000_000)
    }

    it {
      expect(model)
        .to validate_numericality_of(:multiplicity).is_greater_than(0).is_less_than_or_equal_to(100_000)
    }
  end
end
