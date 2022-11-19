require "rails_helper"

RSpec.describe "Record update", type: :system do
  context "with valid info" do
    it "update record info" do
      user = create(:user)
      record = create(:record, amount_cents: 2000)

      visit records_path(as: user)

      click_link href: edit_record_path(record)

      expect(page).to have_css("h1", text: I18n.t("records.pages.edit.page_title"))

      fill_in I18n.t("activerecord.attributes.record.amount_cents"), with: "3000"

      click_button I18n.t("helpers.submit.update", model: I18n.t("activerecord.models.record"))

      expect(page).to have_css("h1", text: I18n.t("records.pages.index.page_title"))
      expect(page).to have_css(".toast .alert.border-success", text: I18n.t("records.update.success"))
      expect(page).to have_css("div", text: "R$30,00")
    end
  end

  context "with invalid info" do
    it "renders input errors" do
      user = create(:user)
      record = create(:record, amount_cents: 2000)

      visit records_path(as: user)

      click_link href: edit_record_path(record)

      expect(page).to have_css("h1", text: I18n.t("records.pages.edit.page_title"))

      fill_in I18n.t("activerecord.attributes.record.amount_cents"), with: "0"

      click_button I18n.t("helpers.submit.update", model: I18n.t("activerecord.models.record"))

      expect(page).to have_css("h1", text: I18n.t("records.pages.edit.page_title"))
      expect(page).to have_css(".label .label-text-alt.text-error", text: I18n.t("errors.messages.greater_than", count: 0))
    end
  end
end
