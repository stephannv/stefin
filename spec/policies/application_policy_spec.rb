require "rails_helper"
require "action_policy/rspec/be_an_alias_of"

RSpec.describe ApplicationPolicy do
  it "aliases edit? to update?" do
    policy = described_class.new(user: User.new)

    expect(:edit?).to be_an_alias_of(policy, :update?)
  end
end
