require "rails_helper"

RSpec.describe "Records list", type: :system do
  context "when has records" do
    it "has link to create record" do
      create(:record)

      visit records_path

      expect(page).to have_css("h1", text: I18n.t("records.pages.index.page_title"))

      expect(page).to have_link(I18n.t("records.pages.index.new_record"), href: new_record_path)
    end

    it "lists records" do
      account = create(:account, title: "My Account", color: "#ff0000")
      category = create(:category, title: "My Category", color: "#0000ff")
      create(:record, :expense,
        account: account,
        category: category,
        amount_cents: 1999,
        description: "My desc")

      another_account = create(:account, title: "Another Account", color: "#ff00ff")
      another_category = create(:category, title: "Another Category", color: "#00ff00")
      create(:record, :income,
        account: another_account,
        category: another_category,
        amount_cents: 3549,
        description: "Another desc")

      visit records_path

      expect(page).to have_css("div", style: "background-color: #0000ff")
      expect(page).to have_css("div", text: "My Category")
      expect(page).to have_css("div", style: "background-color: #ff0000")
      expect(page).to have_css("div", text: "My Account")
      expect(page).to have_css("div", text: "Payee")
      expect(page).to have_css("div", text: "My desc")
      expect(page).to have_css("span.text-error", text: "-1999")

      expect(page).to have_css("div", style: "background-color: #00ff00")
      expect(page).to have_css("div", text: "Another Category")
      expect(page).to have_css("div", style: "background-color: #ff00ff")
      expect(page).to have_css("div", text: "Another Account")
      expect(page).to have_css("div", text: "Payee")
      expect(page).to have_css("div", text: "Another desc")
      expect(page).to have_css("span.text-success", text: "+3549")
    end
  end

  context "when has no records" do
    it "has link to create record" do
      visit records_path

      expect(page).to have_css("h1", text: I18n.t("records.pages.index.page_title"))

      expect(page).to have_link(I18n.t("records.components.empty_state.new_record"), href: new_record_path)
    end

    it "shows empty state" do
      visit records_path

      expect(page).to have_css(".text-xl", text: I18n.t("records.components.empty_state.title"))
      expect(page).to have_content(I18n.t("records.components.empty_state.description"))
    end
  end
end
