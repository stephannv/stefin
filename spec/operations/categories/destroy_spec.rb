require "rails_helper"

RSpec.describe Categories::Destroy, type: :operation do
  context "when category can be destroyed" do
    it "is successful" do
      category = create(:category)
      result = described_class.result(id: category.id)

      expect(result).to be_success
    end

    it "destroys category" do
      category = create(:category)
      result = described_class.result(id: category.id)

      expect(result.category).to be_destroyed
    end
  end

  context "when category cannot be destroyed" do
    it "fails" do
      category = create(:category)
      allow(Category).to receive(:find).with(category.id).and_return(category)
      allow(category).to receive(:destroy).and_return(false)

      result = described_class.result(id: category.id)

      expect(result).to be_failure
    end

    it "returns category" do
      category = create(:category)
      allow(Category).to receive(:find).with(category.id).and_return(category)
      allow(category).to receive(:destroy).and_return(false)

      result = described_class.result(id: category.id)

      expect(result.category).not_to be_destroyed
    end
  end

  context "when category with given id doesn't exist" do
    it "raises ActiveRecord::RecordNotFound error" do
      expect { described_class.result(id: "invalid-id") }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
