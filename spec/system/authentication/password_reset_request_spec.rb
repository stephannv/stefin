require "rails_helper"

RSpec.describe "Password reset request", type: :system do
  it "sends email with reset instructions" do
    user = create(:user, email: "test@test.com")

    visit sign_in_path

    click_link(I18n.t("sessions.pages.new.forgot_password"))

    expect(page).to have_css("h1", text: I18n.t("passwords.pages.new.page_title"))

    fill_in I18n.t("helpers.label.password.email"), with: "test@test.com"

    click_button I18n.t("helpers.submit.password.submit")

    expect(page).to have_css("h1", text: I18n.t("passwords.pages.create.page_title"))
    expect(page).to have_text(I18n.t("passwords.pages.create.description"))

    mail = ActionMailer::Base.deliveries.find { |mail| mail.to.include?("test@test.com") }
    expect(mail.subject).to eq I18n.t("clearance.models.clearance_mailer.change_password")
    expect(mail.html_part.to_s).to have_text(I18n.t("clearance_mailer.change_password.opening"))
    expect(mail.html_part.to_s).to have_text(I18n.t("clearance_mailer.change_password.closing"))
    edit_password_url = edit_user_password_url(user, token: user.reload.confirmation_token)
    expect(mail.html_part.to_s).to include(edit_password_url)
  end
end
