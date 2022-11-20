require "rails_helper"

RSpec.describe Account, type: :model do
  describe "monetization" do
    it "monetizes balance attributes" do
      account = described_class.new(balance_cents: 10, balance_currency: "CAD")
      expect(account.balance).to eq Money.new(10, "CAD")
    end
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:balance_cents) }
    it { is_expected.to validate_presence_of(:balance_currency) }
    it { is_expected.to validate_presence_of(:color) }

    it do
      create(:account)
      is_expected.to validate_uniqueness_of(:title).scoped_to(:user_id)
    end

    it { is_expected.to validate_length_of(:title).is_at_most(50) }

    it { is_expected.to allow_value("#FF00aa").for(:color) }
    it { is_expected.not_to allow_value("FF00aa").for(:color) }
    it { is_expected.not_to allow_value("#fff").for(:color) }
    it { is_expected.not_to allow_value("#ff00aaff").for(:color) }
    it { is_expected.not_to allow_value("#ff00zz").for(:color) }
    it { is_expected.not_to allow_value("random value").for(:color) }
    it { is_expected.not_to allow_value("").for(:color) }
  end
end
