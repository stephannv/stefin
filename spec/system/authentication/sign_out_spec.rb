require "rails_helper"

RSpec.describe "Sign out", type: :system do
  it "signs user out" do
    user = create(:user)

    visit root_path(as: user)

    click_link I18n.t("app.sidebar.sign_out")

    expect(page).to have_css("h1", text: I18n.t("sessions.pages.new.page_title"))
  end
end
