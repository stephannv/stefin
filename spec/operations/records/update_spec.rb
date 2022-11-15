require "rails_helper"

RSpec.describe Records::Update, type: :operation do
  context "with valid attributes" do
    it "is successful" do
      record = create(:record)
      result = described_class.result(id: record.id, attributes: {amount_cents: 2500})

      expect(result).to be_success
    end

    it "updates record" do
      record = create(:record, amount_cents: 2000)
      described_class.result(id: record.id, attributes: {amount_cents: 3000})

      expect(record.reload.amount_cents).to eq 3000
    end
  end

  context "with invalid attributes" do
    it "fails" do
      record = create(:record)
      result = described_class.result(id: record.id, attributes: {amount_cents: 0})

      expect(result).to be_failure
    end

    it "returns invalid record" do
      record = create(:record, amount_cents: 2000)
      result = described_class.result(id: record.id, attributes: {amount_cents: 0})

      expect(result.record).to be_invalid
    end
  end

  context "when record with given id doesn't exist" do
    it "raises ActiveRecord::RecordNotFound error" do
      expect do
        described_class.result(id: "invalid-id", attributes: {amount_cents: 3000})
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
