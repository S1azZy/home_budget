
RSpec.describe TransactionCategory do
  subject(:model) { build(:transaction_category) }

  describe "associations" do
    it { is_expected.to belong_to(:person_transaction) }
    it { is_expected.to belong_to(:category) }
  end

  describe "validations" do
    it { is_expected.to validate_uniqueness_of(:person_transaction_id).scoped_to(:category_id).case_insensitive }
  end
end
