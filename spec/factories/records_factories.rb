FactoryBot.define do
  factory :record do
    traits_for_enum :group, RecordGroups.list

    association :account
    association :category

    group { RecordGroups::EXPENSE }
    amount_cents { 1000 }
    amount_currency { "BRL" }
    occurred_on { "2022-11-01" }
    description { "Some expense" }
  end
end
