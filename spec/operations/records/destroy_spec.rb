require "rails_helper"

RSpec.describe Records::Destroy, type: :operation do
  context "when record can be destroyed" do
    it "is successful" do
      record = create(:record)
      result = described_class.result(id: record.id)

      expect(result).to be_success
    end

    it "destroys record" do
      record = create(:record)
      result = described_class.result(id: record.id)

      expect(result.record).to be_destroyed
    end
  end

  context "when record cannot be destroyed" do
    it "fails" do
      record = create(:record)
      allow(Record).to receive(:find).with(record.id).and_return(record)
      allow(record).to receive(:destroy).and_return(false)

      result = described_class.result(id: record.id)

      expect(result).to be_failure
    end

    it "returns record" do
      record = create(:record)
      allow(Record).to receive(:find).with(record.id).and_return(record)
      allow(record).to receive(:destroy).and_return(false)

      result = described_class.result(id: record.id)

      expect(result.record).not_to be_destroyed
    end
  end

  context "when record with given id doesn't exist" do
    it "raises ActiveRecord::RecordNotFound error" do
      expect { described_class.result(id: "invalid-id") }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
