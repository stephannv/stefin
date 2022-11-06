require "rails_helper"

RSpec.describe Categories::Update, type: :operation do
  context "with valid attributes" do
    it "is successful" do
      category = create(:category)
      result = described_class.result(id: category.id, attributes: {title: "New title"})

      expect(result).to be_success
    end

    it "updates category" do
      category = create(:category, title: "Old title")
      described_class.result(id: category.id, attributes: {title: "New title"})

      expect(category.reload.title).to eq "New title"
    end
  end

  context "with invalid attributes" do
    it "fails" do
      category = create(:category)
      result = described_class.result(id: category.id, attributes: {title: ""})

      expect(result).to be_failure
    end

    it "returns invalid category" do
      category = create(:category, title: "Old title")
      result = described_class.result(id: category.id, attributes: {title: ""})

      expect(result.category).to be_invalid
    end
  end

  context "when category with given id doesn't exist" do
    it "raises ActiveRecord::RecordNotFound error" do
      expect do
        described_class.result(id: "invalid-id", attributes: {title: "New title"})
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
