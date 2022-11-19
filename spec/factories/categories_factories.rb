FactoryBot.define do
  factory :category do
    association :user

    sequence(:title) { |n| "Category #{n}" }
    color { "#ffffff" }
  end
end
