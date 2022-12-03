# frozen_string_literal: true

require "rails_helper"

RSpec.describe Currency do
  subject { build(:currency) }

  describe "associations" do
    it { is_expected.to have_many(:documents_expense_operations).dependent(:restrict_with_error) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(50) }
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_length_of(:code).is_equal_to(3) }
    it { is_expected.to validate_uniqueness_of(:code).case_insensitive }
    it { is_expected.to validate_presence_of(:symbol) }
    it { is_expected.to validate_length_of(:symbol).is_at_most(20) }
    it { is_expected.to validate_presence_of(:symbol_native) }
    it { is_expected.to validate_length_of(:symbol_native).is_at_most(20) }
  end
end
