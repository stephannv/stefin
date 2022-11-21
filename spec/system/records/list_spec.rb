require "rails_helper"

RSpec.describe "Records list", type: :system do
  context "when has records" do
    it "has link to create record" do
      user = create(:user)
      create(:record, user: user)

      visit root_path(as: user)

      within "ul.menu" do
        click_link I18n.t("app.sidebar.records")
      end

      expect(page).to have_css("h1", text: I18n.t("records.pages.index.page_title"))

      expect(page).to have_link(I18n.t("records.pages.index.new_record"), href: new_record_path)
    end

    it "lists records" do
      user = create(:user)
      account = create(:account, user: user, title: "My Account", color: "#ff0000")
      category = create(:category, user: user, title: "My Category", color: "#0000ff")
      create(:record, :expense,
        account: account,
        category: category,
        amount_cents: 1999,
        payee: "My payee",
        description: "My desc")

      another_account = create(:account, user: user, title: "Another Account", color: "#ff00ff")
      another_category = create(:category, user: user, title: "Another Category", color: "#00ff00")
      create(:record, :income,
        account: another_account,
        category: another_category,
        amount_cents: 3549,
        payee: "Another payee",
        description: "Another desc")

      visit root_path(as: user)

      within "ul.menu" do
        click_link I18n.t("app.sidebar.records")
      end

      expect(page).to have_css("div", style: "background-color: #0000ff")
      expect(page).to have_css("div", text: "My Category")
      expect(page).to have_css("div", style: "background-color: #ff0000")
      expect(page).to have_css("div", text: "My Account")
      expect(page).to have_css("div", text: "My payee")
      expect(page).to have_css("div", text: "My desc")
      expect(page).to have_css("span.text-error", text: "-R$19,99")

      expect(page).to have_css("div", style: "background-color: #00ff00")
      expect(page).to have_css("div", text: "Another Category")
      expect(page).to have_css("div", style: "background-color: #ff00ff")
      expect(page).to have_css("div", text: "Another Account")
      expect(page).to have_css("div", text: "Another payee")
      expect(page).to have_css("div", text: "Another desc")
      expect(page).to have_css("span.text-success", text: "+R$35,49")
    end
  end

  context "when has no records" do
    it "has link to create record" do
      user = create(:user)

      visit records_path(as: user)

      expect(page).to have_css("h1", text: I18n.t("records.pages.index.page_title"))

      expect(page).to have_link(I18n.t("records.components.empty_state.new_record"), href: new_record_path)
    end

    it "shows empty state" do
      user = create(:user)

      visit records_path(as: user)

      expect(page).to have_css(".text-xl", text: I18n.t("records.components.empty_state.title"))
      expect(page).to have_content(I18n.t("records.components.empty_state.description"))
    end
  end
end
