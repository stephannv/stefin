require "rails_helper"

RSpec.describe App::Sidebar, type: :view do
  it "renders accounts menu" do
    result = render(described_class.new)

    expect(result).to have_link(I18n.t("app.sidebar.accounts"), href: accounts_path)
  end
end
