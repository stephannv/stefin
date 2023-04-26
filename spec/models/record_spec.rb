require "rails_helper"

RSpec.describe Record, type: :model do
  describe "monetization" do
    it "monetizes amount attributes" do
      account = described_class.new(amount_cents: 10, amount_currency: "CAD")
      expect(account.amount).to eq Money.new(10, "CAD")
    end
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:account_id) }
    it { is_expected.to validate_presence_of(:amount_currency) }
    it { is_expected.to validate_presence_of(:occurred_on) }

    it { is_expected.to validate_numericality_of(:amount_cents).is_greater_than(0) }

    it { is_expected.to validate_length_of(:payee).is_at_most(30) }
    it { is_expected.to validate_length_of(:description).is_at_most(50) }
  end
end
