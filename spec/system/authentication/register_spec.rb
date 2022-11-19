require "rails_helper"

RSpec.describe "Register user", type: :system do
  context "with valid credentials" do
    it "registers user" do
      visit sign_in_path

      click_link(I18n.t("sessions.pages.new.sign_up"))

      expect(page).to have_css("h1", text: I18n.t("users.pages.new.page_title"))

      fill_in I18n.t("helpers.label.session.email"), with: "test@test.com"
      fill_in I18n.t("helpers.label.session.password"), with: "test123"

      click_button I18n.t("helpers.submit.user.create")

      expect(page).to have_css("h1", text: I18n.t("records.pages.index.page_title"))
      expect(page).to have_link(I18n.t("app.sidebar.sign_out"), href: sign_out_path)
    end
  end

  context "with invalid credentials" do
    it "doesn't register user" do
      visit sign_in_path

      click_link(I18n.t("sessions.pages.new.sign_up"))

      expect(page).to have_css("h1", text: I18n.t("users.pages.new.page_title"))

      fill_in I18n.t("helpers.label.session.email"), with: "test@test.com"
      fill_in I18n.t("helpers.label.session.password"), with: ""

      click_button I18n.t("helpers.submit.user.create")

      expect(page).to have_css("h1", text: I18n.t("users.pages.new.page_title"))
      expect(page).to have_css(".label .label-text-alt.text-error", text: I18n.t("errors.messages.blank"))
    end
  end
end
