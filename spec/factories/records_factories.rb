FactoryBot.define do
  factory :record do
    traits_for_enum :group, RecordGroups.to_h

    transient do
      user { create(:user) }
    end

    account { association :account, user: user }
    category { association :category, user: user }

    group { RecordGroups::EXPENSE }
    amount_cents { 1000 }
    amount_currency { "BRL" }
    occurred_on { "2022-11-01" }
    payee { "Someone" }
    description { "Some expense" }
  end
end
