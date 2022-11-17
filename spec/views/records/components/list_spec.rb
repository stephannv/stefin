require "rails_helper"

RSpec.describe Records::Components::List, type: :view do
  it "renders records grouped by date" do
    jan_records = build_stubbed_list(:record, 3, :with_fake_id, occurred_on: Date.parse("2023-01-01"))
    may_records = build_stubbed_list(:record, 5, :with_fake_id, occurred_on: Date.parse("2023-05-01"))

    result = render(described_class.new(records: jan_records + may_records))

    expect(result.css("div[data-qa='2023-01-01']")).to have_css("a[href='#{edit_record_path(jan_records[0])}']")
      .and(have_css("a[href='#{edit_record_path(jan_records[1])}']"))
      .and(have_css("a[href='#{edit_record_path(jan_records[2])}']"))

    expect(result.css("div[data-qa='2023-05-01']")).to have_css("a[href='#{edit_record_path(may_records[0])}']")
      .and(have_css("a[href='#{edit_record_path(may_records[1])}']"))
      .and(have_css("a[href='#{edit_record_path(may_records[2])}']"))
  end
end
