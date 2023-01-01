# frozen_string_literal: true

require "rails_helper"

RSpec.describe PersonCurrency do
  subject(:model) { build(:person_currency) }

  describe "associations" do
    it { is_expected.to belong_to(:person) }
    it { is_expected.to belong_to(:currency) }
  end

  describe "validations" do
    it { is_expected.to validate_uniqueness_of(:person_id).scoped_to(:currency_id).case_insensitive }

    it {
      expect(model)
        .to validate_numericality_of(:multiplicity).is_greater_than(0).is_less_than_or_equal_to(100_000)
    }
  end
end
