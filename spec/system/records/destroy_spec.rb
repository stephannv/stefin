require "rails_helper"

RSpec.describe "Record destruction", type: :system do
  context "when record can be destroyed" do
    it "destroys record" do
      user = create(:user)
      record = create(:record, amount_cents: 9000)

      visit records_path(as: user)

      click_link href: edit_record_path(record)

      accept_confirm(I18n.t("records.pages.edit.destroy_confirm")) do
        click_link I18n.t("records.pages.edit.destroy")
      end

      expect(page).to have_css("h1", text: I18n.t("records.pages.index.page_title"))
      expect(page).to have_css(".toast .alert.border-success", text: I18n.t("records.destroy.success"))
      expect(page).not_to have_css(".card-title", text: "9000")
    end
  end

  context "when record cannot be destroyed" do
    it "shows error message" do
      user = create(:user)
      record = create(:record, amount_cents: 9000)

      visit records_path(as: user)

      click_link href: edit_record_path(record)

      allow(Records::Destroy).to receive(:result)
        .and_return(ServiceActor::Result.new(failure?: true, record: record))

      accept_confirm(I18n.t("records.pages.edit.destroy_confirm")) do
        click_link I18n.t("records.pages.edit.destroy")
      end

      expect(page).to have_css("h1", text: I18n.t("records.pages.edit.page_title"))
      expect(page).to have_css(".toast .alert.border-error", text: I18n.t("records.destroy.error"))
    end
  end
end
