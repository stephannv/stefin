require "rails_helper"

RSpec.describe "Accounts list", type: :system do
  it "visits accounts list page" do
    visit accounts_path

    expect(page).to have_css("h1", text: I18n.t("accounts.index_page.accounts"))
  end
end
