require "rails_helper"

RSpec.describe "Accounts list", type: :system do
  context "when has accounts" do
    it "has link to create account" do
      user = create(:user)
      create(:account, title: "Account A")

      visit accounts_path(as: user)

      expect(page).to have_css("h1", text: I18n.t("accounts.pages.index.page_title"))

      expect(page).to have_link(I18n.t("accounts.pages.index.new_account"), href: new_account_path)
    end

    it "lists accounts" do
      user = create(:user)
      create(:account, title: "Account A", balance_cents: 3000)
      create(:account, title: "Account B", balance_cents: -5000)

      visit accounts_path(as: user)

      expect(page).to have_css("div", text: "Account A")
      expect(page).to have_css("div", text: "R$30,00")
      expect(page).to have_css("div", text: "Account B")
      expect(page).to have_css("div", text: "-R$50,00")
    end
  end

  context "when has no accounts" do
    it "has link to create account" do
      user = create(:user)

      visit accounts_path(as: user)

      expect(page).to have_css("h1", text: I18n.t("accounts.pages.index.page_title"))

      expect(page).to have_link(I18n.t("accounts.components.empty_state.new_account"), href: new_account_path)
    end

    it "shows empty state" do
      user = create(:user)

      visit accounts_path(as: user)

      expect(page).to have_css(".text-xl", text: I18n.t("accounts.components.empty_state.title"))
      expect(page).to have_content(I18n.t("accounts.components.empty_state.description"))
    end
  end
end
