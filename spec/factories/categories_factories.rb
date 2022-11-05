FactoryBot.define do
  factory :category do
    sequence(:title) { |n| "Category #{n}" }
    color { "#ffffff" }
  end
end
