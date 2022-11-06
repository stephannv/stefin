require "rails_helper"

RSpec.describe Categories::Create, type: :operation do
  context "with valid attributes" do
    it "is successful" do
      result = described_class.result(attributes: {title: "My category", color: "#ffffff"})

      expect(result).to be_success
    end

    it "creates a new category" do
      result = nil

      expect do
        result = described_class.result(attributes: {title: "My category", color: "#ffffff"})
      end.to change(Category, :count).by(1)

      expect(result.category.attributes).to include({"title" => "My category", "color" => "#ffffff"})
    end
  end

  context "with invalid attributes" do
    it "fails" do
      result = described_class.result(attributes: {title: nil})

      expect(result).to be_failure
    end

    it "returns invalid category" do
      result = described_class.result(attributes: {title: nil})

      expect(result.category).to be_invalid
    end
  end
end
