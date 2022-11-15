require "rails_helper"

RSpec.describe Accounts::List, type: :operation do
  it "returns accounts ordered by creation date ASC" do
    account_3 = create(:account, created_at: Time.zone.tomorrow)
    account_1 = create(:account, created_at: Time.zone.yesterday)
    account_2 = create(:account, created_at: Time.zone.today)

    result = described_class.result

    expect(result.accounts.to_a).to eq [account_1, account_2, account_3]
  end
end
