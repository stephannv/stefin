require "rails_helper"

RSpec.describe "Account destruction", type: :system do
  context "when account can be destroyed" do
    it "destroys account" do
      user = create(:user)
      account = create(:account, user: user, title: "My account")

      visit accounts_path(as: user)

      click_link href: edit_account_path(account)

      accept_confirm(I18n.t("accounts.pages.edit.destroy_confirm")) do
        click_link I18n.t("accounts.pages.edit.destroy")
      end

      expect(page).to have_css("h1", text: I18n.t("accounts.pages.index.page_title"))
      expect(page).to have_css(".toast .alert.border-success", text: I18n.t("accounts.destroy.success"))
      expect(page).not_to have_css(".card-title", text: "My account")
    end
  end

  context "when account cannot be destroyed" do
    it "shows error message" do
      user = create(:user)
      account = create(:account, user: user, title: "My account")

      visit accounts_path(as: user)

      click_link href: edit_account_path(account)

      allow(Accounts::Destroy).to receive(:result)
        .and_return(ServiceActor::Result.new(failure?: true, account: account))

      accept_confirm(I18n.t("accounts.pages.edit.destroy_confirm")) do
        click_link I18n.t("accounts.pages.edit.destroy")
      end

      expect(page).to have_css("h1", text: I18n.t("accounts.pages.edit.page_title"))
      expect(page).to have_css(".toast .alert.border-error", text: I18n.t("accounts.destroy.error"))
    end
  end
end
