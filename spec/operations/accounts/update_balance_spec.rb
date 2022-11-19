require "rails_helper"

RSpec.describe Accounts::UpdateBalance, type: :operation do
  context "when update is successful" do
    it "is successful" do
      account = create(:account)
      create(:record, :income, account: account, amount_cents: 3000)

      result = described_class.result(id: account.id)

      expect(result).to be_success
    end

    it "updates account balance using account records" do
      account = create(:account)
      create(:record, :income, account: account, amount_cents: 3000)
      create(:record, :income, account: account, amount_cents: 1000)
      create(:record, :expense, account: account, amount_cents: 6000)
      create(:record, :expense, amount_cents: 5000) # another account record

      expect { described_class.result(id: account.id) }.to change { account.reload.balance_cents }.from(0).to(-2000)
    end
  end

  context "when update fails" do
    it "is failure" do
      account = create(:account)

      allow(Account).to receive(:find).with(account.id).and_return(account)
      allow(account).to receive(:update).and_return(false)

      result = described_class.result(id: account.id)

      expect(result).to be_failure
    end
  end

  context "when account with given id doesn't exist" do
    it "raises ActiveRecord::RecordNotFound error" do
      expect { described_class.result(id: "invalid-id") }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
