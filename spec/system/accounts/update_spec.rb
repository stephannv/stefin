require "rails_helper"

RSpec.describe "Account update", type: :system do
  context "with valid info" do
    it "update account info" do
      account = create(:account, title: "My account")

      visit accounts_path

      click_link href: edit_account_path(account)

      expect(page).to have_css("h1", text: I18n.t("accounts.pages.edit.page_title"))

      fill_in I18n.t("activerecord.attributes.account.title"), with: "Updated title"
      find("label[for='account_color_#{Ds::ColorPicker::PALETTE.sample}'").click

      click_button I18n.t("helpers.submit.update", model: I18n.t("activerecord.models.account"))

      expect(page).to have_css("h1", text: I18n.t("accounts.pages.index.page_title"))
      expect(page).to have_css(".toast .alert.border-success", text: I18n.t("accounts.update.success"))
      expect(page).to have_css("div", text: "Updated title")
    end
  end

  context "with invalid info" do
    it "renders input errors" do
      account = create(:account, title: "My account")

      visit accounts_path

      click_link href: edit_account_path(account)

      expect(page).to have_css("h1", text: I18n.t("accounts.pages.edit.page_title"))

      fill_in I18n.t("activerecord.attributes.account.title"), with: ""

      click_button I18n.t("helpers.submit.update", model: I18n.t("activerecord.models.account"))

      expect(page).to have_css("h1", text: I18n.t("accounts.pages.edit.page_title"))
      expect(page).to have_css(".label .label-text-alt.text-error", text: I18n.t("errors.messages.blank"))
    end
  end
end
