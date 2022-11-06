require "rails_helper"

RSpec.describe Categories::Find, type: :operation do
  context "when category with given id exists" do
    it "is successful" do
      category = create(:category)
      result = described_class.result(id: category.id)

      expect(result).to be_success
    end

    it "returns found category" do
      category = create(:category)
      result = described_class.result(id: category.id)

      expect(result.category).to eq category
    end
  end

  context "when category with given id doesn't exist" do
    it "raises ActiveRecord::RecordNotFound error" do
      expect { described_class.result(id: "invalid-id") }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
