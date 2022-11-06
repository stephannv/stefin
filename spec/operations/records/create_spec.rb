require "rails_helper"

RSpec.describe Records::Create, type: :operation do
  context "with valid attributes" do
    it "is successful" do
      account = create(:account)
      category = create(:category)
      attributes = {
        group: RecordGroups::EXPENSE,
        account_id: account.id,
        category_id: category.id,
        amount_cents: 1000,
        occurred_on: Time.zone.today
      }
      result = described_class.result(attributes: attributes)

      expect(result).to be_success
    end

    it "creates a new record" do
      result = nil
      account = create(:account)
      category = create(:category)
      attributes = {
        group: RecordGroups::EXPENSE,
        account_id: account.id,
        category_id: category.id,
        amount_cents: 1000,
        occurred_on: Time.zone.today
      }
      expect do
        result = described_class.result(attributes: attributes)
      end.to change(Record, :count).by(1)

      expect(result.record.attributes).to include(attributes.stringify_keys)
    end
  end

  context "with invalid attributes" do
    it "fails" do
      result = described_class.result(attributes: {amount_cents: nil})

      expect(result).to be_failure
    end

    it "returns invalid record" do
      result = described_class.result(attributes: {amount_cents: nil})

      expect(result.record).to be_invalid
    end
  end
end
