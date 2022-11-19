require "rails_helper"

RSpec.describe "Password reset", type: :system do
  it "resets user password" do
    user = create(:user, email: "test@test.com")
    user.forgot_password!

    visit edit_user_password_path(user, token: user.confirmation_token)

    expect(page).to have_css("h1", text: I18n.t("passwords.pages.edit.page_title"))

    fill_in I18n.t("helpers.label.password_reset.password"), with: "my-new-password"

    click_button I18n.t("helpers.submit.password_reset.submit")

    expect(page).to have_css("h1", text: I18n.t("records.pages.index.page_title"))
    expect(page).to have_link(I18n.t("app.sidebar.sign_out"), href: sign_out_path)
  end
end
