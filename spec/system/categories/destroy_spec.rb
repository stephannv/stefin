require "rails_helper"

RSpec.describe "Category destruction", type: :system do
  context "when category can be destroyed" do
    it "destroys category" do
      category = create(:category, title: "My category")

      visit categories_path

      click_link href: edit_category_path(category)

      accept_confirm(I18n.t("categories.components.form.destroy_confirm")) do
        click_link I18n.t("categories.components.form.destroy")
      end

      expect(page).to have_css("h1", text: I18n.t("categories.pages.index.page_title"))
      expect(page).to have_css(".toast .alert.alert-success", text: I18n.t("categories.destroy.success"))
      expect(page).not_to have_css(".card-title", text: "My category")
    end
  end

  context "when category cannot be destroyed" do
    it "shows error message" do
      category = create(:category, title: "My category")

      visit categories_path

      click_link href: edit_category_path(category)

      allow(Categories::Destroy).to receive(:result)
        .and_return(ServiceActor::Result.new(failure?: true, category: category))

      accept_confirm(I18n.t("categories.components.form.destroy_confirm")) do
        click_link I18n.t("categories.components.form.destroy")
      end

      expect(page).to have_css("h1", text: I18n.t("categories.pages.edit.page_title"))
      expect(page).to have_css(".toast .alert.alert-error", text: I18n.t("categories.destroy.error"))
    end
  end
end
