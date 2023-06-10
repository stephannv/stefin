FactoryBot.define do
  factory :transfer do
    from_account { nil }
    to_account { nil }
    amount_cents { 1 }
    amount_currency { "MyString" }
    occurred_on { "2023-04-25" }
    description { "MyString" }
  end
end
