require "rails_helper"

RSpec.describe "Record creation", type: :system do
  context "with valid info" do
    it "creates a new record" do
      account = create(:account)
      category = create(:category)

      visit records_path

      click_link I18n.t("records.pages.index.new_record")

      expect(page).to have_css("h1", text: I18n.t("records.pages.new.page_title"))

      find("label[for='record_group_#{RecordGroups::EXPENSE}'").click
      select account.title, from: "record_account_id"
      select category.title, from: "record_category_id"
      fill_in I18n.t("activerecord.attributes.record.amount_cents"), with: "2000"
      fill_in I18n.t("activerecord.attributes.record.occurred_on"), with: "2020-01-01"
      fill_in I18n.t("activerecord.attributes.record.payee"), with: "Some Payee"
      fill_in I18n.t("activerecord.attributes.record.description"), with: "My description"

      click_button I18n.t("helpers.submit.create", model: I18n.t("activerecord.models.record"))

      expect(page).to have_css("h1", text: I18n.t("records.pages.index.page_title"))
      expect(page).to have_css(".toast .alert.border-success", text: I18n.t("records.create.success"))
    end
  end

  context "with invalid info" do
    it "renders input errors" do
      create(:account)
      create(:category)

      visit records_path

      click_link I18n.t("records.pages.index.new_record")

      expect(page).to have_css("h1", text: I18n.t("records.pages.new.page_title"))

      fill_in I18n.t("activerecord.attributes.record.amount_cents"), with: "0"

      click_button I18n.t("helpers.submit.create", model: I18n.t("activerecord.models.record"))

      expect(page).to have_css("h1", text: I18n.t("records.pages.new.page_title"))
      expect(page).to have_css(
        ".label .label-text-alt.text-error", text: I18n.t("errors.messages.greater_than", count: 0)
      )
    end
  end
end
