require "rails_helper"

RSpec.describe Categories::List, type: :operation do
  it "returns categories ordered by creation date ASC" do
    category_3 = create(:category, created_at: Time.zone.tomorrow)
    category_1 = create(:category, created_at: Time.zone.yesterday)
    category_2 = create(:category, created_at: Time.zone.today)

    result = described_class.result

    expect(result.categories.to_a).to eq [category_1, category_2, category_3]
  end
end
