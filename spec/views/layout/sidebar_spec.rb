require "rails_helper"

RSpec.describe Layout::Sidebar, type: :view do
  it "renders accounts menu" do
    result = render(described_class.new)

    expect(result).to have_link(I18n.t("layout.sidebar.accounts"), href: accounts_path)
  end
end
