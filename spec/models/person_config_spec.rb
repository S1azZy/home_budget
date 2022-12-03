# frozen_string_literal: true

RSpec.describe PersonConfig do
  subject(:model) { build(:person_config) }

  describe "associations" do
    it { is_expected.to belong_to(:person) }
    it { is_expected.to belong_to(:default_currency) }
  end
end
