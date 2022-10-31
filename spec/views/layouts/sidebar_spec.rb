require "rails_helper"

RSpec.describe Layouts::Sidebar, type: :view do
  it "renders accounts menu" do
    result = render(described_class.new)

    expect(result).to have_link(I18n.t("layouts.sidebar.accounts"), href: accounts_path)
  end
end
