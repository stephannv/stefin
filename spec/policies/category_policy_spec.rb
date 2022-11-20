require "rails_helper"

RSpec.describe CategoryPolicy do
  describe "relation_scope" do
    it "returns user categories" do
      user = create(:user)

      categories = create_list(:category, 3, user: user)
      create_list(:category, 2) # another user categories

      policy = described_class.new(user: user)
      scope = policy.apply_scope(Category.all, type: :active_record_relation)

      expect(scope.to_a).to match_array(categories)
    end
  end

  describe "#show?" do
    context "when user is the category owner" do
      it "returns true" do
        user = create(:user)
        category = create(:category, user: user)
        policy = described_class.new(category, user: user)

        expect(policy.apply(:show?)).to be true
      end
    end

    context "when use isn't the category owner" do
      it "returns false" do
        user = create(:user)
        category = create(:category)
        policy = described_class.new(category, user: user)

        expect(policy.apply(:show?)).to be false
      end
    end
  end

  describe "#update?" do
    context "when user is the category owner" do
      it "returns true" do
        user = create(:user)
        category = create(:category, user: user)
        policy = described_class.new(category, user: user)

        expect(policy.apply(:update?)).to be true
      end
    end

    context "when use isn't the category owner" do
      it "returns false" do
        user = create(:user)
        category = create(:category)
        policy = described_class.new(category, user: user)

        expect(policy.apply(:update?)).to be false
      end
    end
  end

  describe "#destroy?" do
    context "when user is the category owner" do
      it "returns true" do
        user = create(:user)
        category = create(:category, user: user)
        policy = described_class.new(category, user: user)

        expect(policy.apply(:destroy?)).to be true
      end
    end

    context "when use isn't the category owner" do
      it "returns false" do
        user = create(:user)
        category = create(:category)
        policy = described_class.new(category, user: user)

        expect(policy.apply(:destroy?)).to be false
      end
    end
  end
end
