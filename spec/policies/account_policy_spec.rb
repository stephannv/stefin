require "rails_helper"

RSpec.describe AccountPolicy do
  describe "relation_scope" do
    it "returns user accounts" do
      user = create(:user)

      accounts = create_list(:account, 3, user: user)
      create_list(:account, 2) # another user accounts

      policy = described_class.new(user: user)
      scope = policy.apply_scope(Account.all, type: :active_record_relation)

      expect(scope.to_a).to match_array(accounts)
    end
  end

  describe "#show?" do
    context "when user is the account owner" do
      it "returns true" do
        user = create(:user)
        account = create(:account, user: user)
        policy = described_class.new(account, user: user)

        expect(policy.apply(:show?)).to be true
      end
    end

    context "when use isn't the account owner" do
      it "returns false" do
        user = create(:user)
        account = create(:account)
        policy = described_class.new(account, user: user)

        expect(policy.apply(:show?)).to be false
      end
    end
  end

  describe "#update?" do
    context "when user is the account owner" do
      it "returns true" do
        user = create(:user)
        account = create(:account, user: user)
        policy = described_class.new(account, user: user)

        expect(policy.apply(:update?)).to be true
      end
    end

    context "when use isn't the account owner" do
      it "returns false" do
        user = create(:user)
        account = create(:account)
        policy = described_class.new(account, user: user)

        expect(policy.apply(:update?)).to be false
      end
    end
  end

  describe "#destroy?" do
    context "when user is the account owner" do
      it "returns true" do
        user = create(:user)
        account = create(:account, user: user)
        policy = described_class.new(account, user: user)

        expect(policy.apply(:destroy?)).to be true
      end
    end

    context "when use isn't the account owner" do
      it "returns false" do
        user = create(:user)
        account = create(:account)
        policy = described_class.new(account, user: user)

        expect(policy.apply(:destroy?)).to be false
      end
    end
  end
end
