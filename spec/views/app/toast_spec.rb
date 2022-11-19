require "rails_helper"

RSpec.describe App::Toast, type: :view do
  context "when flash type is notice" do
    it "renders success toast" do
      result = render(described_class.new(flash: {"notice" => "Some message"}))

      expect(result.to_html).to have_css("div.alert.border-success", text: "Some message")
    end
  end

  context "when flash type is alert" do
    it "renders error toast" do
      result = render(described_class.new(flash: {"alert" => "Some message"}))

      expect(result.to_html).to have_css("div.alert.border-error", text: "Some message")
    end
  end
end
