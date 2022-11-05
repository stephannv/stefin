require "rails_helper"

RSpec.describe "Category update", type: :system do
  context "with valid info" do
    it "update category info" do
      category = create(:category, title: "My category")

      visit categories_path

      click_link href: edit_category_path(category)

      expect(page).to have_css("h1", text: I18n.t("categories.pages.edit.page_title"))

      fill_in I18n.t("activerecord.attributes.category.title"), with: "Updated title"
      fill_in I18n.t("activerecord.attributes.category.color"), with: "#ff00ff"

      click_button I18n.t("helpers.submit.update", model: I18n.t("activerecord.models.category"))

      expect(page).to have_css("h1", text: I18n.t("categories.pages.index.page_title"))
      expect(page).to have_css(".toast .alert.alert-success", text: I18n.t("categories.update.success"))
      expect(page).to have_css("h1", text: "Updated title")
    end
  end

  context "with invalid info" do
    it "renders input errors" do
      category = create(:category, title: "My category")

      visit categories_path

      click_link href: edit_category_path(category)

      expect(page).to have_css("h1", text: I18n.t("categories.pages.edit.page_title"))

      fill_in I18n.t("activerecord.attributes.category.title"), with: ""
      fill_in I18n.t("activerecord.attributes.category.color"), with: "invalid-color"

      click_button I18n.t("helpers.submit.update", model: I18n.t("activerecord.models.category"))

      expect(page).to have_css("h1", text: I18n.t("categories.pages.edit.page_title"))
      expect(page).to have_css(".label .label-text-alt.text-error", text: I18n.t("errors.messages.blank"))
      expect(page).to have_css(".label .label-text-alt.text-error", text: I18n.t("errors.messages.invalid"))
    end
  end
end