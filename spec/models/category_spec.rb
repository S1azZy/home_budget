# frozen_string_literal: true

RSpec.describe Category do
  subject { build(:category) }

  describe "associations" do
    it { is_expected.to have_many(:transaction_categories).dependent(:restrict_with_error) }
    it { is_expected.to have_many(:person_transactions).through(:transaction_categories) }
    it { is_expected.to have_many(:documents_expense_operations).dependent(:restrict_with_error) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(100) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  end
end
