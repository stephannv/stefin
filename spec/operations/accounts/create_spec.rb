require "rails_helper"

RSpec.describe Accounts::Create, type: :operation do
  context "with valid attributes" do
    it "is successful" do
      attributes = {user_id: create(:user).id, title: "My account", color: "#ffffff"}
      result = described_class.result(attributes: attributes)

      expect(result).to be_success
    end

    it "creates a new account" do
      result = nil
      user = create(:user)
      attributes = {user_id: user.id, title: "My account", color: "#ffffff"}

      expect do
        result = described_class.result(attributes: attributes)
      end.to change(Account, :count).by(1)

      expect(result.account.attributes).to include({
        "user_id" => user.id, "title" => "My account", "color" => "#ffffff"
      })
    end
  end

  context "with invalid attributes" do
    it "fails" do
      result = described_class.result(attributes: {title: nil})

      expect(result).to be_failure
    end

    it "returns invalid account" do
      result = described_class.result(attributes: {title: nil})

      expect(result.account).to be_invalid
    end
  end
end
