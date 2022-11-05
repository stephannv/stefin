require "rails_helper"

RSpec.describe Category, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:color) }

    it do
      create(:category)
      is_expected.to validate_uniqueness_of(:title)
    end

    it { is_expected.to validate_length_of(:title).is_at_most(50) }

    it { is_expected.to allow_value("#FF00aa").for(:color) }
    it { is_expected.not_to allow_value("FF00aa").for(:color) }
    it { is_expected.not_to allow_value("#fff").for(:color) }
    it { is_expected.not_to allow_value("#ff00aaff").for(:color) }
    it { is_expected.not_to allow_value("#ff00zz").for(:color) }
    it { is_expected.not_to allow_value("random value").for(:color) }
    it { is_expected.not_to allow_value("").for(:color) }
  end
end
