require "rails_helper"

RSpec.describe Accounts::Find, type: :operation do
  context "when account with given id exists" do
    it "is successful" do
      account = create(:account)
      result = described_class.result(id: account.id)

      expect(result).to be_success
    end

    it "returns found account" do
      account = create(:account)
      result = described_class.result(id: account.id)

      expect(result.account).to eq account
    end
  end

  context "when account with given id doesn't exist" do
    it "raises ActiveRecord::RecordNotFound error" do
      expect { described_class.result(id: "invalid-id") }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
