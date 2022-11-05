require "rails_helper"

RSpec.describe "Category creation", type: :system do
  context "with valid info" do
    it "creates a new category" do
      visit categories_path

      click_link I18n.t("categories.components.empty_state.new_category")

      expect(page).to have_css("h1", text: I18n.t("categories.pages.new.page_title"))

      fill_in I18n.t("activerecord.attributes.category.title"), with: "My category"
      fill_in I18n.t("activerecord.attributes.category.color"), with: "#ff0000"

      click_button I18n.t("helpers.submit.create", model: I18n.t("activerecord.models.category"))

      expect(page).to have_css("h1", text: I18n.t("categories.pages.index.page_title"))
      expect(page).to have_css(".toast .alert.alert-success", text: I18n.t("categories.create.success"))
    end
  end

  context "with invalid info" do
    it "renders input errors" do
      visit categories_path

      click_link I18n.t("categories.components.empty_state.new_category")

      expect(page).to have_css("h1", text: I18n.t("categories.pages.new.page_title"))

      fill_in I18n.t("activerecord.attributes.category.title"), with: ""
      fill_in I18n.t("activerecord.attributes.category.color"), with: "#not-valid"

      click_button I18n.t("helpers.submit.create", model: I18n.t("activerecord.models.category"))

      expect(page).to have_css("h1", text: I18n.t("categories.pages.new.page_title"))
      expect(page).to have_css(".label .label-text-alt.text-error", text: I18n.t("errors.messages.blank"))
      expect(page).to have_css(".label .label-text-alt.text-error", text: I18n.t("errors.messages.invalid"))
    end
  end
end
