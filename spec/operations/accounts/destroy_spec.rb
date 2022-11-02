require "rails_helper"

RSpec.describe Accounts::Destroy, type: :operation do
  context "when account can be destroyed" do
    it "is successful" do
      account = create(:account)
      result = described_class.result(id: account.id)

      expect(result).to be_success
    end

    it "destroys account" do
      account = create(:account)
      result = described_class.result(id: account.id)

      expect(result.account).to be_destroyed
    end
  end

  context "when account cannot be destroyed" do
    it "fails" do
      account = create(:account)
      allow(Account).to receive(:find).with(account.id).and_return(account)
      allow(account).to receive(:destroy).and_return(false)

      result = described_class.result(id: account.id)

      expect(result).to be_failure
    end

    it "returns account" do
      account = create(:account)
      allow(Account).to receive(:find).with(account.id).and_return(account)
      allow(account).to receive(:destroy).and_return(false)

      result = described_class.result(id: account.id)

      expect(result.account).not_to be_destroyed
    end
  end

  context "when account with given id doesn't exist" do
    it "raises ActiveRecord::RecordNotFound error" do
      expect { described_class.result(id: "invalid-id") }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
