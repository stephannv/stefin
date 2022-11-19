require "rails_helper"

RSpec.describe Records::List, type: :operation do
  it "returns records ordered by occurrence date DESC, created_at DESC" do
    record_4 = create(:record, occurred_on: Time.zone.yesterday)
    record_1 = create(:record, occurred_on: Time.zone.tomorrow)
    record_2 = create(:record, occurred_on: Time.zone.today, created_at: Time.zone.today)
    record_3 = create(:record, occurred_on: Time.zone.today, created_at: Time.zone.yesterday)

    result = described_class.result

    expect(result.records.to_a).to eq [record_1, record_2, record_3, record_4]
  end
end
