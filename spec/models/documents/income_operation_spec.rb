# frozen_string_literal: true

RSpec.describe Documents::IncomeOperation do
  subject(:model) { build(:documents_income_operation) }

  describe "associations" do
    it { is_expected.to belong_to(:person) }
    it { is_expected.to belong_to(:person_wallet) }
    it { is_expected.to have_many(:person_transactions).dependent(:restrict_with_error) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:transaction_time) }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_numericality_of(:amount).is_greater_than(0).is_less_than_or_equal_to(100_000_000) }

    it {
      expect(model)
        .to validate_numericality_of(:multiplicity).is_greater_than(0).is_less_than_or_equal_to(100_000)
    }
  end
end
