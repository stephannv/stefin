require "rails_helper"

RSpec.describe "Category creation", type: :system do
  context "with valid info" do
    it "creates a new category" do
      user = create(:user)

      visit categories_path(as: user)

      click_link I18n.t("categories.components.empty_state.new_category")

      expect(page).to have_css("h1", text: I18n.t("categories.pages.new.page_title"))

      fill_in I18n.t("activerecord.attributes.category.title"), with: "My category"
      find("label[for='category_color_#{Ds::ColorPicker::PALETTE.sample}'").click

      click_button I18n.t("helpers.submit.create", model: I18n.t("activerecord.models.category"))

      expect(page).to have_css("h1", text: I18n.t("categories.pages.index.page_title"))
      expect(page).to have_css(".toast .alert.border-success", text: I18n.t("categories.create.success"))
    end
  end

  context "with invalid info" do
    it "renders input errors" do
      user = create(:user)

      visit categories_path(as: user)

      click_link I18n.t("categories.components.empty_state.new_category")

      expect(page).to have_css("h1", text: I18n.t("categories.pages.new.page_title"))

      fill_in I18n.t("activerecord.attributes.category.title"), with: ""

      click_button I18n.t("helpers.submit.create", model: I18n.t("activerecord.models.category"))

      expect(page).to have_css("h1", text: I18n.t("categories.pages.new.page_title"))
      expect(page).to have_css(".label .label-text-alt.text-error", text: I18n.t("errors.messages.blank"))
    end
  end
end
