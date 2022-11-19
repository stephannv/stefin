require "rails_helper"

RSpec.describe "Categories list", type: :system do
  context "when has categories" do
    it "has link to create category" do
      user = create(:user)
      create(:category, title: "Category A")

      visit categories_path(as: user)

      expect(page).to have_css("h1", text: I18n.t("categories.pages.index.page_title"))

      expect(page).to have_link(I18n.t("categories.pages.index.new_category"), href: new_category_path)
    end

    it "lists categories" do
      user = create(:user)
      create(:category, title: "Category A")
      create(:category, title: "Category B")

      visit categories_path(as: user)

      expect(page).to have_css("div", text: "Category A")
      expect(page).to have_css("div", text: "Category B")
    end
  end

  context "when has no categories" do
    it "has link to create category" do
      user = create(:user)

      visit categories_path(as: user)

      expect(page).to have_css("h1", text: I18n.t("categories.pages.index.page_title"))

      expect(page).to have_link(I18n.t("categories.components.empty_state.new_category"), href: new_category_path)
    end

    it "shows empty state" do
      user = create(:user)

      visit categories_path(as: user)

      expect(page).to have_css(".text-xl", text: I18n.t("categories.components.empty_state.title"))
      expect(page).to have_content(I18n.t("categories.components.empty_state.description"))
    end
  end
end
