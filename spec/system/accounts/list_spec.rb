require "rails_helper"

RSpec.describe "Accounts list", type: :system do
  it "has link to create account" do
    visit accounts_path

    expect(page).to have_css("h1", text: I18n.t("accounts.pages.index.page_title"))

    expect(page).to have_link(I18n.t("accounts.pages.index.new_account"), href: new_account_path)
  end
end
