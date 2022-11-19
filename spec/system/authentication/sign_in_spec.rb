require "rails_helper"

RSpec.describe "Sign in", type: :system do
  context "with valid credentials" do
    it "signs user in" do
      create(:user, email: "test@test.com", password: "test123")

      visit root_path

      expect(page).to have_css("h1", text: I18n.t("sessions.pages.new.page_title"))

      fill_in I18n.t("helpers.label.session.email"), with: "test@test.com"
      fill_in I18n.t("helpers.label.session.password"), with: "test123"

      click_button I18n.t("helpers.submit.session.submit")

      expect(page).to have_css("h1", text: I18n.t("records.pages.index.page_title"))
      expect(page).to have_link(I18n.t("app.sidebar.sign_out"), href: sign_out_path)
    end
  end

  context "with invalid credentials" do
    it "doesn't sign user in" do
      create(:user, email: "test@test.com", password: "test123")

      visit root_path

      expect(page).to have_css("h1", text: I18n.t("sessions.pages.new.page_title"))

      fill_in I18n.t("helpers.label.session.email"), with: "test@test.com"
      fill_in I18n.t("helpers.label.session.password"), with: "wrong-password"

      click_button I18n.t("helpers.submit.session.submit")

      expect(page).to have_css("h1", text: I18n.t("sessions.pages.new.page_title"))
      expect(page).to have_css(".toast .alert.border-error", text: I18n.t("flashes.failure_after_create"))
    end
  end
end
