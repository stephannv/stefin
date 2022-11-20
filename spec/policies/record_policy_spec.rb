require "rails_helper"

RSpec.describe RecordPolicy do
  describe "relation_scope" do
    it "returns user records" do
      user = create(:user)

      records = create_list(:record, 3, user: user)
      create_list(:record, 2) # another user records

      policy = described_class.new(user: user)
      scope = policy.apply_scope(Record.all, type: :active_record_relation)

      expect(scope.to_a).to match_array(records)
    end
  end

  describe "#update?" do
    context "when user is the record owner" do
      it "returns true" do
        user = create(:user)
        record = create(:record, user: user)
        policy = described_class.new(record, user: user)

        expect(policy.apply(:update?)).to be true
      end
    end

    context "when use isn't the record owner" do
      it "returns false" do
        user = create(:user)
        record = create(:record)
        policy = described_class.new(record, user: user)

        expect(policy.apply(:update?)).to be false
      end
    end
  end

  describe "#destroy?" do
    context "when user is the record owner" do
      it "returns true" do
        user = create(:user)
        record = create(:record, user: user)
        policy = described_class.new(record, user: user)

        expect(policy.apply(:destroy?)).to be true
      end
    end

    context "when use isn't the record owner" do
      it "returns false" do
        user = create(:user)
        record = create(:record)
        policy = described_class.new(record, user: user)

        expect(policy.apply(:destroy?)).to be false
      end
    end
  end
end
