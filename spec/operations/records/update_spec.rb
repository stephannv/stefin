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

  context "when updates amount" do
    it "updates account balance" do
      account = create(:account, balance_cents: -1000)

      record = create(:record, :expense, account: account, amount_cents: 3000)
      create(:record, :income, account: account, amount_cents: 2000)

      expect do
        described_class.result(id: record.id, attributes: {amount_cents: 4000})
      end.to change { account.reload.balance_cents }.from(-1000).to(-2000)
    end
  end

  context "when updates group" do
    it "updates account balance" do
      account = create(:account, balance_cents: -1000)

      record = create(:record, :expense, account: account, amount_cents: 3000)
      create(:record, :income, account: account, amount_cents: 2000)

      expect do
        described_class.result(id: record.id, attributes: {group: RecordGroups::INCOME})
      end.to change { account.reload.balance_cents }.from(-1000).to(5000)
    end
  end

  context "when updates account id" do
    it "updates new and previous account's balance" do
      account_a = create(:account, balance_cents: -1000)
      account_b = create(:account, balance_cents: 5000)

      record = create(:record, :expense, account: account_a, amount_cents: 3000)
      create(:record, :income, account: account_a, amount_cents: 2000)
      create(:record, :income, account: account_b, amount_cents: 5000)

      expect do
        described_class.result(id: record.id, attributes: {account_id: account_b.id})
      end.to(
        change { account_a.reload.balance_cents }.from(-1000).to(2000)
        .and(change { account_b.reload.balance_cents }.from(5000).to(2000))
      )
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

  context "when account balance update fails" do
    it "rollbacks record update" do
      record = create(:record, amount_cents: 2000)

      allow(Accounts::UpdateBalance).to receive(:call).with(id: record.account_id).and_raise("Some error")

      expect do
        described_class.result(id: record.id, attributes: {amount_cents: 3000})
      end.not_to change { record.reload.amount_cents }
    end
  end
end
