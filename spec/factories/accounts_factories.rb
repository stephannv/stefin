FactoryBot.define do
  factory :account do
    sequence(:title) { |n| "Account #{n}" }
    balance_cents { 0 }
    balance_currency { "BRL" }
    color { "#ffffff" }
  end
end
