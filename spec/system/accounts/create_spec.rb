require "rails_helper"

RSpec.describe "Account creation", type: :system do
  context "with valid info" do
    it "creates a new account" do
      visit accounts_path

      click_link I18n.t("accounts.pages.index.new_account")

      expect(page).to have_css("h1", text: I18n.t("accounts.pages.new.page_title"))

      fill_in I18n.t("activerecord.attributes.account.title"), with: "My account"
      fill_in I18n.t("activerecord.attributes.account.color"), with: "#ff0000"

      click_button I18n.t("helpers.submit.create", model: I18n.t("activerecord.models.account"))

      expect(page).to have_css("h1", text: I18n.t("accounts.pages.index.page_title"))
      expect(page).to have_css(".toast .alert.alert-success", text: I18n.t("accounts.create.success"))
    end
  end

  context "with invalid info" do
    it "renders input errors" do
      visit accounts_path

      click_link I18n.t("accounts.pages.index.new_account")

      expect(page).to have_css("h1", text: I18n.t("accounts.pages.new.page_title"))

      fill_in I18n.t("activerecord.attributes.account.title"), with: ""
      fill_in I18n.t("activerecord.attributes.account.color"), with: "#not-valid"

      click_button I18n.t("helpers.submit.create", model: I18n.t("activerecord.models.account"))

      expect(page).to have_css("h1", text: I18n.t("accounts.pages.new.page_title"))
      expect(page).to have_css(".label .label-text-alt.text-rose-400", text: I18n.t("errors.messages.blank").capitalize)
      expect(page).to have_css(".label .label-text-alt.text-rose-400", text: I18n.t("errors.messages.invalid").capitalize)
    end
  end
end
