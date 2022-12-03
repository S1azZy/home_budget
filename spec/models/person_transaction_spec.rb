# frozen_string_literal: true

RSpec.describe PersonTransaction do
  subject(:model) { build(:person_transaction) }

  describe "associations" do
    it { is_expected.to belong_to(:person_wallet) }
    it { is_expected.to belong_to(:currency) }
    it { is_expected.to belong_to(:initiator_document) }
    it { is_expected.to have_many(:transaction_categories).dependent(:destroy) }
    it { is_expected.to have_many(:categories).through(:transaction_categories) }
  end

  describe "validations" do
    it {
      expect(model)
        .to validate_numericality_of(:income).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(100_000_000)
    }

    it {
      expect(model)
        .to validate_numericality_of(:expense).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(100_000_000)
    }

    describe "income_or_expense_must_be_set" do
      before do
        model.expense = 0
        model.income = 0
      end

      it "validates income or expense must be greater then 0" do
        expect(model).to be_invalid
      end

      it "return correct error message" do
        model.validate
        expect(model.errors.messages_for(:income)).to contain_exactly("Должен быть установлен приход или расход!")
      end
    end
  end
end
