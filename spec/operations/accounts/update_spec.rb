require "rails_helper"

RSpec.describe Accounts::Update, type: :operation do
  context "with valid attributes" do
    it "is successful" do
      account = create(:account)
      result = described_class.result(id: account.id, attributes: {title: "New title"})

      expect(result).to be_success
    end

    it "updates account" do
      account = create(:account, title: "Old title")
      described_class.result(id: account.id, attributes: {title: "New title"})

      expect(account.reload.title).to eq "New title"
    end
  end

  context "with invalid attributes" do
    it "fails" do
      account = create(:account)
      result = described_class.result(id: account.id, attributes: {title: ""})

      expect(result).to be_failure
    end

    it "returns invalid account" do
      account = create(:account, title: "Old title")
      result = described_class.result(id: account.id, attributes: {title: ""})

      expect(result.account).to be_invalid
    end
  end

  context "when account with given id doesn't exist" do
    it "raises ActiveRecord::RecordNotFound error" do
      expect do
        described_class.result(id: "invalid-id", attributes: {title: "New title"})
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
